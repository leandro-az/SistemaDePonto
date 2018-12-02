unit Ponto;

interface


uses
  System.SysUtils;

const
  MAX=3650;

type
 TPonto=class
   public
     FDataMarcacao: TDateTime;
     FHoraEntrada: Integer;
     FMinEntrada  : Integer;
     FHoraSaidaAlmoco: Integer;
     FMinSaidaAlmoco  : Integer;
     FHoraRetornoAlmoco: Integer;
     FMinRetornoAlmoco  : Integer;
     FHoraSaida: Integer;
     FMinSaida  : Integer;
     FInicializado: Boolean;
     Constructor Create;
     Destructor  Destroy;
 end;

 TListaDePontos= Array [0..MAX] of TPonto;

implementation

{ TPonto }

constructor TPonto.Create;
begin
   inherited Create;
   FDataMarcacao:=Date;
   FHoraEntrada:=0;
   FMinEntrada  :=0;
   FHoraSaidaAlmoco:=0;
   FMinSaidaAlmoco  :=0;
   FHoraRetornoAlmoco:=0;
   FMinRetornoAlmoco  :=0;
   FHoraSaida:=0;
   FMinSaida  :=0;
   FInicializado:=false;
end;

destructor TPonto.Destroy;
begin
    inherited;
end;

end.
