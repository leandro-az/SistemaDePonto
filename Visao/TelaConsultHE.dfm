object TelaDeConcultaDeHorasExtrasEAtraso: TTelaDeConcultaDeHorasExtrasEAtraso
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Conculta Horas Extras e Atrasos'
  ClientHeight = 441
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LabelTotais: TLabel
    Left = 24
    Top = 392
    Width = 185
    Height = 24
    Caption = 'Totais na refer'#234'ncia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GroupoFiltro: TGroupBox
    Left = 24
    Top = 32
    Width = 641
    Height = 154
    Caption = 'Filtro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object LabelDoNome: TLabel
      Left = 16
      Top = 24
      Width = 65
      Height = 24
      Caption = 'Nome: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelDaFuncao: TLabel
      Left = 16
      Top = 56
      Width = 76
      Height = 24
      Caption = 'Fun'#231#227'o: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelDaReferencia: TLabel
      Left = 316
      Top = 87
      Width = 84
      Height = 19
      Caption = 'Refer'#234'ncia: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object BotaoConsultar: TButton
      Left = 504
      Top = 112
      Width = 121
      Height = 34
      Caption = 'Consultar'
      TabOrder = 0
      OnClick = BotaoConsultarClick
    end
    object DateTimeGridHorasExtras: TDateTimePicker
      Left = 316
      Top = 112
      Width = 137
      Height = 27
      Date = 43393.805895243060000000
      Time = 43393.805895243060000000
      TabOrder = 1
    end
  end
  object CampoTotalDeHorasExtras: TEdit
    Left = 296
    Top = 383
    Width = 150
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object CampoTotalAtrasos: TEdit
    Left = 528
    Top = 383
    Width = 137
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object GridHE: TStringGrid
    AlignWithMargins = True
    Left = 24
    Top = 192
    Width = 641
    Height = 177
    Color = clGrayText
    ColCount = 3
    DefaultColWidth = 211
    FixedColor = clSilver
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    GradientStartColor = clSilver
    GridLineWidth = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
