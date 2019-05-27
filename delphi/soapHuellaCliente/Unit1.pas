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
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    fechaAlta: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    altaBt: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    fechaBaja: TDateTimePicker;
    bajaBt: TButton;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    fechaModifica: TDateTimePicker;
    modificaBt: TButton;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    fechaDesde: TDateTimePicker;
    btConsulta: TButton;
    Label9: TLabel;
    Button5: TButton;
    RespuestaLog: TMemo;
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
    procedure Button5Click(Sender: TObject);
    procedure altaBtClick(Sender: TObject);
    procedure bajaBtClick(Sender: TObject);
    procedure modificaBtClick(Sender: TObject);
    procedure btConsultaClick(Sender: TObject);
    procedure HTTPRIO1AfterExecute(const MethodName: String;
      SOAPResponse: TStream);
    procedure FormCreate(Sender: TObject);
    procedure btMigrarClick(Sender: TObject);
    procedure btEventosClick(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
  private
    { Private declarations }
    procedure alta;
    procedure baja;
    procedure consulta;
    procedure modificacion;
    procedure migrarConsulta;
    procedure consultaEventos;
    procedure desahabilitaBotones;
    function getFecha(fechaPicker: TDateTimePicker): String;
    procedure exportarEventos;
    function eventoNuevo(Categoria, Fecha: String):string;
    function eventoBaja(Caravana, Fecha: String):string;  
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


procedure TForm1.altaBtClick(Sender: TObject);
begin
  alta;
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

procedure TForm1.alta;
var
  ws: HuellaServer;
  caravana, fechaStr: String;
  rta: WideString;

begin
  ws := GetHuellaServer;
  
  caravana := Edit1.Text;
  fechaStr :=  getFecha(fechaAlta);

  ws.alta(fechaStr, caravana);

  RespuestaLog.Lines.Add(rta);

end;

procedure TForm1.baja;
var
  ws: HuellaServer;
  caravana, fechaStr, rta: String;
begin
  ws := GetHuellaServer;
  
  caravana := Edit2.Text;
  fechaStr :=  getFecha(fechaBaja);

  //rta := ws.baja(fechaStr, caravana);

  RespuestaLog.Lines.Add(rta);

end;


procedure TForm1.consulta;
var
  ws: HuellaServer;
  fechaStr1, fechaStr2: String;
  movimientos: stringArray;

begin

  ws := GetHuellaServer(false, '', HTTPRIO1);

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

procedure TForm1.modificacion;
var
  ws: HuellaServer;
  caravana, fechaStr, rta: String;
begin
  ws := GetHuellaServer();

  caravana := Edit3.Text;
  fechaStr :=  getFecha(fechaModifica);

//  rta := ws.modificacion(fechaStr, caravana);

  RespuestaLog.Lines.Add(rta);

end;

procedure TForm1.bajaBtClick(Sender: TObject);
begin
  baja;
end;

procedure TForm1.modificaBtClick(Sender: TObject);
begin
  modificacion;
end;

procedure TForm1.btConsultaClick(Sender: TObject);
begin
  desahabilitaBotones;
  consulta;
end;

procedure TForm1.HTTPRIO1AfterExecute(const MethodName: String;
  SOAPResponse: TStream);
begin
  SOAPResponse.Position := 0;
  RespuestaLog.Lines.LoadFromStream(SOAPResponse);

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

procedure TForm1.btMigrarClick(Sender: TObject);
begin
  migrarConsulta;
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

procedure TForm1.exportarEventos;
var
  i: integer;
  ID_RP, Categoria, fecha, Evento: String;
  ID_NUEVO: String;
begin

  MemoResultadoActualizacion.Lines.Clear;

  for i := 1 to StringGridResultado.RowCount -2 do
  begin
    ID_RP     := StringGridResultado.Cells[0, i];
    fecha     := StringGridResultado.Cells[1, i];
    Categoria := StringGridResultado.Cells[2, i];
    Evento    := StringGridResultado.Cells[3, i];

    if Evento = 'Nuevo' then
    begin
      ID_NUEVO := eventoNuevo(Fecha, Categoria);
      MemoResultadoActualizacion.Lines.Add('Se agrego el animal '+ID_RP+' con nuevo ID:' + ID_NUEVO);
    end
    else if Evento = 'Baja' then
    begin
      ID_NUEVO := eventoBaja(ID_RP, Fecha);
      if (ID_NUEVO <> '-1') then
      begin
        MemoResultadoActualizacion.Lines.Add('Se elimino el animal '+ID_RP);
      end
      else
      begin
        MemoResultadoActualizacion.Lines.Add('Error eliminando el animal '+ID_RP);
      end;
    end
    else if Evento = 'Cambio' then
    begin
      //ID_NUEVO := eventoCambio(ID_RP, Categoria, Fecha);
    end;


  end;

end;

function TForm1.eventoNuevo(Categoria, Fecha: String):string;
var
  ws: HuellaServer;
  ID_NUEVO: String;
begin
   ws := GetHuellaServer(false, '', HTTPRIO1);

   ID_NUEVO := ws.alta(Categoria, fecha);

   eventoNuevo := ID_NUEVO;
end;

function TForm1.eventoBaja(Caravana, Fecha: String):string;
var
  ws: HuellaServer;
  ID_NUEVO: String;
begin
   ws := GetHuellaServer(false, '', HTTPRIO1);

   ID_NUEVO := ws.baja(Caravana, fecha);

   eventoBaja := ID_NUEVO;
end;

end.
