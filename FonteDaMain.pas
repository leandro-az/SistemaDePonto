program ProjetoAlterData;

uses
  Vcl.Forms,
  TelaIni in 'Visao\TelaIni.pas' {TTelaInicial},
  TelaConfig in 'Visao\TelaConfig.pas' {TelaDeConfiguracao},
  TelaRelatPont in 'Visao\TelaRelatPont.pas' {TelaDeRelatorioDePonto},
  TelaRegPont in 'Visao\TelaRegPont.pas' {TelaDeRegistroDePonto},
  TelaConsultHE in 'Visao\TelaConsultHE.pas' {TelaDeConcultaDeHorasExtrasEAtraso},
  TelaDemonsRelat in 'Visao\TelaDemonsRelat.pas' {TelaDemonstRelat},
  Funcionario in 'Modelo\Funcionario.pas',
  Ponto in 'Modelo\Ponto.pas' {$R *.res},
  ControleFuncionario in 'Controle\ControleFuncionario.pas',
  ControlePonto in 'Controle\ControlePonto.pas';

{$R *.res}

var
  pos:integer;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTelaInicial, TelaInicial);
  Application.CreateForm(TTelaDeConfiguracao, TelaDeConfiguracao);
  Application.CreateForm(TTelaDeRelatorioDePonto, TelaDeRelatorioDePonto);
  Application.CreateForm(TTelaDeRegistroDePonto, TelaDeRegistroDePonto);
  Application.CreateForm(TTelaDeConcultaDeHorasExtrasEAtraso, TelaDeConcultaDeHorasExtrasEAtraso);
  Application.CreateForm(TTelaDemonstRelat, TelaDemonstRelat);
  // Alinha o funcionario em todas as telas ==========================
    TelaInicial.Funcionario:=InicializaFuncionario;
    TelaDeConfiguracao.Funcionario:=TelaInicial.Funcionario;
    TelaDeRelatorioDePonto.Funcionario:=TelaInicial.Funcionario;
    TelaDeRegistroDePonto.Funcionario:= TelaInicial.Funcionario;
    TelaDeConcultaDeHorasExtrasEAtraso.Funcionario:= TelaInicial.Funcionario;
    TelaDemonstRelat.Funcionario:= TelaInicial.Funcionario;
  // ================================================================
  // Alinha o a Lista de Pontos em todas as telas ===================
    TelaInicial.ListaDePontos:=InicializaPontos;
    TelaDeConfiguracao.ListaDePontos:=TelaInicial.ListaDePontos;
    TelaDeRelatorioDePonto.ListaDePontos:=TelaInicial.ListaDePontos;
    TelaDeRegistroDePonto.ListaDePontos:= TelaInicial.ListaDePontos;
    TelaDeConcultaDeHorasExtrasEAtraso.ListaDePontos:=TelaInicial.ListaDePontos;
    TelaDemonstRelat.ListaDePontos:= TelaInicial.ListaDePontos;
  // ================================================================
  Application.Run;
  SalvaFuncionario(TelaInicial.Funcionario);
  SalvaListaDePontos(TelaInicial.ListaDePontos);
   for pos:=0 to Ponto.MAX do
   begin
       TelaInicial.ListaDePontos[pos].free;
   end;
   TelaInicial.Funcionario.free;
end.