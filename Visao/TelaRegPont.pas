unit TelaRegPont;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask,Funcionario,Ponto,ControlePonto,System.DateUtils;

const
  max = 10000;
type
  TTelaDeRegistroDePonto = class(TForm)
    LabelDataDaMarc: TLabel;
    DateTimePickerDtMarc: TDateTimePicker;
    LabelMarc: TLabel;
    LabelEntrada: TLabel;
    LabeSaidaAlmo: TLabel;
    LabelRetornoAlmoco: TLabel;
    LabelSaida: TLabel;
    BotaoGravar: TButton;
    BotaoCancelar: TButton;
    LabelLinha: TLabel;
    MaskEditHoraEntrada: TMaskEdit;
    MaskEditHoraSaidaAlmo: TMaskEdit;
    MaskEditHoraRetornoAlmo: TMaskEdit;
    MaskEditHoraSaida: TMaskEdit;
    procedure BotaoGravarClick(Sender: TObject);
    procedure BotaoCancelarClick(Sender: TObject);
    procedure AtualizaTelaReg();
  private
    { Private declarations }
  public
    { Public declarations }
    ListaDePontos: TListaDePontos;
    Funcionario:TFuncionario;
  end;

var
  TelaDeRegistroDePonto: TTelaDeRegistroDePonto;

implementation

{$R *.dfm}


procedure TTelaDeRegistroDePonto.AtualizaTelaReg;
begin
    TelaDeRegistroDePonto.DateTimePickerDtMarc.DateTime:=(Date);
end;

procedure TTelaDeRegistroDePonto.BotaoCancelarClick(Sender: TObject);
begin
    TelaDeRegistroDePonto.Close;
end;

procedure TTelaDeRegistroDePonto.BotaoGravarClick(Sender: TObject);
var
  cont,TotSegTrab,SegDIF:Integer;
begin
    TotSegTrab:=8*3600;
    SegDIF:=0;
    if(Length(StringReplace(MaskEditHoraEntrada.Text,' ', '', [rfReplaceAll]))<5)
    or (strtoint(copy(MaskEditHoraEntrada.Text,1,2))<6) or (strtoint(copy(MaskEditHoraEntrada.Text,1,2))>23) or (strtoint(copy(MaskEditHoraEntrada.Text,4,2))>59)
    or ((strtoint(copy(MaskEditHoraEntrada.Text,1,2))=23)and (strtoint(copy(MaskEditHoraEntrada.Text,4,2))>0)) then
    begin
      MaskEditHoraEntrada.SetFocus;
      ShowMessage('Hora Informada deve estar entre 06:00 e 23:00 .');
    end else if(Length(StringReplace(MaskEditHoraSaidaAlmo.Text,' ', '', [rfReplaceAll]))<5)
    or (strtoint(copy(MaskEditHoraSaidaAlmo.Text,1,2))>23) or (strtoint(copy(MaskEditHoraSaidaAlmo.Text,1,2))<6) or (strtoint(copy(MaskEditHoraSaidaAlmo.Text,4,2))>59)
    or ((strtoint(copy(MaskEditHoraSaidaAlmo.Text,1,2))=23) and (strtoint(copy(MaskEditHoraSaidaAlmo.Text,4,2))>0))then
    begin
      MaskEditHoraSaidaAlmo.SetFocus;
      ShowMessage('Hora Informada deve estar entre 06:00 e 23:00 .');
    end else if(Length(StringReplace(MaskEditHoraRetornoAlmo.Text,' ', '', [rfReplaceAll]))<5)
    or (strtoint(copy(MaskEditHoraRetornoAlmo.Text,1,2))>23) or (strtoint(copy(MaskEditHoraRetornoAlmo.Text,1,2))<6) or (strtoint(copy(MaskEditHoraRetornoAlmo.Text,4,2))>59)
    or ((strtoint(copy(MaskEditHoraRetornoAlmo.Text,1,2))=23)and (strtoint(copy(MaskEditHoraRetornoAlmo.Text,4,2))>0)) then
    begin
      MaskEditHoraRetornoAlmo.SetFocus;
      ShowMessage('Hora Informada deve estar entre 06:00 e 23:00 .');
    end else if(Length(StringReplace(MaskEditHoraSaida.Text,' ', '', [rfReplaceAll]))<5)
    or (strtoint(copy(MaskEditHoraSaida.Text,1,2))>23) or (strtoint(copy(MaskEditHoraSaida.Text,1,2))<6) or (strtoint(copy(MaskEditHoraSaida.Text,4,2))>59)
    or ((strtoint(copy(MaskEditHoraSaida.Text,1,2))=23)and(strtoint(copy(MaskEditHoraSaida.Text,4,2))>0))then
    begin
      MaskEditHoraSaida.SetFocus;
      ShowMessage('Hora Informada deve estar entre 06:00 e 23:00 .');
    end else if(VerificaSeJaBateuDia(ListaDePontos,DateTimePickerDtMarc.DateTime)) then
    begin
             DateTimePickerDtMarc.SetFocus;
             ShowMessage('Marcação já efetuada para este dia!');
    end else if(CompareDateTime(DateTimePickerDtMarc.DateTime,Date)=1) then
    begin
             DateTimePickerDtMarc.SetFocus;
             ShowMessage('Não é possível realizar marcações em datas futuras!');
    end else if(SegEntre2Horarios(strtoint(copy(MaskEditHoraEntrada.Text,1,2)),strtoint(copy(MaskEditHoraEntrada.Text,4,2))
              ,strtoint(copy(MaskEditHoraSaidaAlmo.Text,1,2)),strtoint(copy(MaskEditHoraSaidaAlmo.Text,4,2)))<0) then
    begin
             MaskEditHoraSaidaAlmo.SetFocus;
             ShowMessage('Horário de almoço não pode ser menor que a hora de entrada!');
    end else if(SegEntre2Horarios(strtoint(copy(MaskEditHoraSaidaAlmo.Text,1,2)),strtoint(copy(MaskEditHoraSaidaAlmo.Text,4,2))
              ,strtoint(copy(MaskEditHoraRetornoAlmo.Text,1,2)),strtoint(copy(MaskEditHoraRetornoAlmo.Text,4,2)))<0) then
    begin
             MaskEditHoraRetornoAlmo.SetFocus;
             ShowMessage('Horário de retorno de almoço não pode ser menor que a hora de saida para almoço!');
    end else if(SegEntre2Horarios(strtoint(copy(MaskEditHoraRetornoAlmo.Text,1,2)),strtoint(copy(MaskEditHoraRetornoAlmo.Text,4,2))
              ,strtoint(copy(MaskEditHoraSaida.Text,1,2)),strtoint(copy(MaskEditHoraSaida.Text,4,2)))<0) then
    begin
             MaskEditHoraSaida.SetFocus;
             ShowMessage('Horário da saida não pode ser menor que a hora de retorno do almoço!');
    end else
    begin
           SegDIF:=SegEntre2Horarios(strtoint(copy(MaskEditHoraEntrada.Text,1,2))
                      ,strtoint(copy(MaskEditHoraEntrada.Text,4,2))
                      ,strtoint(copy(MaskEditHoraSaidaAlmo.Text,1,2))
                      ,strtoint(copy(MaskEditHoraSaidaAlmo.Text,4,2)));
           SegDIF:=SegDIF+SegEntre2Horarios(strtoint(copy(MaskEditHoraRetornoAlmo.Text,1,2))
                      ,strtoint(copy(MaskEditHoraRetornoAlmo.Text,4,2))
                      ,strtoint(copy(MaskEditHoraSaida.Text,1,2))
                      ,strtoint(copy(MaskEditHoraSaida.Text,4,2)));
           // Registrou ponto com atraso
           if(SegDIF<TotSegTrab) then begin
             case MessageDlg('Total de Horas trabalhadas foi de: '+FormataHoras(abs(SegDIF))+' horas. Será registrado um atraso de: '+FormataHoras(abs(SegDIF-TotSegTrab))+' horas. Confirma Gravação?', mtConfirmation, [mbOK, mbCancel], 0) of
                    mrOk:
                      begin
                          AdicionaPonto(ListaDePontos,DateTimePickerDtMarc.DateTime,strtoint(copy(MaskEditHoraEntrada.Text,1,2))
                          ,strtoint(copy(MaskEditHoraEntrada.Text,4,2))
                          ,strtoint(copy(MaskEditHoraSaidaAlmo.Text,1,2))
                          ,strtoint(copy(MaskEditHoraSaidaAlmo.Text,4,2))
                          ,strtoint(copy(MaskEditHoraRetornoAlmo.Text,1,2))
                          ,strtoint(copy(MaskEditHoraRetornoAlmo.Text,4,2))
                           ,strtoint(copy(MaskEditHoraSaida.Text,1,2))
                          ,strtoint(copy(MaskEditHoraSaida.Text,4,2)));
                          ShowMessage('Ponto registrado com sucesso!');
                          MaskEditHoraEntrada.Text:='00:00';
                          MaskEditHoraSaidaAlmo.Text:='00:00';
                          MaskEditHoraRetornoAlmo.Text:='00:00';
                          MaskEditHoraSaida.Text:='00:00';
                          DateTimePickerDtMarc.DateTime:=(Date);
                      end;
                    mrCancel:
                      begin
                         ///  Cancelar não faz nada
                      end;
                  end;
           // Registrou ponto com Horas extras
           end else if(SegDIF>TotSegTrab) then begin
             case MessageDlg('Total de Horas trabalhadas foi de: '+FormataHoras(abs(SegDIF))+' horas. Serão registradas: '+FormataHoras(abs(SegDIF-TotSegTrab))+' horas extras. Confirma Gravação?', mtConfirmation, [mbOK, mbCancel], 0) of
                    mrOk:
                      begin
                          AdicionaPonto(ListaDePontos,DateTimePickerDtMarc.DateTime,strtoint(copy(MaskEditHoraEntrada.Text,1,2))
                          ,strtoint(copy(MaskEditHoraEntrada.Text,4,2))
                          ,strtoint(copy(MaskEditHoraSaidaAlmo.Text,1,2))
                          ,strtoint(copy(MaskEditHoraSaidaAlmo.Text,4,2))
                          ,strtoint(copy(MaskEditHoraRetornoAlmo.Text,1,2))
                          ,strtoint(copy(MaskEditHoraRetornoAlmo.Text,4,2))
                           ,strtoint(copy(MaskEditHoraSaida.Text,1,2))
                          ,strtoint(copy(MaskEditHoraSaida.Text,4,2)));
                          ShowMessage('Ponto registrado com sucesso!');
                          MaskEditHoraEntrada.Text:='00:00';
                          MaskEditHoraSaidaAlmo.Text:='00:00';
                          MaskEditHoraRetornoAlmo.Text:='00:00';
                          MaskEditHoraSaida.Text:='00:00';
                          DateTimePickerDtMarc.DateTime:=(Date);
                      end;
                    mrCancel:
                      begin
                         ///  Cancelar não faz nada
                      end;
                  end;
           end else
           begin
           // Bateu ponto no horario normal
              AdicionaPonto(ListaDePontos,DateTimePickerDtMarc.DateTime,strtoint(copy(MaskEditHoraEntrada.Text,1,2))
                      ,strtoint(copy(MaskEditHoraEntrada.Text,4,2))
                      ,strtoint(copy(MaskEditHoraSaidaAlmo.Text,1,2))
                      ,strtoint(copy(MaskEditHoraSaidaAlmo.Text,4,2))
                      ,strtoint(copy(MaskEditHoraRetornoAlmo.Text,1,2))
                      ,strtoint(copy(MaskEditHoraRetornoAlmo.Text,4,2))
                      ,strtoint(copy(MaskEditHoraSaida.Text,1,2))
                      ,strtoint(copy(MaskEditHoraSaida.Text,4,2)));
               ShowMessage('Ponto registrado com sucesso!');
               MaskEditHoraEntrada.Text:='00:00';
               MaskEditHoraSaidaAlmo.Text:='00:00';
               MaskEditHoraRetornoAlmo.Text:='00:00';
               MaskEditHoraSaida.Text:='00:00';
               DateTimePickerDtMarc.DateTime:=(Date);

           end;
    end;
end;

end.
