unit UnitEmail;

interface

uses Vcl.Forms, System.SysUtils, System.Classes, IniFiles, IdComponent, IdTCPConnection,
     IdTCPClient, IdHTTP, IdBaseComponent, IdMessage, IdExplicitTLSClientServerBase,
     IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,  Winapi.Windows,
     IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdAttachmentFile, IdAttachmentMemory, IdText;

type
  TEmail = class
  public
    /// <summary>
    /// <para>Método: EnviarEmail</para>
    /// <para>Descrição: Envia uma mensagem para o e-mail passado por parâmentro.</para>
    /// <para>IMPORTANTE : Este método faz uso do arquivo de configuração email_config.ini</para>
    /// <para>Esse arquivo contém as configurações do remetente do e-mail,
    /// e pode ser editado para utilizar outro remetente de e-mail.</para>
    /// </summary>
    /// <param name="AAssunto: String">Assunto do e-mail.</param>
    /// <param name="ADestino: String">E-mail para quem será enviado os dados.</param>
    /// <param name="AAnexo: String">Local do arquivo XML que será anexado no e-mail.
    /// <para>(Esse arquivo é temporário e será apago após o envio do e-mail).</para></param>
    /// <param name="ACorpo: TStrings">Conteudo do e-mail.</param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>Boolean</returns>
    class function EnviarEmail(const AAssunto, ADestino, AAnexo: String; ACorpo: TStrings): Boolean;
  end;


implementation


{ TEmail }

class function TEmail.EnviarEmail(const AAssunto, ADestino, AAnexo: string; ACorpo: TStrings): Boolean;
var
  IniFile              : TIniFile;
  sFrom                : String;
  sBccList             : String;
  sCcList              : String;
  sHost                : String;
  iPort                : Integer;
  sUserName            : String;
  sPassword            : String;

  idMsg                : TIdMessage;
  IdText               : TIdText;
  idSMTP               : TIdSMTP;
  IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    try
      //Criação e leitura do arquivo INI com as configurações
      IniFile                          := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'email_config.ini');
      sFrom                            := IniFile.ReadString('Email' , 'From'     , sFrom);
      sBccList                         := IniFile.ReadString('Email' , 'BccList'  , sBccList);
      sCcList                          := IniFile.ReadString('Email' , 'CcList'   , sCcList);
      sHost                            := IniFile.ReadString('Email' , 'Host'     , sHost);
      iPort                            := IniFile.ReadInteger('Email', 'Port'     , iPort);
      sUserName                        := IniFile.ReadString('Email' , 'UserName' , sUserName);
      sPassword                        := IniFile.ReadString('Email' , 'Password' , sPassword);

      //Configura os parâmetros necessários para SSL
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create();
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode  := sslmClient;

      //Variável referente a mensagem
      idMsg                            := TIdMessage.Create();
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := 'Infosistemas - Cadastro Cliente - Seletivo Luisandro';
      idMsg.From.Address               := sFrom;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := AAssunto;

      //Add Destinatário(s)
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := ADestino;
      idMsg.BccList.EMailAddresses    := sBccList; //Com Cópia Oculta
      idMsg.CcList.EMailAddresses     := sCcList; //Com Cópia

      //Variável do texto
      idText := TIdText.Create(idMsg.MessageParts);
      idText.Body.Add(ACorpo.Text);
      idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

      //Prepara o Servidor
      IdSMTP                           := TIdSMTP.Create();
      IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS                    := utUseImplicitTLS;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Host                      := sHost;
      IdSMTP.Port                      := iPort;
      IdSMTP.Username                  := sUserName;
      IdSMTP.Password                  := sPassword;

      //Conecta e Autentica
      IdSMTP.Connect;
      IdSMTP.Authenticate;

      // Adicona o anexo com os dados do cliente
      if AAnexo <> EmptyStr then
        if FileExists(AAnexo) then
          TIdAttachmentFile.Create(idMsg.MessageParts, AAnexo);

      //Se a conexão foi bem sucedida, envia a mensagem
      if IdSMTP.Connected then
      begin
        IdSMTP.Send(idMsg);
      end;

      //Depois de tudo pronto, desconecta do servidor SMTP
      if IdSMTP.Connected then
        IdSMTP.Disconnect;

      Result := True;
    except on e:Exception do
      begin
        Result := False;
        raise Exception.Create('Erro ao tentar enviar email: ' + #13#10 +E.Message);
      end;
    end;
  finally
    // apaga o arquivo usado como anexo no e-mail
    if FileExists(AAnexo) then
      DeleteFile(PChar(AAnexo));

    IniFile.Free;

    UnLoadOpenSSLLibrary;

    FreeAndNil(idMsg);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(idSMTP);
  end;

end;


end.
