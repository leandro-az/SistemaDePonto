unit TelaDemonsRelat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Funcionario,Ponto,ControlePonto;

const
  max = 10000;
type
  TTelaDemonstRelat = class(TForm)
    CampoMemorRelatorio: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    ListaDePontos: TListaDePontos;
    Funcionario:TFuncionario;
    procedure AtualizaDadosRelatoMemo(Referencia:TDateTime);
  end;

var
  TelaDemonstRelat: TTelaDemonstRelat;

implementation

{$R *.dfm}


procedure TTelaDemonstRelat.AtualizaDadosRelatoMemo(Referencia:TDateTime);
var
  ipos:Integer;
begin
      CampoMemorRelatorio.Clear;
      CampoMemorRelatorio.Text:='Relatório de Marcações De Ponto'+#13#10;
      CampoMemorRelatorio.Text:=CampoMemorRelatorio.Text+'Nome: '+ Funcionario.GetNome
                                + Const_str(' ',20)+'Referência: '+copy(datetostr(Referencia),4,7)+#13#10;
      CampoMemorRelatorio.Text:=CampoMemorRelatorio.Text+ 'Função: '+Funcionario.GetFuncao
                                + Const_str(' ',20)+'Geração: ' + Datetimetostr(Date)+#13#10;
      CampoMemorRelatorio.Text:=CampoMemorRelatorio.Text+#13#10;
      CampoMemorRelatorio.Text:=CampoMemorRelatorio.Text+'Dia '+Const_str(' ',22)+'Marcações:'+#13#10;
      ipos:=0;
      while ((assigned(ListaDePontos[ipos])) and (ListaDePontos[ipos].FInicializado)) do
      begin
            if(BateMesReferencia(Referencia,ListaDePontos[ipos].FDataMarcacao)) then
            begin
               CampoMemorRelatorio.Text:=CampoMemorRelatorio.Text+ Datetostr(ListaDePontos[ipos].FDataMarcacao)
                                  + Const_str(' ',10)+ inttostr2(ListaDePontos[ipos].FHoraEntrada)+':'+inttostr2(ListaDePontos[ipos].FMinEntrada)
                                  + Const_str(' ',3)+ inttostr2(ListaDePontos[ipos].FHoraSaidaAlmoco)+':'+inttostr2(ListaDePontos[ipos].FMinSaidaAlmoco)
                                  + Const_str(' ',3)+ inttostr2(ListaDePontos[ipos].FHoraRetornoAlmoco)+':'+inttostr2(ListaDePontos[ipos].FMinRetornoAlmoco)
                                  + Const_str(' ',3)+ inttostr2(ListaDePontos[ipos].FHoraSaida)+':'+inttostr2(ListaDePontos[ipos].FMinSaida)+ #13#10;
            end;
            ipos:=ipos+1;
      end;

end;

end.
