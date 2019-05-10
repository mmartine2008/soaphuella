// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:1212/huella?wsdl
// Encoding : UTF-8
// Codegen  : [wfDebug,wfOneOutIsReturn,wfAmbiguousComplexTypesAsArray,wfMapArraysToClasses,wfUseSerializerClassForAttrs]
// Version  : 1.0
// (03/05/2019 11:01:30 a.m. - 1.33.2.5)
// ************************************************************************ //

unit huella;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:consultaMovimiento - "http://wsserver/"
  // !:consultaMovimientoResponse - "http://wsserver/"
  // !:alta            - "http://wsserver/"
  // !:altaResponse    - "http://wsserver/"
  // !:baja            - "http://wsserver/"
  // !:bajaResponse    - "http://wsserver/"
  // !:modificacion    - "http://wsserver/"
  // !:modificacionResponse - "http://wsserver/"


  // ************************************************************************ //
  // Namespace : http://wsserver/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : HuellaServerPortBinding
  // service   : HuellaServerService
  // port      : HuellaServerPort
  // URL       : http://localhost:1212/huella
  // ************************************************************************ //
  HuellaServer = interface(IInvokable)
  ['{95D6A290-4AEA-6330-BBE5-6DB4CBF51A2B}']
    procedure consultaMovimiento(const arg0: WideString; const arg1: WideString; var arg3: WideString); stdcall;
    procedure alta(const arg0: WideString; const arg1: WideString); stdcall;
    procedure baja(const arg0: WideString; const arg1: WideString); stdcall;
    procedure modificacion(const arg0: WideString; const arg1: WideString); stdcall;
  end;

function GetHuellaServer(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): HuellaServer;


implementation

function GetHuellaServer(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): HuellaServer;
const
  defWSDL = 'http://localhost:1212/huella?wsdl';
  defURL  = 'http://localhost:1212/huella';
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
  InvRegistry.RegisterInvokeOptions(TypeInfo(HuellaServer), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(HuellaServer), ioLiteral);

end. 
