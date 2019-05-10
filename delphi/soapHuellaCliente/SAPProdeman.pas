unit SAPProdeman;

interface

uses
    wsdlSAPProdeman, Classes, Grids, IBQuery, Variants, Controls, SysUtils;

procedure procesarResultadoConsulta(StringGridResultado: TStringGrid; movimientos: stringArray);
procedure obtenerCategoriaSexo(CategoriaNombre: String; var CategoriaId, SexoId: integer; query: TIBQuery);
function calculaFechaNacimiento(CategoriaNombre: String; FechaIngreso: TDate): TDate;
function calcularFechaDesdeString(fecha: String):TDate;
function idAnimalNuevo(query: TIBQuery):integer;

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

end.
