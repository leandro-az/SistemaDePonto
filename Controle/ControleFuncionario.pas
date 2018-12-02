unit ControleFuncionario;

interface

uses
    SysUtils,Funcionario;

function InicializaFuncionario():TFuncionario;
procedure SalvaFuncionario(Funcionario:TFuncionario);

implementation

function InicializaFuncionario():TFuncionario;
var
   Arq : TextFile;
   line: Ansistring;
   FuncAux:TFuncionario;
   NomeArq:Ansistring;
begin
  FuncAux:= TFuncionario.Create;
  NomeArq:='Arq.cnf';
  line:='';
  if fileexists(NomeArq) then
  begin
    AssignFile(Arq, NomeArq);
    Reset(Arq);
    // Le a primeira e segunda linha do Arquivo pois ela contem o
    //Nome do duncionario e a funcao separado por quebra de linha
    ReadLn(Arq, line);
    FuncAux.SetNome(trim(line));
    ReadLn(Arq, line);
    FuncAux.SetFuncao(trim(line));
    CloseFile(Arq);
  end;
  result:= FuncAux;
end;

procedure SalvaFuncionario(Funcionario:TFuncionario);
var
   Arq : TextFile;
   line: Ansistring;
   NomeArq:Ansistring;
begin
  NomeArq:='Arq.cnf';
  line:='';
  if((trim(Funcionario.GetNome)>'') and (trim(Funcionario.GetFuncao)>'')) then begin
    AssignFile(Arq,NomeArq);
    ReWrite(Arq);
    WriteLn(Arq, Funcionario.GetNome);
    WriteLn(Arq, Funcionario.GetFuncao);
    CloseFile(Arq);
  end;
end;

end.
