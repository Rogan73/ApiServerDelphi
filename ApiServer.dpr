program ApiServer;

uses
  Vcl.Forms,
  Unit6 in 'Unit6.pas' {Form6},
  uAPIServer in 'uAPIServer.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Onyx Blue');
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
