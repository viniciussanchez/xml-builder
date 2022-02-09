program Samples;

uses
  Vcl.Forms,
  Xml.Builder.Samples.Delphi in 'Xml.Builder.Samples.Delphi.pas' {FrmSamples};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSamples, FrmSamples);
  Application.Run;
end.
