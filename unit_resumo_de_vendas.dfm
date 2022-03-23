object frm_resumo_de_vendas: Tfrm_resumo_de_vendas
  Left = 0
  Top = 165
  Caption = 'RELATORIO'
  ClientHeight = 575
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object rp_relatorio: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = data_Source_relatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLPanel1: TRLPanel
        Left = 23
        Top = -2
        Width = 675
        Height = 30
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object lb_resumo_de_vendas: TRLLabel
          Left = 287
          Top = 10
          Width = 113
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Resumo de vendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 584
          Top = 10
          Width = 88
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = itNow
          Layout = tlCenter
          ParentFont = False
          Text = ''
        end
        object lbNomeEstabelecimento: TRLLabel
          Left = 0
          Top = 10
          Width = 287
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
      end
      object RLPanel2: TRLPanel
        Left = 23
        Top = 34
        Width = 675
        Height = 29
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel1: TRLLabel
          Left = 0
          Top = 6
          Width = 52
          Height = 12
          AutoSize = False
          Caption = 'Per'#237'odo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object lb_periodo: TRLLabel
          Left = 53
          Top = 6
          Width = 127
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
        end
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 128
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLPanel3: TRLPanel
        Left = 23
        Top = 4
        Width = 317
        Height = 49
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLLabel2: TRLLabel
          Left = 0
          Top = 4
          Width = 318
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Valor total das vendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
        end
        object label_totaldasvendas: TRLLabel
          Left = 4
          Top = 17
          Width = 308
          Height = 31
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
          BeforePrint = label_totaldasvendasBeforePrint
        end
      end
      object RLPanel4: TRLPanel
        Left = 23
        Top = 62
        Width = 317
        Height = 52
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLLabel3: TRLLabel
          Left = 0
          Top = 4
          Width = 318
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Valor m'#233'dio das vendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
        end
        object lb_valor_medio_vendas: TRLLabel
          Left = 5
          Top = 18
          Width = 310
          Height = 32
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
          BeforePrint = lb_valor_medio_vendasBeforePrint
        end
      end
      object RLPanel5: TRLPanel
        Left = 381
        Top = 62
        Width = 317
        Height = 52
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLLabel5: TRLLabel
          Left = 0
          Top = 4
          Width = 318
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'M'#233'dia de itens por venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
        end
        object db_media_itens_por_venda: TRLDBText
          Left = 4
          Top = 18
          Width = 310
          Height = 32
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
          Text = ''
          BeforePrint = db_media_itens_por_vendaBeforePrint
        end
      end
      object RLPanel6: TRLPanel
        Left = 381
        Top = 4
        Width = 317
        Height = 49
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLLabel4: TRLLabel
          Left = 0
          Top = 4
          Width = 320
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Quantidade de vendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
        end
        object lbQuantidadeVendas: TRLLabel
          Left = 4
          Top = 17
          Width = 310
          Height = 32
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 233
      Width = 718
      Height = 54
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = False
      DataFields = 'TIPO'
      object RLBand3: TRLBand
        Left = 1
        Top = 0
        Width = 716
        Height = 33
        BandType = btColumnHeader
        object RLPanel7: TRLPanel
          Left = 22
          Top = 8
          Width = 675
          Height = 19
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = True
          object RLDBText5: TRLDBText
            Left = 4
            Top = 0
            Width = 373
            Height = 18
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'descricao_ranking'
            DataSource = data_Source_relatorio
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Layout = tlCenter
            ParentFont = False
            Text = ''
          end
          object RLLabel6: TRLLabel
            Left = 458
            Top = 0
            Width = 53
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Layout = tlCenter
            ParentFont = False
          end
          object RLLabel7: TRLLabel
            Left = 520
            Top = 0
            Width = 68
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Layout = tlCenter
            ParentFont = False
          end
          object label_ValorMedio_descricao: TRLLabel
            Left = 584
            Top = 0
            Width = 84
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'M'#233'dia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Layout = tlCenter
            ParentFont = False
          end
        end
      end
      object RLBand4: TRLBand
        Left = 1
        Top = 33
        Width = 716
        Height = 19
        object dbDescricao: TRLDBText
          Left = 75
          Top = 2
          Width = 257
          Height = 14
          AutoSize = False
          DataField = 'descricao'
          DataSource = data_Source_relatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object dbOrdem: TRLDBText
          Left = 22
          Top = 2
          Width = 23
          Height = 14
          AutoSize = False
          DataField = 'ordem'
          DataSource = data_Source_relatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object dbTotal: TRLDBText
          Left = 456
          Top = 2
          Width = 77
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'total'
          DataSource = data_Source_relatorio
          DisplayMask = 'R$ #,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object dbQuantidade: TRLDBText
          Left = 557
          Top = 2
          Width = 53
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'quantidade'
          DataSource = data_Source_relatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          BeforePrint = dbQuantidadeBeforePrint
        end
        object db_IdCliente: TRLDBText
          Left = 46
          Top = 2
          Width = 23
          Height = 14
          AutoSize = False
          DataField = 'ID'
          DataSource = data_Source_relatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object dbMedia: TRLDBText
          Left = 613
          Top = 4
          Width = 77
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'MEDIA'
          DataSource = data_Source_relatorio
          DisplayMask = 'R$ #,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 287
      Width = 718
      Height = 29
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
    end
  end
  object data_Source_relatorio: TDataSource
    DataSet = frm_dataModule.FDQuery1
    Left = 800
    Top = 32
  end
end