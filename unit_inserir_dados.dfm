object frm_inserir_dados: Tfrm_inserir_dados
  Left = 0
  Top = 0
  Caption = 'Relatorio'
  ClientHeight = 209
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 57
    Height = 13
    AutoSize = False
    Caption = 'Per'#237'odo: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 83
    Top = 35
    Width = 9
    Height = 11
    AutoSize = False
    Caption = #192
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 42
    Top = 147
    Width = 31
    Height = 13
    Caption = 'Label3'
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 8
    Top = 63
    Width = 24
    Height = 13
    Caption = 'Filtro'
  end
  object maskedit_periodo_inicial: TMaskEdit
    Left = 8
    Top = 32
    Width = 70
    Height = 19
    Alignment = taCenter
    AutoSize = False
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    Text = '  /  /    '
  end
  object maskedit_periodo_final: TMaskEdit
    Left = 97
    Top = 32
    Width = 70
    Height = 19
    Alignment = taCenter
    AutoSize = False
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    Text = '  /  /    '
  end
  object Button1: TButton
    Left = 171
    Top = 176
    Width = 75
    Height = 25
    Caption = 'IMPRIMIR'
    TabOrder = 2
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 147
    Width = 28
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 8
    Top = 74
    Width = 185
    Height = 50
    TabOrder = 4
    object CheckBox2: TCheckBox
      Left = 7
      Top = 7
      Width = 141
      Height = 17
      Caption = 'Vendas com notas'
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 7
      Top = 26
      Width = 152
      Height = 17
      Caption = 'Vendas sem notas'
      TabOrder = 1
    end
  end
end
