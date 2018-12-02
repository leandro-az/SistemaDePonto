unit TelaRelatPont;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, TelaDemonsRelat,Funcionario,Ponto;

const
  max = 10000;
type
  TTelaDeRelatorioDePonto = class(TForm)
    LabelReferencia: TLabel;
    BotaoVisualizar: TButton;
    DateTimeRelatorio: TDateTimePicker;
    procedure BotaoVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaDePontos: TListaDePontos;
    Funcionario:TFuncionario;
    procedure AtualizaTela;
  end;

var
  TelaDeRelatorioDePonto: TTelaDeRelatorioDePonto;
  Funcionario:TFuncionario;

implementation

{$R *.dfm}

procedure TTelaDeRelatorioDePonto.AtualizaTela;
begin
    DateTimeRelatorio.DateTime:=(Date);
    DateTimeRelatorio.Format:= 'MM/yyyy';
end;

procedure TTelaDeRelatorioDePonto.BotaoVisualizarClick(Sender: TObject);
begin
     TelaDemonstRelat.AtualizaDadosRelatoMemo(DateTimeRelatorio.DateTime);
     TelaDemonstRelat.ShowModal;
end;

end.
