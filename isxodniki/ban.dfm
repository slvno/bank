object Form1: TForm1
  Left = 570
  Top = 118
  Width = 596
  Height = 502
  Caption = #1041#1072#1085#1082#1080#1088': '#1040#1085#1072#1083#1080#1079' '#1076#1086#1093#1086#1076#1085#1086#1089#1090#1080' '#1076#1077#1087#1086#1079#1080#1090#1085#1099#1093' '#1074#1082#1083#1072#1076#1086#1074' '#1074' '#1074#1072#1083#1102#1090#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid3: TDBGrid
    Left = 0
    Top = 326
    Width = 588
    Height = 111
    Align = alClient
    DataSource = DM.DataSource3
    PopupMenu = PopupMenu3
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'No'
        Title.Caption = #1053#1086#1084#1077#1088
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nr'
        Title.Caption = #1057#1074#1103#1079#1100' '#1089' '#1041#1044' '#1042#1082#1083#1072#1076#1099': '#1085#1072#1079#1074#1072#1085#1080#1077
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Srok'
        Title.Caption = #1057#1088#1086#1082' '#1093#1088#1072#1085#1077#1085#1080#1103', '#1084#1077#1089
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Min_summa'
        Title.Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1074#1079#1085#1086#1089#1072', $'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Max_summa'
        Title.Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1074#1079#1085#1086#1089#1072', $'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stavka'
        Title.Caption = #1055#1088#1086#1094#1077#1085#1090#1085#1072#1103' '#1089#1090#1072#1074#1082#1072', %'
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 437
    Width = 588
    Height = 19
    Panels = <>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 588
    Height = 56
    ButtonHeight = 49
    Caption = 'ToolBar1'
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 2
      Width = 90
      Height = 49
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1041#1044', '#1089#1086#1076#1077#1088#1078#1072#1097#1091#1102' '#13#10#1074#1089#1077' '#1074#1072#1083#1102#1090#1085#1099#1077' '#1074#1082#1083#1072#1076#1099
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1041#1044
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 90
      Top = 2
      Width = 90
      Height = 49
      Hint = #1047#1082#1088#1099#1090#1100' '#1041#1044', '#1089#1086#1076#1077#1088#1078#1072#1097#1091#1102' '#13#10#1074#1089#1077' '#1074#1072#1083#1102#1090#1085#1099#1077' '#1074#1082#1083#1072#1076#1099
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1041#1044
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 180
      Top = 2
      Width = 90
      Height = 49
      Hint = #1042#1099#1095#1080#1089#1083#1080#1090#1100' '#1085#1072#1080#1073#1086#1083#1100#1096#1080#1081' '#13#10#1076#1086#1093#1086#1076' '#1079#1072' 12 '#1084#1077#1089#1103#1094#1077#1074
      Caption = #1056#1072#1089#1095#1077#1090
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555550555
        555555555555F55555555505555A0555570555F55557F55555F55B50555A0555
        7B55575F5557F555575555B5055A5557B5555575F55755557555555B5550005B
        55555557555FFF575555555555AAA0055555555555777FF5555555555AAAAA00
        55555555577777FF55555000AAAAAAA050005FFF7777777F5FFFAAA5AAAAAAA0
        AAA577757777777F77755555AAAAAAA55555555577777775555555555AAAAA55
        55555555577777555555555705AAA55505555555F5777555F555557B5555055B
        505555575555F5575F5557B5555A0555B50555755557F55575F55B55555A0555
        5B5557555557F55557555555555A555555555555555755555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton3Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 56
    Width = 588
    Height = 270
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 136
      Width = 586
      Height = 133
      Align = alClient
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 584
        Height = 131
        Align = alClient
        DataSource = DM.DataSource2
        PopupMenu = PopupMenu2
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'No'
            Title.Caption = #1053#1086#1084#1077#1088
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1082#1083#1072#1076#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nr'
            Title.Caption = #1057#1074#1103#1079#1100' '#1089' '#1041#1044' '#1041#1072#1085#1082#1080
            Visible = False
          end>
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 586
      Height = 135
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 586
        Height = 135
        Align = alClient
        DataSource = DM.DataSource1
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'No'
            Title.Caption = #1053#1086#1084#1077#1088
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
            Visible = True
          end>
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 410
    object N1: TMenuItem
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
      object N2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        ShortCut = 32856
        OnClick = N2Click
      end
      object N12: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        ShortCut = 112
        OnClick = N12Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 11
    Top = 75
    object N3: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1073#1072#1085#1082
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1073#1072#1085#1082
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1073#1072#1085#1082
      OnClick = N5Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 11
    Top = 210
    object N6: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1074#1082#1083#1072#1076
      OnClick = N6Click
    end
    object N8: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1074#1082#1083#1072#1076#1072
      OnClick = N8Click
    end
    object N7: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1082#1083#1072#1076
      OnClick = N7Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 15
    Top = 345
    object N9: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1091#1073#1074#1082#1083#1072#1076
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1091#1073#1074#1082#1083#1072#1076
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1091#1073#1074#1082#1083#1072#1076
      OnClick = N11Click
    end
  end
end
