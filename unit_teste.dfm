object frm_teste: Tfrm_teste
  Left = 0
  Top = 0
  Caption = 'frm_teste'
  ClientHeight = 311
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object db_grid: TDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 225
    DataSource = frm_resumo_de_vendas.data_Source_relatorio
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    Left = 712
    Top = 48
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    MasterSource = frm_resumo_de_vendas.data_Source_relatorio
    PacketRecords = 0
    Params = <>
    Left = 232
    Top = 248
  end
end
