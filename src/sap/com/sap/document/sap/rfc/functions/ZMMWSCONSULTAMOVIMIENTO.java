
package com.sap.document.sap.rfc.functions;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Holder;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.9-b130926.1035
 * Generated source version: 2.2
 * 
 */
@WebService(name = "ZMM_WS_CONSULTA_MOVIMIENTO", targetNamespace = "urn:sap-com:document:sap:rfc:functions")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface ZMMWSCONSULTAMOVIMIENTO {


    /**
     * 
     * @param feOUTPUT
     * @param feRETURN
     * @param fiFECHA
     */
    @WebMethod(operationName = "ZMM_CONSULTA_MOVIMIENTO", action = "urn:sap-com:document:sap:rfc:functions:ZMM_WS_CONSULTA_MOVIMIENTO:ZMM_CONSULTA_MOVIMIENTORequest")
    @RequestWrapper(localName = "ZMM_CONSULTA_MOVIMIENTO", targetNamespace = "urn:sap-com:document:sap:rfc:functions", className = "com.sap.document.sap.rfc.functions.ZMMCONSULTAMOVIMIENTO")
    @ResponseWrapper(localName = "ZMM_CONSULTA_MOVIMIENTOResponse", targetNamespace = "urn:sap-com:document:sap:rfc:functions", className = "com.sap.document.sap.rfc.functions.ZMMCONSULTAMOVIMIENTOResponse")
    public void zmmCONSULTAMOVIMIENTO(
        @WebParam(name = "FI_FECHA", targetNamespace = "")
        ZMMRANGOFECHATT fiFECHA,
        @WebParam(name = "FE_OUTPUT", targetNamespace = "", mode = WebParam.Mode.OUT)
        Holder<ZMMOUTPUTWSMOVTT> feOUTPUT,
        @WebParam(name = "FE_RETURN", targetNamespace = "", mode = WebParam.Mode.OUT)
        Holder<BAPIRET2T> feRETURN);

}
