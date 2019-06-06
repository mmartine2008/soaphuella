object Form1: TForm1
  Left = 233
  Top = 121
  Width = 779
  Height = 648
  Caption = 'Huella - Prodeman'
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
  object GroupBox4: TGroupBox
    Left = 16
    Top = 8
    Width = 745
    Height = 590
    Caption = ' Consulta '
    TabOrder = 0
    object Label7: TLabel
      Left = 16
      Top = 104
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label9: TLabel
      Left = 232
      Top = 104
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label10: TLabel
      Left = 8
      Top = 72
      Width = 77
      Height = 13
      Caption = 'Establecimiento:'
    end
    object Label11: TLabel
      Left = 280
      Top = 72
      Width = 27
      Height = 13
      Caption = 'Color:'
    end
    object Label12: TLabel
      Left = 520
      Top = 72
      Width = 28
      Height = 13
      Caption = 'Raza:'
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 102
      Height = 13
      Caption = 'URL ProxyProdeman:'
    end
    object fechaDesde: TDateTimePicker
      Left = 72
      Top = 104
      Width = 122
      Height = 21
      Date = 43540.726518726850000000
      Time = 43540.726518726850000000
      TabOrder = 0
    end
    object btConsulta: TButton
      Left = 120
      Top = 136
      Width = 185
      Height = 25
      Hint = 'Consulta a SAP por los movimientos que hubieran de ingreso'
      Caption = 'Consultar Movimientos'
      TabOrder = 1
      OnClick = btConsultaClick
    end
    object StringGridResultado: TStringGrid
      Left = 24
      Top = 176
      Width = 705
      Height = 201
      ColCount = 1
      DefaultColWidth = 128
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 2
    end
    object btMigrar: TButton
      Left = 104
      Top = 384
      Width = 193
      Height = 25
      Caption = '&Importar desde SAP'
      TabOrder = 3
      OnClick = btMigrarClick
    end
    object MemoResultadoActualizacion: TMemo
      Left = 8
      Top = 416
      Width = 713
      Height = 161
      Lines.Strings = (
        '')
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object DBLookupComboBoxRazas: TDBLookupComboBox
      Left = 560
      Top = 72
      Width = 169
      Height = 21
      DropDownRows = 50
      KeyField = 'ID_RAZA'
      ListField = 'NOMBRE'
      ListSource = DataSourceRazas
      TabOrder = 5
    end
    object DBLookupComboBoxColor: TDBLookupComboBox
      Left = 320
      Top = 72
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
      Top = 72
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
      Top = 104
      Width = 122
      Height = 21
      Date = 43724.726518726850000000
      Time = 43724.726518726850000000
      TabOrder = 8
    end
    object btEventos: TButton
      Left = 448
      Top = 136
      Width = 185
      Height = 25
      Hint = 'Consulta a SAP por los movimientos que hubieran de ingreso'
      Caption = 'Consultar Eventos'
      TabOrder = 9
      OnClick = btEventosClick
    end
    object btExportar: TButton
      Left = 312
      Top = 384
      Width = 201
      Height = 25
      Caption = '&Exportar a SAP'
      TabOrder = 10
      OnClick = btExportarClick
    end
    object urlProxy: TEdit
      Left = 128
      Top = 24
      Width = 513
      Height = 21
      TabOrder = 11
      Text = 'http://192.168.1.102:1212/huella'
    end
  end
  object Button5: TButton
    Left = 664
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 1
    OnClick = Button5Click
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 'http://192.168.1.102:1212/huella?wsdl'
    Service = 'HuellaServerService'
    Port = 'HuellaServerPort'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soDocument, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 712
    Top = 168
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
    Left = 712
    Top = 208
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultAction = TACommitRetaining
    AutoStopAction = saNone
    Left = 712
    Top = 240
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 712
    Top = 272
  end
  object IBStoredProc1: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 712
    Top = 304
  end
  object DataSourceRazas: TDataSource
    DataSet = IBQueryRazas
    Left = 712
    Top = 376
  end
  object IBQueryRazas: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM COD_RAZAS')
    Left = 680
    Top = 376
  end
  object DataSourceColor: TDataSource
    DataSet = IBQueryColor
    Left = 712
    Top = 416
  end
  object IBQueryColor: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM COD_COLORES')
    Left = 680
    Top = 416
  end
  object DataSourceEstablecimiento: TDataSource
    DataSet = IBQueryEstablecimiento
    Left = 712
    Top = 456
  end
  object IBQueryEstablecimiento: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM TAB_ESTABLECIMIENTOS')
    Left = 680
    Top = 456
  end
end
