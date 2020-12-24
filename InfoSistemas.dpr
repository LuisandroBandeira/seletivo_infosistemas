program InfoSistemas;

uses
  Vcl.Forms,
  UnitCadCliente in 'UnitCadCliente.pas' {FrmCadCliente},
  dmRestApi in 'dmRestApi.pas' {dmCepApi: TDataModule},
  UnitEnderecoCep in 'UnitEnderecoCep.pas',
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  UnitEmail in 'UnitEmail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Infosistemas - Seletivo - Luisandro';
  Application.CreateForm(TFrmCadCliente, FrmCadCliente);
  Application.CreateForm(TdmCepApi, dmCepApi);
  Application.Run;
end.
