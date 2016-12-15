object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Equationer'
  ClientHeight = 270
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object MainMenu1: TMainMenu
    Top = 232
    object N1: TMenuItem
      Caption = #25805#20316
      Hint = 'Operation'
      object N3: TMenuItem
        Caption = #24320#22987#35745#31639
      end
      object N4: TMenuItem
        Caption = #22797#20301
      end
      object N5: TMenuItem
        Caption = #29992#24102#20998#25968#26174#31034
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #20851#38381
        OnClick = N6Click
      end
    end
    object N2: TMenuItem
      Caption = #24110#21161
      Hint = 'Help'
      object N7: TMenuItem
        Caption = #20851#20110
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #35775#38382#20316#32773#20027#39029
        OnClick = N8Click
      end
    end
    object UnabledItem: TMenuItem
      Caption = '      '#38656#35201#26356#22810#25903#25345#65292#35831#32852#31995'wakafa'
      Enabled = False
    end
  end
end
