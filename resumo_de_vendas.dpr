program resumo_de_vendas;

uses
  Vcl.Forms,
  unit_inserir_dados in 'unit_inserir_dados.pas' {frm_inserir_dados},
  unit_resumo_de_vendas in 'unit_resumo_de_vendas.pas' {frm_resumo_de_vendas},
  unit_dataModule in 'unit_dataModule.pas' {frm_dataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_inserir_dados, frm_inserir_dados);
  Application.CreateForm(Tfrm_dataModule, frm_dataModule);
  Application.Run;
end.
