object Form1: TForm1
  Left = 233
  Top = 121
  Width = 663
  Height = 527
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 304
    Top = 72
    Width = 34
    Height = 13
    Caption = 'Desde:'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 249
    Height = 113
    Caption = 'Alta '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 49
      Height = 13
      Caption = 'Caravana:'
    end
    object Edit1: TEdit
      Left = 72
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'HZ082B125'
    end
    object fechaAlta: TDateTimePicker
      Left = 72
      Top = 16
      Width = 122
      Height = 21
      Date = 43571.726518726850000000
      Time = 43571.726518726850000000
      TabOrder = 1
    end
    object altaBt: TButton
      Left = 72
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 2
      OnClick = altaBtClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 144
    Width = 249
    Height = 113
    Caption = 'Baja '
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object Label4: TLabel
      Left = 16
      Top = 48
      Width = 49
      Height = 13
      Caption = 'Caravana:'
    end
    object Edit2: TEdit
      Left = 72
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'HZ082B126'
    end
    object fechaBaja: TDateTimePicker
      Left = 72
      Top = 16
      Width = 122
      Height = 21
      Date = 43571.726518726850000000
      Time = 43571.726518726850000000
      TabOrder = 1
    end
    object bajaBt: TButton
      Left = 72
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 2
      OnClick = bajaBtClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 16
    Top = 272
    Width = 249
    Height = 113
    Caption = 'Modificaci'#243'n '
    TabOrder = 2
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object Label6: TLabel
      Left = 16
      Top = 48
      Width = 49
      Height = 13
      Caption = 'Caravana:'
    end
    object Edit3: TEdit
      Left = 72
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'HZ082B127'
    end
    object fechaModifica: TDateTimePicker
      Left = 72
      Top = 16
      Width = 122
      Height = 21
      Date = 43571.726518726850000000
      Time = 43571.726518726850000000
      TabOrder = 1
    end
    object modificaBt: TButton
      Left = 72
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 2
      OnClick = modificaBtClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 288
    Top = 16
    Width = 249
    Height = 369
    Caption = ' Consulta '
    TabOrder = 3
    object Label7: TLabel
      Left = 16
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label9: TLabel
      Left = 16
      Top = 48
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object fechaDesde: TDateTimePicker
      Left = 72
      Top = 16
      Width = 122
      Height = 21
      Date = 43571.726518726850000000
      Time = 43571.726518726850000000
      TabOrder = 0
    end
    object consultaBt: TButton
      Left = 88
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 1
      OnClick = consultaBtClick
    end
    object Memo1: TMemo
      Left = 16
      Top = 112
      Width = 217
      Height = 241
      Lines.Strings = (
        '')
      TabOrder = 2
    end
  end
  object fechaHasta: TDateTimePicker
    Left = 360
    Top = 64
    Width = 122
    Height = 21
    Date = 43571.726518726850000000
    Time = 43571.726518726850000000
    TabOrder = 4
  end
  object Button5: TButton
    Left = 560
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 5
    OnClick = Button5Click
  end
  object RespuestaLog: TMemo
    Left = 16
    Top = 392
    Width = 521
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 6
  end
end
