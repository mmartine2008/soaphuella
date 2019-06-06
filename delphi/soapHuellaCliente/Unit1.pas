unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, DBClient, SOAPConn,
  InvokeRegistry, Rio, SOAPHTTPClient, Grids, IBStoredProc,
  IBCustomDataSet, IBQuery, IBDatabase, SAPProdeman, wsdlSAPProdeman,
  DBCtrls, UDBLookupComboBoxAuto, IBUpdateSQL;

type
  TForm1 = class(TForm)
    GroupBox4: TGroupBox;
    Label7: TLabel;
    fechaDesde: TDateTimePicker;
    btConsulta: TButton;
    Label9: TLabel;
    Button5: TButton;
    HTTPRIO1: THTTPRIO;
    StringGridResultado: TStringGrid;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    IBStoredProc1: TIBStoredProc;
    btMigrar: TButton;
    MemoResultadoActualizacion: TMemo;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DataSourceRazas: TDataSource;
    IBQueryRazas: TIBQuery;
    DBLookupComboBoxRazas: TDBLookupComboBox;
    DataSourceColor: TDataSource;
    IBQueryColor: TIBQuery;
    DBLookupComboBoxColor: TDBLookupComboBox;
    DataSourceEstablecimiento: TDataSource;
    IBQueryEstablecimiento: TIBQuery;
    DBLookupComboBoxEstablecimiento: TDBLookupComboBox;
    fechaHasta: TDateTimePicker;
    btEventos: TButton;
    btExportar: TButton;
    Label1: TLabel;
    urlProxy: TEdit;
    procedure Button5Click(Sender: TObject);
    procedure btConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btMigrarClick(Sender: TObject);
    procedure btEventosClick(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
  private
    { Private declarations }


    procedure consulta;

    procedure migrarConsulta;
    procedure consultaEventos;
    procedure desahabilitaBotones;
    function getFecha(fechaPicker: TDateTimePicker): String;
    procedure exportarEventos;
    function eventoNuevo(fecha, caravana, categoria: String):string;
    function eventoBaja(fecha, caravana, categoria: String):string;
    function eventoCambio(fecha, caravana, categoria, categoriaNueva: String):string;
    procedure procesarError(ID_RP, Evento, docMaterial: String);
    procedure procesarEvento(ID_RP, fecha, categoria, Evento, categoriaNueva : String);

    function chequearDatosNecesarios: boolean;
    function chequearEstablecimiento: boolean;
    function chequearRaza: boolean;
    function chequerColor: boolean;

    function getConector: HuellaServer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button5Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.desahabilitaBotones;
begin
  btMigrar.Enabled := false;
  btExportar.Enabled := false;
end;


function TForm1.getFecha(fechaPicker: TDateTimePicker): String;
var
  fecha: TDate;
  fechaStr, sMonth, sDay: String;
  myYear, myMonth, myDay : Word;

begin
  fecha := fechaPicker.Date;
  DecodeDate(fecha, myYear, myMonth, myDay);
  sMonth :=  IntToStr(myMonth);
  sDay :=     IntToStr(myDay);

  if myMonth < 10 then
  begin
     sMonth := '0' +   sMonth;
  end;

  if myDay < 10 then
  begin
      sDay := '0' +   sDay;
  end;
  
  fechaStr := IntToStr(myYear) + '-' + sMonth + '-' + sDay;

  getFecha := fechaStr;
end;

procedure TForm1.consulta;
var
  ws: HuellaServer;
  fechaStr1, fechaStr2: String;
  movimientos: stringArray;

begin

  ws := getConector;

  fechaStr1 := getFecha(fechaDesde);
  fechaStr2 := getFecha(fechaHasta);
  try
    begin
      movimientos := ws.consultaMovimiento(fechaStr1, fechaStr2);
      procesarResultadoConsulta(StringGridResultado, movimientos);
      if  length(movimientos) > 0 then
      begin
        btMigrar.enabled := true;
      end;
    end
  except
    on E : Exception do
      ShowMessage('Se ha producido un error en la conexion ('+E.Message+')');
  
  end;


end;

procedure TForm1.btConsultaClick(Sender: TObject);
begin
  desahabilitaBotones;
  consulta;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IBDatabase1.DatabaseName := 'C:\bases\demo\huella.fdb';
  IBDatabase1.Connected  := true;

  IBQueryRazas.Close;
  IBQueryRazas.Open;
  IBQueryRazas.Active := true;

  IBQueryColor.Close;
  IBQueryColor.Open;
  IBQueryColor.Active := true;

  IBQueryEstablecimiento.Close;
  IBQueryEstablecimiento.Open;
  IBQueryEstablecimiento.Active := true;

  DBLookupComboBoxRazas.Enabled := true;
  DBLookupComboBoxColor.Enabled := true;
  DBLookupComboBoxEstablecimiento.Enabled := true;

  DBLookupComboBoxEstablecimiento.ListFieldIndex := 1;
  DBLookupComboBoxRazas.ListFieldIndex := 1;

  btMigrar.Enabled := false;
  btExportar.Enabled := false;
end;

function TForm1.chequearEstablecimiento: boolean;
begin
  if VarIsNull(self.DBLookupComboBoxEstablecimiento.KeyValue) then
  begin
    ShowMessage('Seleccione Establecimiento');
    chequearEstablecimiento := false;
  end
  else
  begin
    chequearEstablecimiento := true;
  end;
end;

function TForm1.chequearRaza: boolean;
begin
  if VarIsNull(self.DBLookupComboBoxRazas.KeyValue) then
  begin
    ShowMessage('Seleccione Raza');
    chequearRaza := false;
  end
  else
  begin
    chequearRaza := true;
  end;
end;

function TForm1.chequerColor: boolean;
begin
  if VarIsNull(self.DBLookupComboBoxColor.KeyValue) then
  begin
    ShowMessage('Seleccione Color');
    chequerColor := false;
  end
  else
  begin
    chequerColor := true;
  end;
end;


function TForm1.chequearDatosNecesarios: boolean;
begin
  chequearDatosNecesarios :=
    chequearEstablecimiento and
    chequerColor and chequearRaza;
end;

procedure TForm1.btMigrarClick(Sender: TObject);
begin
  if chequearDatosNecesarios then
  begin
    migrarConsulta;
  end
end;

{
Esta funcion toma los elementos de una lista y los migra a la base de datos
}
procedure TForm1.migrarConsulta;
var
  i, id_categoria, id_sexo, id_animal, id_cronologia_dentaria,
  id_establecimiento, id_raza: integer;
  id_color: integer;
  ID_RP, Categoria, fecha: String;
  FechaIngreso, FechaNacimiento: TDate;
begin
  MemoResultadoActualizacion.Lines.Clear;

  for i := 1 to StringGridResultado.RowCount -2 do
  begin
       ID_RP := StringGridResultado.Cells[0, i];
       Categoria := StringGridResultado.Cells[1, i];
       fecha := StringGridResultado.Cells[2, i];

       FechaIngreso := calcularFechaDesdeString(fecha);
       // Transformar categoria
       obtenerCategoriaSexo(Categoria, id_categoria, id_sexo, IBQuery1);
       if (id_categoria = -1) then
       begin
        MemoResultadoActualizacion.Lines.Add(
          ID_RP + ', ' + 'No existe categoria: ('+Categoria+')'
        );
        continue;
       end;
       // Recuperar los valores necesarios
       id_animal := idAnimalNuevo(IBQuery1);
       id_raza := self.DBLookupComboBoxRazas.KeyValue;
       id_color := self.DBLookupComboBoxColor.KeyValue;
       id_establecimiento := self.DBLookupComboBoxEstablecimiento.KeyValue;
       FechaNacimiento := calculaFechaNacimiento(Categoria, FechaIngreso);
       id_cronologia_dentaria :=  0;

       // Buscar si no existe ya el animal
       if (yaExisteAnimal(ID_RP, IBQuery1)) then
       begin
        MemoResultadoActualizacion.Lines.Add(
        'ID_RP:'+ ID_RP +  ' YA EXISTIA EN LA BASE DE DATOS');
       end
       else
       begin
        // Probar de insertarlo
        ingresarAnimal(
              id_rp, id_animal, id_raza, id_color,
              id_categoria, id_sexo,
              id_establecimiento, id_cronologia_dentaria,
              FechaNacimiento, IBQuery1);
        // Registrar resultado

        IBTransaction1.Commit;
        MemoResultadoActualizacion.Lines.Add(
        'ID_RP:'+ ID_RP +  ' Se agrego OK');
       end;
  end;
  
end;

procedure TForm1.btEventosClick(Sender: TObject);
begin
  desahabilitaBotones;
  consultaEventos;
end;

procedure TForm1.consultaEventos;
begin

  recuperaEventos(fechaDesde.Date, fechaHasta.Date, IBQuery1, StringGridResultado);
  if  StringGridResultado.RowCount > 1 then
  begin
    btExportar.Enabled := true;
  end;
end;

procedure TForm1.btExportarClick(Sender: TObject);
begin
  exportarEventos;
end;

procedure TForm1.procesarError(ID_RP, Evento, docMaterial: String);
begin
  if AnsiPos(docMaterial, '|') = 0 then
  begin
      MemoResultadoActualizacion.Lines.Add('El evento '+Evento+' del animal '+
              ID_RP+' se realiz� con Documento:' + docMaterial);
  end
  else
  begin
    MemoResultadoActualizacion.Lines.Add('El evento '+Evento+' del animal '+
              ID_RP+' tuvo el error:' + docMaterial);
  end;
end;


procedure TForm1.procesarEvento(ID_RP, fecha, categoria,
            Evento, categoriaNueva : String) ;
var
  docMaterial: String;
begin
    if Evento = 'Nuevo' then
    begin
      docMaterial := eventoNuevo(formatearFecha(Fecha), ID_RP, formatearCategoria(categoria));
    end;

    if Evento = 'Baja' then
    begin
      docMaterial := eventoBaja(formatearFecha(Fecha), ID_RP, formatearCategoria(categoria));
    end;

    if Evento = 'Cambio' then
    begin
      docMaterial := eventoCambio(formatearFecha(Fecha), ID_RP, formatearCategoria(categoria),
                                          formatearCategoria(categoriaNueva));
    end;

    procesarError(ID_RP, Evento, docMaterial);
end;

procedure TForm1.exportarEventos;
var
  i: integer;
  ID_RP, categoria, categoriaNueva, fecha, Evento: String;
begin

  MemoResultadoActualizacion.Lines.Clear;

  for i := 1 to StringGridResultado.RowCount -1 do
  begin
    ID_RP     := StringGridResultado.Cells[0, i];
    fecha     := StringGridResultado.Cells[1, i];
    categoria := StringGridResultado.Cells[2, i];
    Evento    := StringGridResultado.Cells[3, i];
    categoriaNueva := StringGridResultado.Cells[4, i];

    procesarEvento(ID_RP, fecha, categoria, Evento, categoriaNueva);
  end;

end;

function TForm1.eventoCambio(fecha, caravana, categoria, categoriaNueva: String):string;
var
  ws: HuellaServer;
  docMaterial: String;
begin
   ws := getConector;

   docMaterial := ws.modificacion(fecha, caravana, categoria, categoriaNueva);

   eventoCambio := docMaterial;
end;

function TForm1.eventoNuevo(fecha, caravana, categoria: String):string;
var
  ws: HuellaServer;
  docMaterial: String;
begin
   ws := getConector;

   docMaterial := ws.alta(fecha, caravana, categoria);

   eventoNuevo := docMaterial;
end;

function TForm1.eventoBaja(fecha, caravana, categoria: String):string;
var
  ws: HuellaServer;
  docMaterial: String;
begin
   ws := getConector;

   docMaterial := ws.baja(fecha, caravana, categoria);

   eventoBaja := docMaterial;
end;

function TForm1.getConector: HuellaServer;
var
  ws: HuellaServer;
  defURL: String;
begin
  defURL := urlProxy.Text;

  ws := GetHuellaServer(false, defURL+ '?wsdl');

  getConector := ws;
end;

end.
