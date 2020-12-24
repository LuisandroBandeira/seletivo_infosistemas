unit dmRestApi;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter;

type
  TdmCepApi = class(TDataModule)
    RestCliCEP: TRESTClient;
    RestRequestCEP: TRESTRequest;
    RestResponseCEP: TRESTResponse;
    DtsAdpCEP: TRESTResponseDataSetAdapter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCepApi: TdmCepApi;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

end.
