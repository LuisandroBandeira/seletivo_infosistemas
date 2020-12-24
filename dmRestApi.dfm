object dmCepApi: TdmCepApi
  OldCreateOrder = False
  Height = 163
  Width = 301
  object RestCliCEP: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://viacep.com.br'
    Params = <
      item
      end>
    Left = 40
    Top = 23
  end
  object RestRequestCEP: TRESTRequest
    Client = RestCliCEP
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'cep'
        Options = [poAutoCreated]
        Value = '01001000'
      end>
    Resource = 'ws/{cep}/json'
    Response = RestResponseCEP
    SynchronizedEvents = False
    Left = 120
    Top = 24
  end
  object RestResponseCEP: TRESTResponse
    ContentType = 'application/json'
    Left = 216
    Top = 24
  end
  object DtsAdpCEP: TRESTResponseDataSetAdapter
    FieldDefs = <>
    Response = RestResponseCEP
    Left = 40
    Top = 87
  end
end
