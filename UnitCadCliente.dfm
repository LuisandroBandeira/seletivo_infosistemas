object FrmCadCliente: TFrmCadCliente
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Infosistemas - Cadastro de Clientes'
  ClientHeight = 409
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 370
    Width = 625
    Height = 39
    DataSource = dsCliente
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Align = alBottom
    TabOrder = 0
  end
  object pgCliente: TPageControl
    Left = 0
    Top = 0
    Width = 625
    Height = 370
    ActivePage = tbDadosCliente
    Align = alClient
    TabOrder = 1
    OnChanging = pgClienteChanging
    object tbListaClientes: TTabSheet
      Caption = 'Lista de Clientes'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gradeClientes: TDBGrid
        Left = 0
        Top = 0
        Width = 617
        Height = 342
        Align = alClient
        DataSource = dsCliente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tbDadosCliente: TTabSheet
      Caption = 'Dados do Cliente'
      ImageIndex = 1
      object pnlDadosBaseCliente: TPanel
        Left = 0
        Top = 0
        Width = 617
        Height = 145
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object lblNome: TLabel
          Left = 43
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblIdentidade: TLabel
          Left = 18
          Top = 64
          Width = 56
          Height = 13
          Caption = 'Identidade:'
        end
        object lblCPF: TLabel
          Left = 218
          Top = 64
          Width = 23
          Height = 13
          Caption = 'CPF:'
        end
        object lblTelefone: TLabel
          Left = 378
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Telefone:'
        end
        object lblEmail: TLabel
          Left = 46
          Top = 101
          Width = 28
          Height = 13
          Caption = 'Email:'
        end
        object edtNome: TDBEdit
          Left = 80
          Top = 21
          Width = 471
          Height = 21
          DataField = 'Nome'
          DataSource = dsCliente
          TabOrder = 0
        end
        object edtIdentidade: TDBEdit
          Left = 80
          Top = 61
          Width = 121
          Height = 21
          DataField = 'Identidade'
          DataSource = dsCliente
          TabOrder = 1
          OnKeyPress = edtSomenteNumero
        end
        object edtCPF: TDBEdit
          Left = 247
          Top = 61
          Width = 121
          Height = 21
          DataField = 'CPF'
          DataSource = dsCliente
          TabOrder = 2
          OnKeyPress = edtSomenteNumero
        end
        object edtTelefone: TDBEdit
          Left = 430
          Top = 61
          Width = 121
          Height = 21
          DataField = 'Telefone'
          DataSource = dsCliente
          TabOrder = 3
          OnKeyPress = edtSomenteNumero
        end
        object edtEmail: TDBEdit
          Left = 80
          Top = 98
          Width = 288
          Height = 21
          DataField = 'Email'
          DataSource = dsCliente
          TabOrder = 4
        end
      end
      object pnlEnderecoCliente: TPanel
        Left = 0
        Top = 145
        Width = 617
        Height = 197
        Align = alClient
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 1
        object lblCEP: TLabel
          Left = 46
          Top = 19
          Width = 23
          Height = 13
          Caption = 'CEP:'
        end
        object lblLogradouro: TLabel
          Left = 213
          Top = 19
          Width = 59
          Height = 13
          Caption = 'Logradouro:'
        end
        object lblNumero: TLabel
          Left = 28
          Top = 62
          Width = 41
          Height = 13
          Caption = 'Numero:'
        end
        object lblComplemento: TLabel
          Left = 203
          Top = 62
          Width = 69
          Height = 13
          Caption = 'Complemento:'
        end
        object lblBairro: TLabel
          Left = 37
          Top = 103
          Width = 32
          Height = 13
          Caption = 'Bairro:'
        end
        object lblCidade: TLabel
          Left = 235
          Top = 103
          Width = 37
          Height = 13
          Caption = 'Cidade:'
        end
        object lblEstado: TLabel
          Left = 32
          Top = 142
          Width = 37
          Height = 13
          Caption = 'Estado:'
        end
        object lblPais: TLabel
          Left = 249
          Top = 142
          Width = 23
          Height = 13
          Caption = 'Pais:'
        end
        object edtCEP: TDBEdit
          Left = 75
          Top = 16
          Width = 126
          Height = 21
          DataField = 'Cep'
          DataSource = dsCliente
          TabOrder = 0
          OnExit = edtCEPExit
          OnKeyPress = edtSomenteNumero
        end
        object edtLogradouro: TDBEdit
          Left = 278
          Top = 16
          Width = 273
          Height = 21
          DataField = 'Logradouro'
          DataSource = dsCliente
          TabOrder = 1
        end
        object edtNumero: TDBEdit
          Left = 75
          Top = 59
          Width = 79
          Height = 21
          DataField = 'Numero'
          DataSource = dsCliente
          TabOrder = 2
        end
        object edtComplemento: TDBEdit
          Left = 278
          Top = 59
          Width = 273
          Height = 21
          DataField = 'Complemento'
          DataSource = dsCliente
          TabOrder = 3
        end
        object edtBairro: TDBEdit
          Left = 75
          Top = 100
          Width = 126
          Height = 21
          DataField = 'Bairro'
          DataSource = dsCliente
          TabOrder = 4
        end
        object edtCidade: TDBEdit
          Left = 278
          Top = 100
          Width = 273
          Height = 21
          DataField = 'Cidade'
          DataSource = dsCliente
          TabOrder = 5
        end
        object edtEstado: TDBEdit
          Left = 75
          Top = 139
          Width = 126
          Height = 21
          DataField = 'Estado'
          DataSource = dsCliente
          TabOrder = 6
        end
        object edtPais: TDBEdit
          Left = 278
          Top = 139
          Width = 126
          Height = 21
          DataField = 'Pais'
          DataSource = dsCliente
          TabOrder = 7
        end
      end
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    OnStateChange = dsClienteStateChange
    Left = 520
    Top = 120
  end
  object cdsCliente: TFDMemTable
    BeforePost = cdsClienteBeforePost
    AfterPost = cdsClienteAfterPost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 464
    Top = 120
  end
end
