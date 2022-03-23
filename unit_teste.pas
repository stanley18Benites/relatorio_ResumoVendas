unit unit_teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, unit_resumo_de_vendas, DBClient;

type
  Tfrm_teste = class(TForm)
    DataSource1: TDataSource;
    db_grid: TDBGrid;
    //class
    //ClientDataSet1: TClientDataSet; procedure teste();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_teste: Tfrm_teste;

implementation

{$R *.dfm}
 {
class procedure Tfrm_teste.teste();
var cds : TClientDataSet ;
  begin
    cds := TClientDataSet.Create(nil);
    cds := Tfrm_resumo_de_vendas.montar_dados(StrToDate('2021-01-01'),StrToDate('2021-02-01'));
    frm_teste.db_grid.DataSource.DataSet := cds  ;
  end;
 }
end.
