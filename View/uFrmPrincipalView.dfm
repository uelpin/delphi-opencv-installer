object frmPrincipalView: TfrmPrincipalView
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Delphi OpenCV Installer'
  ClientHeight = 255
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 255
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 128
    ExplicitTop = 80
    ExplicitWidth = 185
    ExplicitHeight = 41
    object btnInstall: TButton
      Left = 176
      Top = 116
      Width = 75
      Height = 25
      Caption = 'Install'
      TabOrder = 0
      OnClick = btnInstallClick
    end
  end
end
