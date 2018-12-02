unit TelaConsultHE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,Funcionario,Ponto,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWGrids,
  IWCompCalendar,ControlePonto;

const
  max = 10000;
type
  TTelaDeConcultaDeHorasExtrasEAtraso = class(TForm)
    GroupoFiltro: TGroupBox;
    LabelDoNome: TLabel;
    LabelDaFuncao: TLabel;
    LabelDaReferencia: TLabel;
    BotaoConsultar: TButton;
    CampoTotalDeHorasExtras: TEdit;
    CampoTotalAtrasos: TEdit;
    LabelTotais: TLabel;
    GridHE: TStringGrid;
    DateTimeGridHorasExtras: TDateTimePicker;
    procedure BotaoConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaDePontos: TListaDePontos;
    Funcionario:TFuncionario;
    procedure AtualizaLabelGrid();
  end;

var
  TelaDeConcultaDeHorasExtrasEAtraso: TTelaDeConcultaDeHorasExtrasEAtraso;

implementation

{$R *.dfm}

procedure TTelaDeConcultaDeHorasExtrasEAtraso.AtualizaLabelGrid;
var
  i,cont:integer;
begin
   With   TelaDeConcultaDeHorasExtrasEAtraso do
   begin
    GridHE.ColCount:=3;
    GridHE.RowCount:=1;
    GridHE.Cells[0,0]:='Data da Marcação' ;
    GridHE.Cells[1,0]:='Horas Extras' ;
    GridHE.Cells[2,0]:='Atrasos' ;
   end;
    CampoTotalDeHorasExtras.Text:='00:00';
    CampoTotalAtrasos.Text:= '00:00';
    LabelDoNome.Caption:= 'Nome: ' + Funcionario.GetNome;
    LabelDaFuncao.Caption:= 'Função: ' + Funcionario.GetFuncao;
    DateTimeGridHorasExtras.DateTime:=(Date);
    DateTimeGridHorasExtras.Format:= 'MM/yyyy';
end;

procedure TTelaDeConcultaDeHorasExtrasEAtraso.BotaoConsultarClick(Sender: TObject);
var
  ipos,cont:integer;
  TotalSegAtraso,TotalSegHoraExtra,SegsTrab:integer;
begin
   With   TelaDeConcultaDeHorasExtrasEAtraso do
   begin
    GridHE.ColCount:=3;
    GridHE.RowCount:=1;
    GridHE.Cells[0,0]:='Data da Marcação' ;
    GridHE.Cells[1,0]:='Horas Extras' ;
    GridHE.Cells[2,0]:='Atrasos' ;
   end;
   cont:=0;
   TotalSegAtraso:=0;
   TotalSegHoraExtra:=0;
   ipos:=0;
   SegsTrab:=8*3600;
   while ((assigned(ListaDePontos[ipos])) and (ListaDePontos[ipos].FInicializado)) do
   begin
      if(BateMesReferencia(DateTimeGridHorasExtras.DateTime,ListaDePontos[ipos].FDataMarcacao)) then
      begin
          if(TotalSegEntreHorarios(ListaDePontos[ipos])<(SegsTrab)) then
          begin
             // Se atrasou  então horas extras zera
              cont:=cont+1;
              TelaDeConcultaDeHorasExtrasEAtraso.GridHE.RowCount:=cont+1;
              TelaDeConcultaDeHorasExtrasEAtraso.GridHE.Cells[0,cont]:= datetostr(ListaDePontos[ipos].FDataMarcacao) ;
              TelaDeConcultaDeHorasExtrasEAtraso.GridHE.Cells[1,cont]:= FormataHoras(0);
              TotalSegAtraso:=TotalSegAtraso+ abs(SegsTrab-TotalSegEntreHorarios(ListaDePontos[ipos]));
              TelaDeConcultaDeHorasExtrasEAtraso.GridHE.Cells[2,cont]:= FormataHoras(abs(TotalSegEntreHorarios(ListaDePontos[ipos])-SegsTrab));

          end else if(TotalSegEntreHorarios(ListaDePontos[ipos])>(SegsTrab)) then
          begin
              // Fez horas extras    então atraso zera
              cont:=cont+1;
              TelaDeConcultaDeHorasExtrasEAtraso.GridHE.RowCount:=cont+1;
              TelaDeConcultaDeHorasExtrasEAtraso.GridHE.Cells[0,cont]:= datetostr(ListaDePontos[ipos].FDataMarcacao) ;
              TotalSegHoraExtra:=TotalSegHoraExtra+ abs(TotalSegEntreHorarios(ListaDePontos[ipos])-SegsTrab);
              TelaDeConcultaDeHorasExtrasEAtraso.GridHE.Cells[1,cont]:=  FormataHoras(abs(TotalSegEntreHorarios(ListaDePontos[ipos])-SegsTrab));
              TelaDeConcultaDeHorasExtrasEAtraso.GridHE.Cells[2,cont]:=  FormataHoras(0);
          end;
      end;
      ipos:=ipos+1;
      CampoTotalDeHorasExtras.Text:=FormataHoras(TotalSegHoraExtra);
      CampoTotalAtrasos.Text:= FormataHoras(TotalSegAtraso);
   end;

end;

end.
