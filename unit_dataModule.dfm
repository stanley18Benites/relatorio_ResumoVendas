object frm_dataModule: Tfrm_dataModule
  Left = 0
  Top = 0
  Caption = 'fmr_DataModule'
  ClientHeight = 347
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=DadosMerchant'
      'User_Name=root'
      'Server=192.168.56.1'
      'Port=3341'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 144
    Top = 56
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT estabelecimento.NOME'
      'FROM estabelecimento')
    Left = 232
    Top = 56
  end
end
