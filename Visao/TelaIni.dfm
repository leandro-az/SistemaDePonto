object TelaInicial: TTelaInicial
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Controle de Ponto Individual'
  ClientHeight = 445
  ClientWidth = 352
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
  object RegistraPonto: TButton
    Left = 72
    Top = 40
    Width = 193
    Height = 65
    Caption = 'Registrar Ponto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = RegistraPontoClick
  end
  object ConsultaHE: TButton
    Left = 72
    Top = 144
    Width = 193
    Height = 65
    Caption = 'Consulta de Horas Extras'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ConsultaHEClick
  end
  object RelatPonto: TButton
    Left = 72
    Top = 256
    Width = 193
    Height = 65
    Caption = 'Relat'#243'rio de Ponto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = RelatPontoClick
  end
  object Config: TButton
    Left = 72
    Top = 352
    Width = 193
    Height = 65
    Caption = 'Configura'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = ConfigClick
  end
end
