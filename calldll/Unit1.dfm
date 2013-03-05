object Form1: TForm1
  Left = 459
  Top = 325
  Width = 428
  Height = 274
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 8
    Top = 8
    Width = 393
    Height = 145
    TabOrder = 4
    object lblTradeType: TLabel
      Left = 96
      Top = 24
      Width = 60
      Height = 13
      Caption = #20132#26131#31867#22411#65306
    end
    object lblPayType: TLabel
      Left = 96
      Top = 51
      Width = 60
      Height = 13
      Caption = #25903#20184#26041#24335#65306
    end
    object lblNo: TLabel
      Left = 84
      Top = 104
      Width = 72
      Height = 13
      Caption = #20132#26131#27969#27700#21495#65306
    end
    object lblMoney: TLabel
      Left = 96
      Top = 77
      Width = 60
      Height = 13
      Caption = #20132#26131#37329#39069#65306
    end
    object edtTradeType: TEdit
      Left = 168
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object edtPayType: TEdit
      Left = 168
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '1'
    end
    object edtMoney: TEdit
      Left = 168
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '000000000001'
    end
    object edtNo: TEdit
      Left = 168
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '000001'
    end
  end
  object btnCallDll: TButton
    Left = 104
    Top = 168
    Width = 75
    Height = 25
    Caption = #21021#22987#21270#20195#29702
    TabOrder = 0
    OnClick = btnCallDllClick
  end
  object btnTrade: TButton
    Left = 216
    Top = 168
    Width = 75
    Height = 25
    Caption = #24320#22987#20132#26131
    Enabled = False
    TabOrder = 1
    OnClick = btnTradeClick
  end
  object btnRelease: TButton
    Left = 104
    Top = 200
    Width = 75
    Height = 25
    Caption = #37322#25918#20195#29702
    Enabled = False
    TabOrder = 2
    OnClick = btnReleaseClick
  end
  object btnQuit: TButton
    Left = 216
    Top = 200
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 3
    OnClick = btnQuitClick
  end
end
