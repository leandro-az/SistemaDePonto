unit Funcionario;

interface

type
  TFuncionario=class
    private
      FNome: Ansistring;
      FFuncao: Ansistring;
    public
      procedure SetNome(NNome:AnsiString);
      function GetNome: Ansistring;
      procedure SetFuncao(NFuncao:AnsiString);
      function GetFuncao: Ansistring;
      Constructor Create;
      Destructor  Destroy;
  end;

implementation


{ TFuncionario }

constructor TFuncionario.Create;
begin
  inherited Create;
  FNome:='';
  FFuncao:='';
end;

destructor TFuncionario.Destroy;
begin
  inherited;
end;

function TFuncionario.GetFuncao: Ansistring;
begin
         result:=self.FFuncao;
end;

function TFuncionario.GetNome: Ansistring;
begin
      result:=self.FNome;
end;

procedure TFuncionario.SetFuncao(NFuncao: AnsiString);
begin
     self.FFuncao:= NFuncao;
end;

procedure TFuncionario.SetNome(NNome: AnsiString);
begin
    self.FNome:= NNome;
end;

end.
