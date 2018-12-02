unit TelaIni;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,TelaConfig,TelaRelatPont,TelaRegPont,TelaConsultHE,
  Funcionario,Ponto;
const
  max = 10000;
type
  TTelaInicial = class(TForm)
    RegistraPonto: TButton;
    ConsultaHE: TButton;
    RelatPonto: TButton;
    Config: TButton;
    procedure ConfigClick(Sender: TObject);
    procedure RelatPontoClick(Sender: TObject);
    procedure RegistraPontoClick(Sender: TObject);
    procedure ConsultaHEClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaDePontos: TListaDePontos;
    Funcionario:TFuncionario;
  end;

var
  TelaInicial: TTelaInicial;

implementation

{$R *.dfm}


procedure TTelaInicial.ConfigClick(Sender: TObject);
begin
    TelaDeConfiguracao.CampoNome.Text:=Funcionario.GetNome;
    TelaDeConfiguracao.CampoFuncao.Text:=Funcionario.GetFuncao;
    TelaDeConfiguracao.ShowModal;
end;

procedure TTelaInicial.ConsultaHEClick(Sender: TObject);
begin
    if(Funcionario.GetNome='') then begin
       ShowMessage('Nome do Funcionário ainda não cadastrado!');
    end else if(Funcionario.GetFuncao='') then begin
       ShowMessage('Função do Funcionário ainda não cadastrada!');
    end else begin
       TelaDeConcultaDeHorasExtrasEAtraso.AtualizaLabelGrid;
       TelaDeConcultaDeHorasExtrasEAtraso.ShowModal;
     end;
end;

procedure TTelaInicial.RegistraPontoClick(Sender: TObject);
begin
     if(Funcionario.GetNome='') then begin
       ShowMessage('Nome do Funcionário ainda não cadastrado!');
    end else if(Funcionario.GetFuncao='') then begin
       ShowMessage('Função do Funcionário ainda não cadastrada!');
    end else begin
       TelaDeRegistroDePonto.AtualizaTelaReg;
       TelaDeRegistroDePonto.ShowModal;
    end;
end;

procedure TTelaInicial.RelatPontoClick(Sender: TObject);
begin
     if(Funcionario.GetNome='') then begin
       ShowMessage('Nome do Funcionário ainda não cadastrado!');
    end else if(Funcionario.GetFuncao='') then begin
       ShowMessage('Função do Funcionário ainda não cadastrada!');
    end else begin
     TelaDeRelatorioDePonto.AtualizaTela;
     TelaDeRelatorioDePonto.ShowModal;
    end;
end;

end.
