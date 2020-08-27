program PjrDelphiOpenCvInstaller;

uses
  Vcl.Forms,
  uFrmPrincipalView in 'View\uFrmPrincipalView.pas' {frmPrincipalView},
  uPrincipalControl in 'Controlle\uPrincipalControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalView, frmPrincipalView);
  Application.Run;
end.
