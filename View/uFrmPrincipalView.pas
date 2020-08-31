unit uFrmPrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uPrincipalControl;

type
  TfrmPrincipalView = class(TForm)
    pnPrincipal: TPanel;
    btnInstall: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnInstallClick(Sender: TObject);
  private
    procedure Install;
  public
    { Public declarations }
  end;

var
  frmPrincipalView: TfrmPrincipalView;
  principalControl: TprincipalControl;

implementation

{$R *.dfm}

{ TfrmPrincipalView }

procedure TfrmPrincipalView.btnInstallClick(Sender: TObject);
begin
  Install;
end;

procedure TfrmPrincipalView.FormCreate(Sender: TObject);
begin
  principalControl := TprincipalControl.Create;
end;

procedure TfrmPrincipalView.Install;
begin
  principalControl.downloadRepositories;
  principalControl.unzipRepositories;
end;

end.
