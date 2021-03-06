unit unit_resumo_de_vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, DB, DBClient,  FireDAC.Comp.Client ;

type
  Tfrm_resumo_de_vendas = class(TForm)
    rp_relatorio: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    lb_resumo_de_vendas: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLPanel2: TRLPanel;
    RLLabel1: TRLLabel;
    lb_periodo: TRLLabel;
    RLPanel3: TRLPanel;
    RLPanel4: TRLPanel;
    RLPanel5: TRLPanel;
    RLPanel6: TRLPanel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    db_media_itens_por_venda: TRLDBText;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLPanel7: TRLPanel;
    data_Source_relatorio: TDataSource;
    RLBand4: TRLBand;
    dbDescricao: TRLDBText;
    dbOrdem: TRLDBText;
    dbTotal: TRLDBText;
    dbQuantidade: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    label_ValorMedio_descricao: TRLLabel;
    RLBand5: TRLBand;
    db_IdCliente: TRLDBText;
    dbMedia: TRLDBText;
    label_totaldasvendas: TRLLabel;
    lbNomeEstabelecimento: TRLLabel;
    lbQuantidadeVendas: TRLLabel;
    lb_valor_medio_vendas: TRLLabel;
    function montar_dados(data_ini, data_fin: TDate): TClientDataSet;
    procedure label_totaldasvendasBeforePrint(Sender: TObject;
      var AText: string; var PrintIt: Boolean);
    procedure dbQuantidadeBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lb_valor_medio_vendasBeforePrint(Sender: TObject;
      var AText: string; var PrintIt: Boolean);
    procedure db_media_itens_por_vendaBeforePrint(Sender: TObject;
      var AText: string; var PrintIt: Boolean);

  private
  //
  public
    class procedure impressao(data_ini, data_fin : TDate);
  end;


implementation
uses unit_dataModule;

var saldo_totalVendas,total_itens_venda : double ;

{$R *.dfm}

procedure Tfrm_resumo_de_vendas.dbQuantidadeBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
 //
end;

class procedure Tfrm_resumo_de_vendas.impressao(data_ini, data_fin : TDate);
var frm_resumo_de_vendas: Tfrm_resumo_de_vendas;
begin
  try
    frm_resumo_de_vendas := Tfrm_resumo_de_vendas.Create(Application);
    frm_resumo_de_vendas.lb_periodo.Caption := DateToStr(data_ini) + ' ? '+ DateToStr(data_fin);
    frm_resumo_de_vendas.data_Source_relatorio.DataSet := frm_resumo_de_vendas.montar_dados(data_ini, data_fin);
    frm_resumo_de_vendas.rp_relatorio.PreviewModal();
  finally
    frm_resumo_de_vendas.Free;
  end;
end;

//--------------------------------------------------------------------------------------------------------------------------

function Tfrm_resumo_de_vendas.montar_dados(data_ini, data_fin: TDate): TClientDataSet;
var
  cds : TClientDataSet ;
  qry : TFDQuery ;
  POSICAO : Double;
begin
  saldo_totalVendas := 0;
  cds := TClientDataSet.Create(nil);
  cds.Close;
  cds.FieldDefs.Clear;
  cds.FieldDefs.Add('ID',ftString,10);
  cds.FieldDefs.Add('TIPO',ftString,2);
  cds.FieldDefs.Add('DESCRICAO_ranking', ftString,100);
  cds.FieldDefs.Add('ORDEM',ftString,3);
  cds.FieldDefs.Add('DESCRICAO',ftString,150);
  cds.FieldDefs.Add('TOTAL', ftFloat);
  cds.FieldDefs.Add('QUANTIDADE',ftFloat);
  cds.FieldDefs.Add('MEDIA',ftFloat);
  cds.FieldDefs.Add('QUANTIDADEVENDAS',ftFloat);
  cds.CreateDataSet;

//********************************

  qry := TFDQuery.Create(nil);
  qry.Connection := frm_dataModule.FDConnection1;

  //************************************************************************************************************************

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT estabelecimento.NOME');
  qry.SQL.Add('FROM estabelecimento');
  qry.Open;

  lbNomeEstabelecimento.Caption := qry.FieldByName('NOME').AsString;

  qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('SET @posicao:=0;');  // select dos 10 vendedores que mais venderam
   qry.SQL.Add('SELECT @posicao:=@posicao+1 as posicao, cadcolaborador.ID, ');
   qry.SQL.Add('CADCOLABORADOR.NOME AS NOMEVENDEDOR, sum(MOVIMENTO.TOTAL_NOTA) AS TOTAL, COUNT(movimento.PARTICIPANTES_ID) AS quantidade, ');
   qry.SQL.Add('sum(MOVIMENTO.TOTAL_NOTA) / COUNT(movimento.PARTICIPANTES_ID) AS media');
   qry.SQL.Add('FROM MOVIMENTO ');
   qry.SQL.Add('LEFT JOIN PARTICIPANTES ON MOVIMENTO.PARTICIPANTES_ID=PARTICIPANTES.ID');
   qry.SQL.Add('LEFT JOIN NOTAFISCAL ON MOVIMENTO.NOTAFISCAL_ID=NOTAFISCAL.ID ');
   qry.SQL.Add('LEFT JOIN CADCOLABORADOR ON MOVIMENTO.VENDEDOR_ID=CADCOLABORADOR.ID');
   qry.SQL.Add('WHERE MOVIMENTO.DATAEMISSAO>=:dataini AND MOVIMENTO.DATAEMISSAO<=:datafin AND MOVIMENTO.TIPO="S" ');
   qry.SQL.Add('AND (ISNULL(MOVIMENTO.IDcodpedagrupado) OR MOVIMENTO.IDcodpedagrupado="0" OR MOVIMENTO.IDcodpedagrupado="" )');
   qry.SQL.Add('AND MOVIMENTO.TIPOMOV IN("VD","VDNFCE","VDAG")');
   qry.SQL.Add('GROUP BY cadcolaborador.ID ');
   qry.SQL.Add('ORDER BY sum(MOVIMENTO.TOTAL_NOTA) DESC  ');
   qry.SQL.Add('LIMIT 10 ');
   qry.ParamByName('dataini').AsDate := data_ini;
   qry.ParamByName('datafin').AsDate := data_fin;
   qry.Open;

   while NOT qry.Eof do
      begin
        cds.Append;
        cds.FieldByName('TIPO').AsString := 'V';
        cds.FieldByName('descricao_ranking').AsString := 'RANKING DOS 10 VENDEDORES QUE MAIS VENDERAM NO PER?ODO';
        cds.FieldByName('ID').AsString :=  qry.FieldByName('id').AsString;
        CDS.FieldByName('ORDEM').AsString := '#'+qry.FieldByName('posicao').AsString;
        CDS.FieldByName('DESCRICAO').AsString := qry.FieldByName('NOMEVENDEDOR').AsString;
        CDS.FieldByName('TOTAL').AsString := qry.FieldByName('TOTAL').AsString;
        CDS.FieldByName('QUANTIDADE').AsString := qry.FieldByName('quantidade').AsString;
        cds.FieldByName('MEDIA').AsFloat := qry.FieldByName('media').AsFloat;
        saldo_totalVendas := saldo_totalVendas + cds.FieldByName('TOTAL').AsFloat;
      cds.Post;
      qry.Next;
      end;

  //*************************************************************************************************************************
  qry.close;
   qry.SQL.Clear;
   qry.SQL.Add('SET @posicao:=0;');     // select dos 10 clientes que mais compraram
   qry.SQL.Add('SELECT @posicao:= @posicao+1 AS posicao,participantes.CODIGO AS ID, participantes.NOME, COUNT(estabelecimento.ID) AS QUANTIDADE,');
   qry.SQL.Add('SUM(MOVIMENTO.TOTAL_NOTA) AS TOTAL, SUM(MOVIMENTO.TOTAL_NOTA) /COUNT(movimento.ESTABELECIMENTO_ID) AS MEDIA');
   qry.SQL.Add('FROM MOVIMENTO');
   qry.SQL.Add('LEFT JOIN PARTICIPANTES ON MOVIMENTO.PARTICIPANTES_ID=PARTICIPANTES.ID ');
   qry.SQL.Add('LEFT JOIN NOTAFISCAL ON MOVIMENTO.NOTAFISCAL_ID=NOTAFISCAL.ID');///----------------------
   qry.SQL.Add('LEFT JOIN CADCOLABORADOR ON MOVIMENTO.VENDEDOR_ID=CADCOLABORADOR.ID');
   qry.SQL.Add('LEFT JOIN estabelecimento ON estabelecimento.ID = movimento.ESTABELECIMENTO_ID');
   qry.SQL.Add('WHERE MOVIMENTO.DATAEMISSAO>=:dataini AND MOVIMENTO.DATAEMISSAO<=:datafin AND MOVIMENTO.TIPO="S" ');
   qry.SQL.Add('AND (ISNULL(MOVIMENTO.IDcodpedagrupado) OR MOVIMENTO.IDcodpedagrupado="0" OR MOVIMENTO.IDcodpedagrupado="")');
   qry.SQL.Add('AND MOVIMENTO.TIPOMOV IN("VD","VDNFCE","VDAG","VDCANCDEV","DVVD","VDCANC")');
   qry.SQL.Add('GROUP BY participantes.CODIGO');
   qry.SQL.Add('ORDER BY total DESC ');
   qry.SQL.Add('LIMIT 10 ');
   qry.ParamByName('dataini').AsDate := data_ini;
   qry.ParamByName('datafin').AsDate := data_fin;
   qry.Open;

   while NOT qry.Eof do
      begin
        cds.Append;
        cds.FieldByName('TIPO').AsString := 'C';
        cds.FieldByName('descricao_ranking').AsString := 'RANKING DOS 10 CLIENTES QUE MAIS COMPRARAM NO PER?ODO';
        cds.FieldByName('ORDEM').AsString := '#'+qry.FieldByName('posicao').AsString;
        cds.FieldByName('ID').AsString := qry.FieldByName('ID').AsString;
        cds.FieldByName('DESCRICAO').AsString := qry.FieldByName('NOME').AsString;
        cds.FieldByName('TOTAL').AsString := qry.FieldByName('total').AsString;
        cds.FieldByName('QUANTIDADE').AsString := qry.FieldByName('QUANTIDADE').AsString;
        cds.FieldByName('MEDIA').AsFloat := qry.FieldByName('MEDIA').AsFloat;
      cds.Post;
      qry.Next;
      end;



//****************************************************************************************************************************

  qry.Close;
  qry.SQL.Clear;  // select dos 10 produtos mais vendidos no periodo
  qry.SQL.Add('SET @posicao:=0;SELECT @posicao:= @posicao + 1 AS pos, ') ;
  qry.SQL.Add('movimento_itens.CODPRO as CODIGO,SUM( movimento_itens.QCOM) as QUANTIDADE,produtos.DESCRICAO AS DESCRICAO,');
  qry.SQL.Add('SUM(movimento_itens.TOTAL) TOTAL, (SUM(movimento_itens.TOTAL) /SUM( movimento_itens.QCOM)) AS MEDIA');
  qry.SQL.Add('FROM movimento_itens');
  qry.SQL.Add('LEFT JOIN movimento ON movimento.ID = movimento_itens.IDMOV' );
  qry.SQL.Add('LEFT JOIN produtos ON produtos.ID = movimento_itens.IDPRODUTO');
  qry.SQL.Add('WHERE MOVIMENTO.DATAEMISSAO>=:dataini AND MOVIMENTO.DATAEMISSAO<=:datafin AND MOVIMENTO.TIPO="S" ');
  qry.SQL.Add('AND MOVIMENTO.TIPOMOV IN("VD","VDNFCE","VDAG","VDCANCDEV","DVVD","VDCANC")');
  qry.SQL.Add('AND movimento_itens.TIPO = "S" AND movimento_itens.TIPOMOV = "VD"');
  qry.SQL.Add('GROUP BY movimento_itens.IDPRODUTO');
  qry.SQL.Add('ORDER BY SUM(movimento_itens.TOTAL) DESC  ');
  qry.SQL.Add('LIMIT 10');
  qry.ParamByName('dataini').AsDate := data_ini;
  qry.ParamByName('datafin').AsDate := data_fin;
  qry.Open;
  CDS.Open;

  while NOT qry.Eof do
  begin
     cds.Append;
     cds.FieldByName('TIPO').AsString := 'P';
     cds.FieldByName('descricao_ranking').AsString := 'RANKING DOS 10 PRODUTOS MAIS VENDIDOS NO PER?ODO'; //P=produtos mais vendidos
     cds.FieldByName('ORDEM').AsString := '#'+qry.FieldByName('pos').AsString;
     cds.FieldByName('ID').AsString :=  qry.FieldByName('CODIGO').AsString;
     cds.FieldByName('DESCRICAO').AsString :=  qry.FieldByName('DESCRICAO').AsString;
     cds.FieldByName('TOTAL').AsFloat := qry.FieldByName('TOTAL').AsFloat;
     cds.FieldByName('QUANTIDADE').AsFloat := qry.FieldByName('QUANTIDADE').AsFloat;
     cds.FieldByName('MEDIA').AsFloat := qry.FieldByName('MEDIA').AsFloat;
   cds.Post;
   qry.next;
   end;

//*****************************************************************************************

  qry.Close;       //SELECT PARA BUSCAR OS MEIOS DE PAGAMENTOS MAS UTILIZADOS NO PERIODO
  qry.SQL.Clear;

  qry.SQL.Add('SELECT PROVISAO_PARC.FORMAPAG_ID AS CODIGO,PROVISAO_PARC.DESCFORMPAG AS DESCRICAO,');
  qry.SQL.Add('(SUM(PROVISAO_PARC.VALOR)-(SUM(PROVISAO_PARC.VALOR)*PROVISAO_PARC.MAQUININHATAXA/100))AS VALORLIQUIDO,');
  qry.SQL.Add('COUNT(PROVISAO_PARC.FORMAPAG_ID) AS QUANTIDADE,');

  qry.SQL.Add('(SUM(PROVISAO_PARC.VALOR)-(SUM(PROVISAO_PARC.VALOR)*PROVISAO_PARC.MAQUININHATAXA/100)) / ');
  qry.SQL.Add('COUNT(PROVISAO_PARC.FORMAPAG_ID) AS MEDIA');

  qry.SQL.Add('FROM PROVISAO_PARC,CADFORMAPAG ');
  qry.SQL.Add('WHERE PROVISAO_PARC.FORMAPAG_ID=CADFORMAPAG.ID AND PROVISAO_PARC.TIPO="E" AND ');
  qry.SQL.Add('PROVISAO_PARC.TIPOOPEXT IN("VD","VDNFCE","VDAG","OS") AND');
  qry.SQL.Add('PROVISAO_PARC.DATALANCAMENTO>=:dataini AND PROVISAO_PARC.DATALANCAMENTO <=:datafin');
  qry.SQL.Add('GROUP BY PROVISAO_PARC.FORMAPAG_ID');
  qry.SQL.Add('UNION ALL');
  qry.SQL.Add('SELECT CAIXA.FORMAPAG_ID, CADFORMAPAG.DESCRICAO,sum(CAIXA.VALORPAGO+0) AS VALORLIQUIDO, ');
  qry.SQL.Add('COUNT(CAIXA.FORMAPAG_ID) AS QUANTIDADE,');

  qry.SQL.Add('sum(CAIXA.VALORPAGO+0) / COUNT(CAIXA.FORMAPAG_ID) AS MEDIA');

  qry.SQL.Add('FROM CAIXA,CADFORMAPAG');
  qry.SQL.Add('WHERE CAIXA.FORMAPAG_ID=CADFORMAPAG.ID AND CAIXA.TIPO="E" AND CAIXA.TIPOOPEXT IN("VD","VDNFCE","VDAG","OS") AND ');
  qry.SQL.Add('CAIXA.DATALANC>=:dataini AND CAIXA.DATALANC <=:datafin');
  qry.SQL.Add('GROUP BY  CAIXA.FORMAPAG_ID');
  qry.SQL.Add('ORDER BY valorliquido DESC');
  qry.SQL.Add('LIMIT 10');

  qry.ParamByName('dataini').AsDate := data_ini;
  qry.ParamByName('datafin').AsDate := data_fin;

  posicao := 0;
  cds.Open;
  qry.Open;
  while NOT qry.Eof do
    begin
     POSICAO := POSICAO +1;
     cds.Append;
     cds.FieldByName('TIPO').AsString := 'Q';
     cds.FieldByName('descricao_ranking').AsString := 'RANKING DOS MEIOS DE PAGAMENTOS MAIS UTILIZADOS NO PER?ODO'; //P=produtos mais vendidos
     cds.FieldByName('ORDEM').AsString := '#'+POSICAO.ToString; //qry.FieldByName('pos').AsString;
     cds.FieldByName('ID').AsString :=  qry.FieldByName('CODIGO').AsString;
     cds.FieldByName('DESCRICAO').AsString :=  qry.FieldByName('DESCRICAO').AsString;
     cds.FieldByName('TOTAL').AsFloat := qry.FieldByName('VALORLIQUIDO').AsFloat;
     cds.FieldByName('QUANTIDADE').AsFloat := qry.FieldByName('QUANTIDADE').AsFloat;
     cds.FieldByName('MEDIA').AsFloat := qry.FieldByName('MEDIA').AsFloat;
    cds.Post;
    qry.next;
    end;

    qry.Close;
    qry.SQL.Clear;

//---------------------------------------------------------------------------------------------------------------------------

qry.Close;        // QUERY PARA BUSCAR O TOTAL DE ITENS VENDIDOS, PARA CONSEGUIR CALCULAR A MEDIA DE ITENS POR VENDA
  qry.SQL.Clear;  //DIVIDINDO O TOTAL DE ITENS VENDIDOS PELA QUANTIDADE DE VENDA
  qry.SQL.Add('SELECT SUM( movimento_itens.QCOM)  AS TOTAL');
  qry.SQL.Add('FROM movimento_itens');
  qry.SQL.Add('LEFT JOIN movimento ON movimento.ID = movimento_itens.IDMOV');
  qry.SQL.Add('LEFT JOIN produtos ON produtos.ID = movimento_itens.IDPRODUTO');
  qry.SQL.Add('WHERE MOVIMENTO.DATAEMISSAO>= :dataini AND MOVIMENTO.DATAEMISSAO<= :datafin AND MOVIMENTO.TIPO="S" ');
  qry.SQL.Add('AND MOVIMENTO.TIPOMOV IN("VD","VDNFCE","VDAG","VDCANCDEV","DVVD","VDCANC")');
  qry.SQL.Add('AND movimento_itens.TIPO = "S" AND movimento_itens.TIPOMOV = "VD"');
  qry.SQL.Add('ORDER BY SUM(movimento_itens.TOTAL) DESC ');
  qry.ParamByName('dataini').AsDate := data_ini;
  qry.ParamByName('datafin').AsDate := data_fin;
  qry.Open;
  total_itens_venda := qry.FieldByName('TOTAL').AsFloat;

//----------------------------------------------------------------------------------------------------------------------------

  qry.Close;    //SELECT QUANTIDADE DE VENDAS
  qry.SQL.Clear;

  qry.SQL.Add('SET @posicao := 0;');
  qry.SQL.Add('SELECT @posicao:= @posicao+1 AS pOSICAO,');
  qry.SQL.Add('MOVIMENTO.TOTAL_NOTA AS VTOTAL_PEDIDO, count(movimento.id) AS t');
  qry.SQL.Add('FROM MOVIMENTO');
  qry.SQL.Add('LEFT JOIN PARTICIPANTES ON MOVIMENTO.PARTICIPANTES_ID=PARTICIPANTES.ID');
  qry.SQL.Add('LEFT JOIN NOTAFISCAL ON MOVIMENTO.NOTAFISCAL_ID=NOTAFISCAL.ID');
  qry.SQL.Add('LEFT JOIN CADCOLABORADOR ON MOVIMENTO.VENDEDOR_ID=CADCOLABORADOR.ID');
  qry.SQL.Add('WHERE MOVIMENTO.DATAEMISSAO>=:dataini AND MOVIMENTO.DATAEMISSAO<=:datafin AND MOVIMENTO.TIPO="S"');
  qry.SQL.Add('AND (ISNULL(MOVIMENTO.IDcodpedagrupado) OR MOVIMENTO.IDcodpedagrupado="0" OR MOVIMENTO.IDcodpedagrupado="")');
  qry.SQL.Add('AND MOVIMENTO.TIPOMOV IN("VD","VDNFCE","VDAG","VDCANCDEV","DVVD","VDCANC")');
  qry.SQL.Add('GROUP BY movimento.id');
  qry.ParamByName('dataini').AsDate := data_ini;
  qry.ParamByName('datafin').AsDate := data_fin;
  qry.Open;
  while NOT qry.Eof do
  begin
    lbQuantidadeVendas.Caption := qry.FieldByName('posicao').Text;
   qry.next;
   end;
   if (qry.FieldByName('posicao').Text = '') then
      lbQuantidadeVendas.Caption := '0';

qry.Close;

result := cds;

end;

//--------------------------------------------------------------------------------------------------------------------------

procedure Tfrm_resumo_de_vendas.label_totaldasvendasBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := FormatFloat('R$#,##0.00',saldo_totalVendas);
end;
//--------------------------------------------------------------------------------------------------------------------------
procedure Tfrm_resumo_de_vendas.lb_valor_medio_vendasBeforePrint(
  Sender: TObject; var AText: string; var PrintIt: Boolean);
  var c1 , c2 : Double;
begin
  c1 := saldo_totalVendas;
  c2 := StrToFloatDef(lbQuantidadeVendas.Caption,1.00);
  if c2 = 0 then
    c2 := 1.0;
  c1 := c1 / c2 ;
  AText := FormatFloat('R$$#,##0.00',c1);
end;
//--------------------------------------------------------------------------------------------------------------------------
procedure Tfrm_resumo_de_vendas.db_media_itens_por_vendaBeforePrint(
  Sender: TObject; var AText: string; var PrintIt: Boolean);
  var c1,c2: Double;
begin
  c1 := total_itens_venda ;
  c2 := StrToFloatDEF(lbQuantidadeVendas.Caption,1.00);
  if c2 = 0 then
    c2 := 1.00 ;
  c1 := c1 / c2;
  AText:= FormatFloat('#,##0.00',c1);
end;
end.
