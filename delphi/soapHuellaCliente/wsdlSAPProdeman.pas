// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.1.102:1212/huella?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (06/06/2019 04:58:21 p.m. - 1.33.2.5)
// ************************************************************************ //

unit wsdlSAPProdeman;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  stringArray = Array of String;
  
  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:stringArray     - "http://jaxb.dev.java.net/array"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : http://wsserver/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : HuellaServerPortBinding
  // service   : HuellaServerService
  // port      : HuellaServerPort
  // URL       : http://192.168.1.102:1212/huella
  // ************************************************************************ //
  HuellaServer = interface(IInvokable)
  ['{95D6A290-4AEA-6330-BBE5-6DB4CBF51A2B}']
    function  consultaMovimiento(const desde: WideString; const hasta: WideString): stringArray; stdcall;
    function  alta(const fecha: WideString; const caravana: WideString; const categoria: WideString): WideString; stdcall;
    function  baja(const fecha: WideString; const caravana: WideString; const categoria: WideString): WideString; stdcall;
    function  modificacion(const fecha: WideString; const caravana: WideString; const categoriaAnterior: WideString; const categoriaNueva: WideString): WideString; stdcall;
    procedure setMocking(const arg0: Boolean); stdcall;
  end;

function GetHuellaServer(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): HuellaServer;


implementation

function GetHuellaServer(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): HuellaServer;
const
  defWSDL = 'http://192.168.1.102:1212/huella?wsdl';
  defURL  = 'http://192.168.1.102:1212/huella';
  defSvc  = 'HuellaServerService';
  defPrt  = 'HuellaServerPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as HuellaServer);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(HuellaServer), 'http://wsserver/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(HuellaServer), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(HuellaServer), ioDefault);

end.