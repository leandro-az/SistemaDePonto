unit TelaConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Funcionario,Ponto;

const
  max = 10000;
type
   TTelaDeConfiguracao = class(TForm)
    LabeNome: TLabel;
    CampoNome: TEdit;
    LabelFuncao: TLabel;
    CampoFuncao: TEdit;
    BotaoGravar: TButton;
    procedure BotaoGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaDePontos: TListaDePontos;
    Funcionario:TFuncionario;
  end;

var
  TelaDeConfiguracao: TTelaDeConfiguracao;

implementation

{$R *.dfm}

procedure TTelaDeConfiguracao.BotaoGravarClick(Sender: TObject);
begin
    Funcionario.SetNome(CampoNome.Text);
    Funcionario.SetFuncao(CampoFuncao.Text);
    TelaDeConfiguracao.Close;
end;

end.
