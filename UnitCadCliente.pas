unit UnitCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.WinXPanels, Vcl.Buttons;

type
  TFrmCadCliente = class(TForm)
    dsCliente: TDataSource;
    cdsCliente: TFDMemTable;
    DBNavigator1: TDBNavigator;
    pgCliente: TPageControl;
    tbListaClientes: TTabSheet;
    tbDadosCliente: TTabSheet;
    gradeClientes: TDBGrid;
    pnlDadosBaseCliente: TPanel;
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblIdentidade: TLabel;
    edtIdentidade: TDBEdit;
    lblCPF: TLabel;
    edtCPF: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    edtEmail: TDBEdit;
    lblEmail: TLabel;
    pnlEnderecoCliente: TPanel;
    lblCEP: TLabel;
    edtCEP: TDBEdit;
    lblLogradouro: TLabel;
    edtLogradouro: TDBEdit;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblCidade: TLabel;
    edtCidade: TDBEdit;
    lblEstado: TLabel;
    edtEstado: TDBEdit;
    lblPais: TLabel;
    edtPais: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure dsClienteStateChange(Sender: TObject);
    procedure pgClienteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure edtCEPExit(Sender: TObject);
    procedure cdsClienteAfterPost(DataSet: TDataSet);
    procedure cdsClienteBeforePost(DataSet: TDataSet);
    /// <summary>
    /// <para>M�todo: edtSomenteNumero</para>
    /// <para>Descri��o: Envento utilizado OnkeyPress dos TDbEdit que obriga
    /// o preenchimento do campo somente com numeros.</para>
    /// </summary>
    /// <param name="Sender: TObject"></param>
    /// <param name="Key: Char"></param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure edtSomenteNumero(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    /// <summary>
    /// <para>M�todo: criaCampoTabelaCliente</para>
    /// <para>Descri��o: Cria os campos do cdsCliente (TFDMemTable) em tempo de execu��o.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure criaCampoTabelaCliente;
    /// <summary>
    /// <para>M�todo: preparaDatasetClientes</para>
    /// <para>Descri��o:  Prepara o cdsCliente (TFDMemTable) para uso.</para>
    /// <para>O TFDMemTable me permite maninupular os dados de clientes em mem�ria,
    /// assim podendo utilizar os recusos de maminupal��o de um dataset,
    /// sem precisar de uma base de dados ou arquivo.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure preparaDatasetClientes;
    /// <summary>
    /// <para>M�todo: visibilidadeColunasGradeClientes</para>
    /// <para>Descri��o: Muda a visibilidade das colunas da grade de dados da lista
    ///  de clientes que corresponde ao endere�o do cliente para FALSE.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns></returns>
    procedure visibilidadeColunasGradeClientes;
    /// <summary>
    /// <para>M�todo: validaCEP</para>
    /// <para>Descri��o: V�lida CEP informado pelo usu�rio</para>
    /// </summary>
    /// <param name="aCEP: string"></param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>Boolean</returns>
    function validaCEP(aCEP : string) : Boolean;
    /// <summary>
    /// <para>M�todo: enviaEmailCadCliente</para>
    /// <para>Descri��o: Envia o email com os dados cadastrados para o e-mail informado na tela de cadastro.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    procedure enviaEmailCadCliente;
    /// <summary>
    /// <para>M�todo: montaConteudoEmail</para>
    /// <para>Descri��o: Monta o conteudo do email com os dados informados na tela de cadastro.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>TstringList : Retorna uma StringList com o conteudo para o e-mail.</returns>
    function montaConteudoEmail : TstringList;
    /// <summary>
    /// <para>M�todo: montaXML</para>
    /// <para>Descri��o: Monta o arquivo de XML com os dados do cliente utilizado
    ///  como anexo no email enviado para o cliente.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>String : Retorna uma String no forma XML</returns>
    function montaXML : string;
    /// <summary>
    /// <para>M�todo: validaCampos</para>
    /// <para>Descri��o: Verifica se os campos obrigat�rios foram preenchidos.</para>
    /// </summary>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>boolean : Retorna False se hover campo que n�o foi preenchido.</returns>
    function validaCampos : boolean;
    /// <summary>
    /// <para>M�todo: validaEMail</para>
    /// <para>Descri��o: V�lida o preenchimento do e-mail cliente</para>
    /// </summary>
    /// <param name="aEmail: PChar"></param>
    /// <remarks>
    /// <para>-------------------------------------------------------</para>
    /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
    /// <para>-------------------------------------------------------</para>
    /// </remarks>
    /// <returns>Boolean : Retorna TRue se e-mail for validado.</returns>
    function validaEMail(aEmail: PChar): Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadCliente: TFrmCadCliente;

implementation

uses
  dmRestApi, System.JSON, UnitEnderecoCep, UnitEmail, Firedac.stan.StorageXML, XMLDoc, XMLIntf;

{$R *.dfm}

procedure TFrmCadCliente.cdsClienteAfterPost(DataSet: TDataSet);
begin
  // Ap�s salvar os dados do cliente um e-mail � enviado para o cliente com as informa��es do cadstro cliente
  try

    enviaEmailCadCliente;

    Application.MessageBox('Cadastro conclu�do com sucesso!' + #13#10 +
                           'Dentro de instantes uma mensagem ser� enviada para o e-mail do cadastro.',
                           'Infosistema - Cad Cliente', MB_OK + MB_ICONINFORMATION);

    pgCliente.ActivePage := tbListaClientes;

  except on E:Exception do

    Application.MessageBox('Cadastro conclu�do com ressalvas!'+ #13#10 +
                           'N�o foi possivel enviar e-mail para conta.'+ #13#10 +
                           'Verifique se o e-mail foi cadastrado corretamente.',
                           'Infosistema - Cad Cliente',   MB_OK + MB_ICONWARNING);
  end;
end;

procedure TFrmCadCliente.cdsClienteBeforePost(DataSet: TDataSet);
begin
 // N�o permite salvar enquanto n�o validar os campos obrigat�rios
 if not validaCampos then
   Abort;
end;

procedure TFrmCadCliente.criaCampoTabelaCliente;
begin
  cdsCliente.FieldDefs.Add('Nome', ftString, 50, True);         // FieldNo - 1
  cdsCliente.FieldDefs.Add('Identidade', ftString, 10, True);   // FieldNo - 2
  cdsCliente.FieldDefs.Add('CPF', ftString, 11, True);          // FieldNo - 3
  cdsCliente.FieldDefs.Add('Telefone', ftString, 13, True);     // FieldNo - 4
  cdsCliente.FieldDefs.Add('Email', ftString, 30, True);        // FieldNo - 5
  //endere�o do cliente
  cdsCliente.FieldDefs.Add('CEP', ftString, 8, True);           // FieldNo - 6
  cdsCliente.FieldDefs.Add('Logradouro', ftString, 100, True);  // FieldNo - 7
  cdsCliente.FieldDefs.Add('Numero', ftString, 10, True);       // FieldNo - 8
  cdsCliente.FieldDefs.Add('Complemento', ftString, 50, False); // FieldNo - 9
  cdsCliente.FieldDefs.Add('Bairro', ftString, 30, True);       // FieldNo - 10
  cdsCliente.FieldDefs.Add('Cidade', ftString, 30, True);       // FieldNo - 11
  cdsCliente.FieldDefs.Add('Estado', ftString, 2, True);        // FieldNo - 12
  cdsCliente.FieldDefs.Add('Pais', ftString, 20, True);         // FieldNo - 13
end;

procedure TFrmCadCliente.dsClienteStateChange(Sender: TObject);
begin
   // Se o cdsCliente entrar em modo de inser��o ou edi��o a aba dos
   // dados do cliente � ativada permitindo o cadstro ou a edi��o de um cliente,
   if dsCliente.State in dsEditModes then
   begin
     pgCliente.ActivePage := tbDadosCliente;
     edtNome.SetFocus;
   end;
end;

procedure TFrmCadCliente.edtCEPExit(Sender: TObject);
begin
  if not validaCEP(edtCEP.Text) then
    Application.MessageBox('CEP inv�lido!', 'Infosistema - Cad Cliente', MB_OK + MB_ICONWARNING);
end;

procedure TFrmCadCliente.edtSomenteNumero(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',']) then
    key :=#0;
end;

procedure TFrmCadCliente.enviaEmailCadCliente;
begin
  TEmail.EnviarEmail('Infosistemas - Cadastro Cliente '+ cdsCliente.FieldByName('Nome').AsString,
                      cdsCliente.FieldByName('Email').AsString,
                      montaXML,
                      montaConteudoEmail);
end;

procedure TFrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if  dsCliente.State in dsEditModes then
  begin
    if Application.MessageBox('Os dados do Cliente n�o foram salvos!' + #13#10 +
                              'Deseja fechar o sistema sem salvar os dados?',
                              'Infosistema - Cad Cliente',
                               MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDNO then
    begin
      Abort;
    end;
  end;
end;

procedure TFrmCadCliente.FormShow(Sender: TObject);
begin
 preparaDatasetClientes();
 pgCliente.ActivePage := tbListaClientes;
end;

function TFrmCadCliente.montaConteudoEmail: TStringList;
var
  campo : TField;
begin
  //cabe�alho HTML do conteudo do e-mail
  Result := TStringList.Create();
  Result.Add('<html xmlns="http://www.w3.org/1999/xhtml">');
  Result.Add('<body>');
  Result.Add('<h4>Dados do Cadastro:</h4>');

  //Monta a lista dos dados do cliente
  for campo in cdsCliente.Fields do
  begin
    if campo.FieldNo < 6 then
    begin
    if campo.FieldNo = 1 then
      Result.Add('<ul>');
      Result.Add('<li><b>'+campo.DisplayName + ':</b> '+ campo.AsString + '</li>');
    end
    else
    begin
      // sub-lista coms os dados do endere�o do cliente
      if campo.FieldNo = 6 then
      begin
        Result.Add('<li><b>Endere�o:</b></li>');
        Result.Add('<ul>');
      end;
      Result.Add('<li><b>'+campo.DisplayName + ':</b> '+ campo.AsString + '</li>');
    end;
  end;
  // fecha o HTML do conteudo do email
  Result.Add('</ul>');
  Result.Add('</ul>');
  Result.Add('</body>');
  Result.Add('</html>');
end;

function TFrmCadCliente.montaXML: string;
var
  XMLDocument: TXMLDocument;
  NodeTabela, NodeRegistro, NodeEndereco: IXMLNode;
  campo : TField;
begin
  // prepara o caminho do arquivo XML
  Result := ExtractFilePath(ParamStr(0))+'\cliente.xml';
  XMLDocument := TXMLDocument.Create(Self);
  try
    XMLDocument.Active := True;
    NodeTabela := XMLDocument.AddChild('Cliente');
    for campo in cdsCliente.Fields do
    begin
      if campo.FieldNo < 6 then
      begin
        if campo.FieldNo = 1 then
          NodeRegistro := NodeTabela.AddChild('Registro');
        NodeRegistro.ChildValues[campo.DisplayName] := campo.AsString;
      end
      else
      begin
        if campo.FieldNo = 6 then
          NodeEndereco := NodeRegistro.AddChild('Endereco');
        NodeEndereco.ChildValues[campo.DisplayName] := campo.AsString;
      end;
    end;
    XMLDocument.SaveToFile(Result);
  finally
    XMLDocument.Free;
  end;
end;

procedure TFrmCadCliente.pgClienteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  //N�o permite sair da aba de dados do cadastro enquando estiver em inser��o ou edi��o de clientes;
  AllowChange := not (dsCliente.State in dsEditModes);
  if not AllowChange then
  begin
    Application.MessageBox('Os dados do cliente n�o foram salvos!' + #13#10 +
      'Salve os dados antes sair ou cancele as altera��es.', 'Infosistemas - Cad. Clientes', MB_OK +
      MB_ICONWARNING);
  end;
end;

procedure TFrmCadCliente.preparaDatasetClientes;
begin
 criaCampoTabelaCliente();
 cdsCliente.CreateDataSet;
 cdsCliente.Open;
 visibilidadeColunasGradeClientes();
end;

function TFrmCadCliente.validaCampos: boolean;
var
  campo : TField;
  msg : string;
begin
  Result := True;
  msg := 'Alguns campos n�o foram validados:'+ #13#10;
  for campo in cdsCliente.Fields do
  begin

    // verifica se os campos obrigat�rio foram preenchidos
    if (campo.Required) and ( Trim(campo.AsString) = EmptyStr) then
    begin
      msg := msg + ' - ' + campo.DisplayName + ' (Campo Obrigat�rio)' + #13#10;
      Result := False;
    end
    else
    // verifica se o e-mail � v�lido
    if (campo.FieldName = 'Email') and (not validaEMail(PChar(campo.AsString))) then
    begin
      msg := msg + ' - ' + campo.DisplayName + ' (E-mail inv�lido)' + #13#10;
      Result := False;
    end
    else
    // verifica se CPF tem 11 digitos
    if (campo.FieldName = 'CPF') and (Length(campo.AsString) < 11) then
    begin
      msg := msg + ' - ' + campo.DisplayName + ' (CPF deve ter 11 d�gitos)' + #13#10;
      Result := False;
    end

  end;
  if not Result then
    Application.MessageBox(PChar(msg),'Infosistema - Cad Cliente', MB_OK + MB_ICONWARNING);
end;

function TFrmCadCliente.validaCEP(aCEP: string): Boolean;
var
 mEnderecoCEP : TEnderecoCep;
begin
  Result := True;

  if Length(aCEP) < 8 then
  begin
    Result := False;
    Exit
  end;

  try
    try
      with dmCepApi do
      begin
        // Pega o valor do CEP e faz a requisi��o na api https://viacep.com.br/
        RestRequestCEP.Params.ParameterByName('cep').Value := aCEP;
        RestRequestCEP.Execute;

        // Instancia a classe que cont�m as propriedades de endere�o que receberam os dados do Json
        mEnderecoCEP := TEnderecoCep.Create();
        mEnderecoCEP.AsJson := TEnderecoCep.PrettyPrintJSON(RestResponseCEP.Content.Trim);

        // Se o resultado do CEP estiver correto, atribu� aos campos de endere�o da tela.
        if (RestResponseCEP.Status.Success) and (not mEnderecoCEP.erro) then
        begin
          cdsCliente.FieldByName('Logradouro').AsString  := mEnderecoCEP.Logradouro;
          cdsCliente.FieldByName('Complemento').AsString := mEnderecoCEP.Complemento;
          cdsCliente.FieldByName('Bairro').AsString      := mEnderecoCEP.Bairro;
          cdsCliente.FieldByName('Cidade').AsString      := mEnderecoCEP.Localidade;
          cdsCliente.FieldByName('Estado').AsString      := mEnderecoCEP.Uf;
          // Se tem CEP � Brasil
          cdsCliente.FieldByName('Pais').AsString        := 'Brasil';
        end
        else
          Result := False;
      end;
    except
      Result := False;
    end;
  finally
    if Assigned(mEnderecoCEP) then
      mEnderecoCEP.Free;
  end;
end;

function TFrmCadCliente.validaEMail(aEmail: PChar): Boolean;
const
  CaraEsp: array[1..40] of string[1] =
  ( '!','#','$','%','�','&','*',
  '(',')','+','=','�','�','�','�','�',
  '�','�','�','`','�','�',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  '�','�','�');
var
  i, cont , posFim , ponto, arroba  : integer;
begin

  Result := True;

  cont := 0;

  ponto := Pos('.', aEMail);
  arroba := Pos('@', aEMail);

  // pega possi��o do �ltimo caractere do email
  posFim := Length(aEMail);

  if aEMail <> '' then
    // verifica se existe @ .
    if (Pos('@', aEMail)<>0) and (Pos('.', aEMail)<>0) then
    begin

      // verifica se tem @ ou . ou espa�o no inicio ou no fim do email
      if (Pos('@', aEMail)=1) or (Pos('@', aEMail) = posFim) or (Pos('.', aEMail)=1) or (Pos('.', aEMail) = posFim) or (Pos(' ', aEMail)<>0) then
        Result := False
      else

        // verifica se tem @ seguido de . e vice-versa
        if (abs(Pos('@', aEMail) - Pos('.', aEMail)) = 1) then
          Result := False
        else
          begin

            for i := 1 to 40 do
            begin
              // verifica se existe Caracter Especial
              if Pos(CaraEsp[i], aEMail)<>0 then
                Result := False;
            end;

            for i := 0 to posFim-1 do
            begin

              // verifica se existe apenas um @
              if aEMail[i] = '@' then
                cont := cont + 1;

              // verifica se existe . seguidos de .
              if (aEMail[i] = '.') and (aEMail[i+1] = '.') then
                Result := false;

            end;

            // verifica se tem . no final do e-mail, sem tem 2 ou + @, se tem . no inicio, se tem - no inicio, se tem _ no inicio
            if ( cont >= 2 ) or
               ( aEMail[posFim - 1] = '.' ) or
               ( aEMail[0] = '.' ) or
               ( aEMail[0] = '_' ) or
               ( aEMail[0] = '-' ) then
                Result := false;

            // @ seguido de COM e vice-versa
            if (abs(Pos('@', aEMail) - Pos('com', aEMail)) = 1) then
              Result := False;

            // @ seguido de - e vice-versa
            if (abs(Pos('@', aEMail) - Pos('-', aEMail)) = 1) then
              Result := False;

            // @ seguido de _ e vice-versa
            if (abs(Pos('@', aEMail) - Pos('_', aEMail)) = 1) then
              Result := False;
          end;
    end
    else
      Result := False;
end;

procedure TFrmCadCliente.visibilidadeColunasGradeClientes;
var
  i : Integer;
begin
   for i := 5 to gradeClientes.FieldCount - 1 do
    gradeClientes.Columns[i].Visible:= False;
end;

end.
