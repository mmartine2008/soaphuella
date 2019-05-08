unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, huella, DB, DBClient, SOAPConn,
  InvokeRegistry, Rio, SOAPHTTPClient, Grids;

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
    consultaBt: TButton;
    Label8: TLabel;
    fechaHasta: TDateTimePicker;
    Label9: TLabel;
    Button5: TButton;
    RespuestaLog: TMemo;
    HTTPRIO1: THTTPRIO;
    StringGridResultado: TStringGrid;
    procedure Button5Click(Sender: TObject);
    procedure altaBtClick(Sender: TObject);
    procedure bajaBtClick(Sender: TObject);
    procedure modificaBtClick(Sender: TObject);
    procedure consultaBtClick(Sender: TObject);
    procedure HTTPRIO1AfterExecute(const MethodName: String;
      SOAPResponse: TStream);
  private
    { Private declarations }
    procedure alta;
    procedure baja;
    procedure consulta;
    procedure modificacion;

    function getFecha(fechaPicker: TDateTimePicker): String;

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
  fechaStr1, fechaStr2, rta: String;
  //another : item;
  another : WideString;
  movimientos: stringArray;
  i, xPos: integer;
  rp, categoria: string;
begin
  ws := GetHuellaServer(false, '', HTTPRIO1);

  fechaStr1 := getFecha(fechaDesde);
  fechaStr2 := getFecha(fechaHasta);
  movimientos := ws.consultaMovimiento(fechaStr1, fechaStr2);

  StringGridResultado.ColCount := 2;
  StringGridResultado.RowCount := 2;
  StringGridResultado.FixedRows := 1;
  StringGridResultado.Cells[0, 0] := 'RP';
  StringGridResultado.Cells[1, 0] := 'Categoria';

  for i := 0 to length(movimientos) -1 do
  begin
    StringGridResultado.RowCount := StringGridResultado.RowCount +1;


    another := movimientos[i];

    xPos := pos('|', another);
    rp := copy(another, 1, xPos);
    categoria := copy(another, xPos+1, length(another) - xPos +1);

    StringGridResultado.Cells[0, i +1] := rp;
    StringGridResultado.Cells[1, i +1] := categoria;

    //Memo1.Lines.Add('- '+ another.SRP+' - '+another.RP);
    //Memo1.Lines.Add('- '+ another);

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

procedure TForm1.consultaBtClick(Sender: TObject);
begin
  consulta;
end;

procedure TForm1.HTTPRIO1AfterExecute(const MethodName: String;
  SOAPResponse: TStream);
begin
  SOAPResponse.Position := 0;
  RespuestaLog.Lines.LoadFromStream(SOAPResponse);

end;

end.
