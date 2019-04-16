unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, huella;

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
    Memo1: TMemo;
    RespuestaLog: TMemo;
    procedure Button5Click(Sender: TObject);
    procedure altaBtClick(Sender: TObject);
    procedure bajaBtClick(Sender: TObject);
    procedure modificaBtClick(Sender: TObject);
    procedure consultaBtClick(Sender: TObject);
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
  fechaStr: String;
  myYear, myMonth, myDay : Word;
begin
  fecha := fechaPicker.Date;
  DecodeDate(fecha, myYear, myMonth, myDay);
  fechaStr := IntToStr(myYear) + '-' + IntToStr(myMonth) + '-' + IntToStr(myDay);

  getFecha := fechaStr;
end;

procedure TForm1.alta;
var
  ws: HuellaServer;
  caravana, fechaStr, rta: String;
begin
  ws := GetHuellaServer;
  
  caravana := Edit1.Text;
  fechaStr :=  getFecha(fechaAlta);

  rta := ws.alta(fechaStr, caravana);

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

  rta := ws.baja(fechaStr, caravana);

  RespuestaLog.Lines.Add(rta);

end;

procedure TForm1.consulta;
var
  ws: HuellaServer;
  fechaStr1, fechaStr2, rta: String;
begin
  ws := GetHuellaServer;

  fechaStr1 := getFecha(fechaDesde);
  fechaStr2 := getFecha(fechaHasta);

  rta := ws.consultaMovimiento(fechaStr1, fechaStr2);

  Memo1.Lines.Add(rta);

end;

procedure TForm1.modificacion;
var
  ws: HuellaServer;
  caravana, fechaStr, rta: String;
begin
  ws := GetHuellaServer;
  
  caravana := Edit3.Text;
  fechaStr :=  getFecha(fechaModifica);

  rta := ws.modificacion(fechaStr, caravana);

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

end.