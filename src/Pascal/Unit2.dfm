object Form8: TForm8
  Left = 310
  Top = 210
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20108#20803#19968#27425#26041#31243#35299#22120' V4.0'
  ClientHeight = 243
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 126
    Top = 26
    Width = 46
    Height = 40
    Caption = 'x +'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 241
    Top = 25
    Width = 46
    Height = 40
    Caption = 'y ='
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 124
    Top = 83
    Width = 46
    Height = 40
    Caption = 'x +'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 239
    Top = 83
    Width = 46
    Height = 40
    Caption = 'y ='
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = -5
    Top = 209
    Width = 468
    Height = 35
    Cursor = crArrow
    Hint = #22797#20301
    Caption = #27426' '#36814' '#20351' '#29992
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object Label5: TLabel
    Left = 318
    Top = 151
    Width = 96
    Height = 13
    Caption = #27880#65306#35831#21153#24517#20999#25442#21040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 339
    Top = 170
    Width = 75
    Height = 16
    Caption = #33521#25991#36755#20837#27861
  end
  object Label7: TLabel
    Left = 103
    Top = 87
    Width = 272
    Height = 33
    Caption = #35831#24744#27880#20876#21518#20877#25171#24320'!'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label8: TLabel
    Left = 38
    Top = 42
    Width = 5
    Height = 16
    Caption = '/'
  end
  object Label9: TLabel
    Left = 35
    Top = 54
    Width = 6
    Height = 16
    Caption = '|'
  end
  object a: TLabel
    Left = 32
    Top = 66
    Width = 5
    Height = 16
    Caption = '/'
  end
  object Label10: TLabel
    Left = 33
    Top = 77
    Width = 5
    Height = 16
    Caption = '\'
  end
  object Label11: TLabel
    Left = 35
    Top = 88
    Width = 6
    Height = 16
    Caption = '|'
  end
  object Label12: TLabel
    Left = 38
    Top = 100
    Width = 5
    Height = 16
    Caption = '\'
  end
  object Label13: TLabel
    Left = 407
    Top = 41
    Width = 12
    Height = 19
    Caption = #9312
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 407
    Top = 99
    Width = 12
    Height = 19
    Caption = #9313
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 63
    Top = 38
    Width = 57
    Height = 24
    Cursor = crIBeam
    Hint = #35831#36755#20837#25968#25454
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 178
    Top = 38
    Width = 57
    Height = 24
    Cursor = crIBeam
    Hint = #35831#36755#20837#25968#25454
    HelpType = htKeyword
    HelpKeyword = '1234432432'
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 293
    Top = 38
    Width = 97
    Height = 24
    Cursor = crIBeam
    Hint = #35831#36755#20837#25968#25454
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnKeyPress = Edit3KeyPress
  end
  object Edit4: TEdit
    Left = 64
    Top = 96
    Width = 57
    Height = 24
    Cursor = crIBeam
    Hint = #35831#36755#20837#25968#25454
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnKeyPress = Edit4KeyPress
  end
  object Edit5: TEdit
    Left = 176
    Top = 96
    Width = 57
    Height = 24
    Cursor = crIBeam
    Hint = #35831#36755#20837#25968#25454
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnKeyPress = Edit5KeyPress
  end
  object Edit6: TEdit
    Left = 291
    Top = 96
    Width = 99
    Height = 24
    Cursor = crIBeam
    Hint = #35831#36755#20837#25968#25454
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnKeyPress = Edit6KeyPress
  end
  object Button1: TButton
    Left = 176
    Top = 150
    Width = 97
    Height = 35
    Cursor = crHandPoint
    Hint = #36827#34892#35299#26041#31243
    Caption = #24320#22987#35745#31639
    Default = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 46
    Top = 160
    Width = 95
    Height = 17
    Cursor = crHandPoint
    Caption = #29992#24102#20998#25968#26174#31034
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object Panel1: TPanel
    Left = 308
    Top = 147
    Width = 113
    Height = 41
    Enabled = False
    TabOrder = 8
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 432
    object N1: TMenuItem
      Caption = ' '#25805#20316'(&A)'
      object N3: TMenuItem
        Caption = #24320#22987#35745#31639'(&D)'
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #22797#20301'(&E)'
        OnClick = N4Click
      end
      object D1: TMenuItem
        Caption = #29992#24102#20998#25968#26174#31034'(&F)'
        OnClick = D1Click
      end
      object D2: TMenuItem
        Caption = #20851#38381'(&G)'
        OnClick = D2Click
      end
    end
    object N2: TMenuItem
      Caption = ' '#24110#21161'(&B)'
      object N5: TMenuItem
        Caption = #20851#20110'(&H)'
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #25351#31034#25991#26412'(&I)'
        OnClick = N6Click
      end
    end
    object N7: TMenuItem
      Caption = '     '#26356#22810#23454#29992#23398#29983#23567#24037#20855#25964#35831#26399#24453'wakafa(&C)    '
      Default = True
    end
  end
end
