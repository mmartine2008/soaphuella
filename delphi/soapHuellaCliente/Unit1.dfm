object Form1: TForm1
  Left = 233
  Top = 121
  Width = 866
  Height = 799
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
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
    Left = 280
    Top = 16
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
    Left = 544
    Top = 16
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
    Left = 8
    Top = 144
    Width = 745
    Height = 526
    Caption = ' Consulta '
    TabOrder = 3
    object Label7: TLabel
      Left = 16
      Top = 48
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label9: TLabel
      Left = 232
      Top = 48
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label10: TLabel
      Left = 8
      Top = 16
      Width = 77
      Height = 13
      Caption = 'Establecimiento:'
    end
    object Label11: TLabel
      Left = 264
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Color:'
    end
    object Label12: TLabel
      Left = 520
      Top = 16
      Width = 28
      Height = 13
      Caption = 'Raza:'
    end
    object fechaDesde: TDateTimePicker
      Left = 72
      Top = 40
      Width = 122
      Height = 21
      Date = 42751.726518726850000000
      Time = 42751.726518726850000000
      TabOrder = 0
    end
    object consultaBt: TButton
      Left = 120
      Top = 72
      Width = 185
      Height = 25
      Hint = 'Consulta a SAP por los movimientos que hubieran de ingreso'
      Caption = 'Consultar Movimientos'
      TabOrder = 1
      OnClick = consultaBtClick
    end
    object StringGridResultado: TStringGrid
      Left = 24
      Top = 112
      Width = 705
      Height = 201
      ColCount = 1
      DefaultColWidth = 128
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 2
    end
    object Button1: TButton
      Left = 104
      Top = 320
      Width = 193
      Height = 25
      Caption = '&Migrar'
      TabOrder = 3
      OnClick = Button1Click
    end
    object MemoResultadoActualizacion: TMemo
      Left = 8
      Top = 352
      Width = 713
      Height = 161
      Lines.Strings = (
        '')
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object DBLookupComboBoxRazas: TDBLookupComboBox
      Left = 560
      Top = 16
      Width = 169
      Height = 21
      DropDownRows = 50
      KeyField = 'ID_RAZA'
      ListField = 'NOMBRE'
      ListSource = DataSourceRazas
      TabOrder = 5
    end
    object DBLookupComboBoxColor: TDBLookupComboBox
      Left = 304
      Top = 16
      Width = 169
      Height = 21
      DropDownRows = 3
      KeyField = 'ID_COLOR'
      ListField = 'NOMBRE'
      ListSource = DataSourceColor
      TabOrder = 6
    end
    object DBLookupComboBoxEstablecimiento: TDBLookupComboBox
      Left = 88
      Top = 16
      Width = 169
      Height = 21
      DropDownRows = 3
      KeyField = 'ID_ESTABLECIMIENTO'
      ListField = 'NOMBRE'
      ListSource = DataSourceEstablecimiento
      TabOrder = 7
    end
    object fechaHasta: TDateTimePicker
      Left = 287
      Top = 40
      Width = 122
      Height = 21
      Date = 43632.726518726850000000
      Time = 43632.726518726850000000
      TabOrder = 8
    end
    object btEventos: TButton
      Left = 448
      Top = 72
      Width = 185
      Height = 25
      Hint = 'Consulta a SAP por los movimientos que hubieran de ingreso'
      Caption = 'Consultar Eventos'
      TabOrder = 9
      OnClick = btEventosClick
    end
  end
  object Button5: TButton
    Left = 768
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 4
    OnClick = Button5Click
  end
  object RespuestaLog: TMemo
    Left = 16
    Top = 680
    Width = 793
    Height = 73
    Lines.Strings = (
      '')
    TabOrder = 5
  end
  object HTTPRIO1: THTTPRIO
    OnAfterExecute = HTTPRIO1AfterExecute
    WSDLLocation = 'http://192.168.1.102:1212/huella?wsdl'
    Service = 'HuellaServerService'
    Port = 'HuellaServerPort'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soDocument, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 800
    Top = 24
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = [tfError, tfTransact]
    Left = 800
    Top = 64
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultAction = TACommitRetaining
    AutoStopAction = saNone
    Left = 800
    Top = 96
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 800
    Top = 128
  end
  object IBStoredProc1: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 800
    Top = 160
  end
  object DataSourceRazas: TDataSource
    DataSet = IBQueryRazas
    Left = 800
    Top = 232
  end
  object IBQueryRazas: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM COD_RAZAS')
    Left = 768
    Top = 232
  end
  object DataSourceColor: TDataSource
    DataSet = IBQueryColor
    Left = 800
    Top = 272
  end
  object IBQueryColor: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM COD_COLORES')
    Left = 768
    Top = 272
  end
  object DataSourceEstablecimiento: TDataSource
    DataSet = IBQueryEstablecimiento
    Left = 800
    Top = 312
  end
  object IBQueryEstablecimiento: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM TAB_ESTABLECIMIENTOS')
    Left = 768
    Top = 312
  end
end
