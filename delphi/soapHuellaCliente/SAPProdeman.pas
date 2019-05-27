unit SAPProdeman;

interface

uses
    wsdlSAPProdeman, Classes, Grids, IBQuery, Variants, Controls,
    SysUtils, IBUpdateSQL;

procedure procesarResultadoConsulta(StringGridResultado: TStringGrid; movimientos: stringArray);
procedure obtenerCategoriaSexo(CategoriaNombre: String; var CategoriaId, SexoId: integer; query: TIBQuery);
function calculaFechaNacimiento(CategoriaNombre: String; FechaIngreso: TDate): TDate;
function calcularFechaDesdeString(fecha: String):TDate;
function idAnimalNuevo(query: TIBQuery):integer;
function idEventoCompra(query: TIBQuery):integer;
procedure ingresarAnimal(
    id_rp: string;
    id_animal, id_raza, id_color,  id_categoria, id_sexo,
    id_establecimiento, id_cronologia_dentaria: integer;
    FechaNacimiento : TDate;
    query: TIBQuery);
function yaExisteAnimal(ID_RP:String; query: TIBQuery): boolean;
procedure recuperaEventos(fechaDesde, fechaHasta: TDate; query: TIBQuery;
                          StringGridResultado: TStringGrid);

implementation

procedure procesarResultadoConsulta(StringGridResultado: TStringGrid; movimientos: stringArray);
var
  another : String;
  datosAnimal: TStringList;
  i: integer;
begin
      StringGridResultado.ColCount := 3;
      StringGridResultado.RowCount := 2;
      StringGridResultado.FixedRows := 1;
      StringGridResultado.Cells[0, 0] := 'RP';
      StringGridResultado.Cells[1, 0] := 'Categoria';

      for i := 0 to length(movimientos) -1 do
      begin
        StringGridResultado.RowCount := StringGridResultado.RowCount +1;

        another := movimientos[i];

        datosAnimal := TStringList.Create;
        ExtractStrings(['|'], [], pChar(another), datosAnimal);

        StringGridResultado.Cells[0, i +1] := datosAnimal[0];
        StringGridResultado.Cells[1, i +1] := datosAnimal[1];
        StringGridResultado.Cells[2, i +1] := datosAnimal[2];

        datosAnimal.Destroy;
      end;
end;

procedure obtenerCategoriaSexo(CategoriaNombre: String; var CategoriaId, SexoId: integer; query: TIBQuery);
begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT ID_CATEGORIA, TIPO_SEXO FROM COD_CATEGORIAS WHERE NOMBRE = :NOMBRE');
    query.Params.ParamByName('NOMBRE').Value := CategoriaNombre;
    query.Open;


   if query.FieldByName('ID_CATEGORIA').Value <> null then
   begin
    CategoriaId := query.FieldByName('ID_CATEGORIA').Value;
    SexoId := query.FieldByName('TIPO_SEXO').Value;
   end
   else
   begin
    CategoriaId := -1;
    SexoId := -1;
   end;

end;

function calculaFechaNacimiento(CategoriaNombre: String;
                          FechaIngreso: TDate): TDate;
var
  minimoMeses: integer;
begin
  minimoMeses := 24;
  if (CategoriaNombre = 'TERNERO') OR
     (CategoriaNombre = 'TERNERA') OR
     (CategoriaNombre = 'NOVILLO') then
  begin
     minimoMeses := 8;
  end
  else if (CategoriaNombre = 'TORO')
       or (CategoriaNombre = 'VAQUILLONA') then
  begin
     minimoMeses := 10;
  end
  else if (CategoriaNombre = 'VACA') then
  begin
     minimoMeses := 24;
  end;

  calculaFechaNacimiento := FechaIngreso - minimoMeses * 30;
end;

function calcularFechaDesdeString(fecha: String):TDate;
var
  dia, mes, anio: string;
begin
  anio := copy(fecha, 1, 4);
  mes := copy(fecha, 6, 2);
  dia := copy(fecha, 9, 2);

  calcularFechaDesdeString :=  StrToDateTime(dia+'/'+mes+'/'+anio);

end;

function idAnimalNuevo(query: TIBQuery):integer;
var
  id_animal: integer;
begin
    id_animal := -1;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT GEN_ID(GEN_ID_TABANIMAL, 1)  AS ID_ANIMAL FROM RDB$DATABASE');
    query.Open;

   if query.FieldByName('ID_ANIMAL').Value <> null then
   begin
    id_animal := query.FieldByName('ID_ANIMAL').Value;
   end;

   idAnimalNuevo :=  id_animal;
end;

function idEventoCompra(query: TIBQuery):integer;
var
  id_tipo_Evento: integer;
begin
    id_tipo_Evento := -1;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT ID_TIPO_ALTA AS ID_TIPO_ALTA FROM COD_TIPOS_ALTA ');
    query.Open;

   if query.FieldByName('ID_TIPO_ALTA').Value <> null then
   begin
    id_tipo_Evento := query.FieldByName('ID_TIPO_ALTA').Value;
   end;

   idEventoCompra :=  id_tipo_Evento;
end;

procedure ingresarAnimal(id_rp: string;
    id_animal, id_raza, id_color,  id_categoria, id_sexo,
    id_establecimiento, id_cronologia_dentaria: integer;
    FechaNacimiento : TDate;
    query: TIBQuery);

var
  sqlText : string;
  
begin
  sqlText :=  'execute procedure SP_ALTA_DIRECTA_ANIMAL( '
            + ':ID_TABANIMAL,'
            + ':ID_RP, '
            + 'NULL, '
            + ':FECHA_NAC, '
            + 'NULL, NULL, NULL, '
            + '0, '
            + ':RAZA,  '
            + '0, '
            + ':CATEGORIA,   '
            + ':cronologia_dentaria, '
            + 'NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '
            + ':SEXO, '
            + 'NULL, '
            + ':HOY, '
            + '1, '
            + 'NULL, NULL, NULL, '
            + ':ESTABLECIMIENTO, '
            + '1, '
            + '1, '
            + ':HOY, '
            + 'NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '
            + 'NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '
            + 'NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '
            + ':COLOR, '
            + 'NULL, NULL '
            + ');';

    query.Close;
    query.SQL.Clear;
    query.SQL.Add(sqlText);

     query.ParamByName('ESTABLECIMIENTO').AsInteger := id_establecimiento;
     query.ParamByName('CATEGORIA').AsInteger := id_categoria;
     query.ParamByName('SEXO').AsInteger := id_categoria;
     query.ParamByName('RAZA').AsInteger := id_sexo;
     query.ParamByName('ID_TABANIMAL').AsInteger := id_animal;
     query.ParamByName('COLOR').AsInteger := id_categoria;
     query.ParamByName('cronologia_dentaria').AsInteger := id_categoria;
     query.ParamByName('FECHA_NAC').AsDateTime := FechaNacimiento;
     query.ParamByName('ID_RP').AsString := id_rp;

     query.ParamByName('HOY').AsDateTime := Now;

     query.Open;


end;

function yaExisteAnimal(ID_RP:String; query: TIBQuery): boolean;
begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM TAB_ANIMALES WHERE ID_RP = :ID_RP');
     query.ParamByName('ID_RP').AsString := ID_RP;

    query.Open;

   if query.FieldByName('CANTIDAD').Value <> 0 then
   begin
    yaExisteAnimal := true;
   end
   else
   begin
    yaExisteAnimal := false;
   end
end;


procedure iniciaGrillaEventos(StringGridResultado: TStringGrid);
begin
      StringGridResultado.ColCount := 4;
      StringGridResultado.RowCount := 2;
      StringGridResultado.FixedRows := 1;
      StringGridResultado.Cells[0, 0] := 'RP';
      StringGridResultado.Cells[1, 0] := 'Fecha';
      StringGridResultado.Cells[2, 0] := 'Categoria';
      StringGridResultado.Cells[3, 0] := 'Evento';
end;

procedure cargarGrillaResultados(query: TIBQuery;
                          StringGridResultado: TStringGrid; Evento: String);
var
  categoria: String;
  fecha: TDate;
  id_animal: String;

begin
    while not query.Eof do
    begin
       id_animal := query.FieldByName ('ANIMAL').AsString;
       fecha := query.FieldByName('FECHA').AsDateTime;
       categoria := query.FieldByName('CATEGORIA').AsString;

       StringGridResultado.Cells[0, StringGridResultado.RowCount -1] := id_animal;
       StringGridResultado.Cells[1, StringGridResultado.RowCount -1] := DateToStr(fecha);
       StringGridResultado.Cells[2, StringGridResultado.RowCount -1] := categoria;
       StringGridResultado.Cells[3, StringGridResultado.RowCount -1] := Evento;

       query.Next;
       if not query.Eof then
       begin
        StringGridResultado.RowCount := StringGridResultado.RowCount +1;
       end;

    end;
end;

procedure procesarSQLEventos(query: TIBQuery; sqlTxt: String; fechaDesde, fechaHasta: TDate) ;
begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add(sqlTxt);

    query.ParamByName('DESDE').AsString := FormatDateTime('DD/MM/YYYY', fechaDesde);
    query.ParamByName('HASTA').AsString := FormatDateTime('DD/MM/YYYY', fechaHasta);
    query.Open;
end;

function getSQLEventoAlta:String;
var
  sqlTxt: String;
begin
  sqlTxt := 'SELECT E.ANIMAL, E.FECHA, C.NOMBRE AS CATEGORIA '+
              'FROM EVE_NACIMIENTO N                           '+
              'INNER JOIN EVE_EVENTOS E ON (N.ID_EVENTO = E.ID_EVENTO) '+
              'INNER JOIN COD_CATEGORIAS C ON (C.ID_CATEGORIA = E.CATEGORIA) '+
              'WHERE E.FECHA BETWEEN :DESDE AND :HASTA ';

  getSQLEventoAlta := sqlTxt;
end;

function getSQLEventoBaja:String;
var
  sqlTxt: String;
begin
  sqlTxt := 'SELECT A.ID_RP AS ANIMAL, E.FECHA, C.NOMBRE AS CATEGORIA ' +
              'FROM EVE_BAJA N       ' +
              'INNER JOIN EVE_EVENTOS E ON (N.ID_EVENTO = E.ID_EVENTO) ' +
              'INNER JOIN TAB_ANIMALES A ON (E.ANIMAL = A.ID_ANIMAL) '+
              'INNER JOIN COD_CATEGORIAS C ON (C.ID_CATEGORIA = A.CATEGORIA) '+
              'WHERE E.FECHA BETWEEN :DESDE AND :HASTA ';

  getSQLEventoBaja := sqlTxt;
end;

procedure calcularEventosAlta(query: TIBQuery; fechaDesde, fechaHasta: TDate;
                          StringGridResultado: TStringGrid);
var
  sqlTxt: String;
begin
    sqlTxt := getSQLEventoAlta;
    procesarSQLEventos(query, sqlTxt, fechaDesde, fechaHasta);
    cargarGrillaResultados(query, StringGridResultado, 'Nuevo');
end;

procedure calcularEventosBaja(query: TIBQuery; fechaDesde, fechaHasta: TDate;
                          StringGridResultado: TStringGrid);
var
  sqlTxt: String;
begin
    sqlTxt := getSQLEventoBaja;
    procesarSQLEventos(query, sqlTxt, fechaDesde, fechaHasta);
    cargarGrillaResultados(query, StringGridResultado, 'Baja');
end;

function getSQLEventoCambio:String;
var
  sqlTxt: String;
begin
  sqlTxt := 'SELECT A.ID_RP AS ANIMAL, E.FECHA, C.NOMBRE AS CATEGORIA '+
            'FROM EVE_CAMBIO_CATEGORIA N  '+
            'INNER JOIN EVE_EVENTOS E ON (N.ID_EVENTO = E.ID_EVENTO)    '+
            'INNER JOIN TAB_ANIMALES A ON (E.ANIMAL = A.ID_ANIMAL)  '+
            'INNER JOIN COD_CATEGORIAS C ON (N.CATEGORIA_NUEVA = C.ID_CATEGORIA) '+
              'WHERE E.FECHA BETWEEN :DESDE AND :HASTA '; 

  getSQLEventoCambio := sqlTxt;
end;

procedure calcularEventosModificacion(query: TIBQuery; fechaDesde, fechaHasta: TDate;
                          StringGridResultado: TStringGrid);
var
  sqlTxt: String;
begin
    sqlTxt := getSQLEventoCambio;
    procesarSQLEventos(query, sqlTxt, fechaDesde, fechaHasta);
    cargarGrillaResultados(query, StringGridResultado, 'Cambio');
end;


{
Debe recuperar todos los eventos. Por ahora solo los de alta por nacimiento
}
procedure recuperaEventos(fechaDesde, fechaHasta: TDate; query: TIBQuery;
                          StringGridResultado: TStringGrid);

begin
    iniciaGrillaEventos(StringGridResultado);

    calcularEventosAlta(query, fechaDesde, fechaHasta, StringGridResultado);
    calcularEventosBaja(query, fechaDesde, fechaHasta, StringGridResultado);
    calcularEventosModificacion(query, fechaDesde, fechaHasta, StringGridResultado);

end;

end.
