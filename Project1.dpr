program Project1;

uses
  Forms,
  boughanem in 'boughanem.pas' {Adenane},
  frmInfo in 'frmInfo.pas' {formInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAdenane, Adenane);
  // Application.CreateForm(TformInfo, formInfo);
  Application.Run;
end.
