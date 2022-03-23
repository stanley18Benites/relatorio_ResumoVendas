unit unit_inserir_dados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.ExtCtrls, unit_resumo_de_vendas;

type
  Tfrm_inserir_dados = class(TForm)
    Label1: TLabel;
    maskedit_periodo_inicial: TMaskEdit;
    maskedit_periodo_final: TMaskEdit;
    Label2: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Panel1: TPanel;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_inserir_dados: Tfrm_inserir_dados;

implementation

{$R *.dfm}

procedure Tfrm_inserir_dados.Button1Click(Sender: TObject);
  begin
   // if sModelo.ItemIndex = 0 then

    Tfrm_resumo_de_vendas.impressao(StrToDate(maskedit_periodo_inicial.Text), StrToDate(maskedit_periodo_final.Text));
  end;
end.
