unit uPrincipalControl;

interface
uses ShellAPI, Winapi.Windows, Winapi.Messages, System.SysUtils, StrUtils, Vcl.Forms;
type
 TPrincipalControl = class
 private
   function ShellExecAndWait(showMode: integer; comando: PWideChar) : Boolean;
 public

   procedure downloadRepositories;
   procedure unzipRepositories;
 end;

implementation

{ TPrincipalControl }

procedure TPrincipalControl.downloadRepositories;
begin
  ForceDirectories('C:\Components');
  ForceDirectories('C:\Components\Downloads');
  ForceDirectories('C:\Components\Delphi-OpenCV');


  ShellExecAndWait(1,PChar('/c pushd C:\&                             '+
                           'cd Components\Downloads&                  '+
                           'curl -fsSLo C:\Components\Downloads\'      +
                           'Delphi-OpenCV.tar.gz https://github.com'   +
                           '/Laex/Delphi-OpenCV/tarball/master'       ));

  ShellExecAndWait(1,PChar('/c pushd C:\&                             '+
                           'cd Components\Downloads&                  '+
                           'curl -fsSLo C:\Components\Downloads\'      +
                           'Delphi-FFMPEG.tar.gz https://github.com'   +
                           '/Laex/Delphi-FFMPEG/tarball/master'       ));

end;

function TPrincipalControl.ShellExecAndWait(showMode: integer;
  comando: PWideChar): Boolean;
var
  shell: TShellExecuteInfo;
  codigoSaida: DWORD;
begin
  FillChar(shell, SizeOf(shell), 0) ;
  shell.cbSize := SizeOf(TShellExecuteInfo) ;

  with shell do
  begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpVerb := nil;
    lpFile := 'cmd.exe';
    lpParameters := PChar(comando);
    nShow := showMode;
  end;

  if ShellExecuteEx(@shell) then
  begin
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(shell.hProcess, codigoSaida);
    until not(codigoSaida = STILL_ACTIVE);

    Result := True;
  end else
    Result := False;

end;

procedure TPrincipalControl.unzipRepositories;
begin
  ShellExecAndWait(1,PChar('/c pushd C:\&                                         '+
                           'cd Components\Downloads&                              '+
                           'tar -zxf C:\Components\Downloads\Delphi-OpenCV.tar.gz '+
                           '--strip-components 1 -C C:\Components\Delphi-OpenCV   '));

  ShellExecAndWait(1,PChar('/c pushd C:\&                                         '+
                           'cd Components\Downloads&                              '+
                           'tar -zxf C:\Components\Downloads\Delphi-FFMPEG.tar.gz '+
                           '--strip-components 1 -C C:\Components\Delphi-OpenCV\'+
                           'Delphi-FFMPEG '));

end;

end.
