
package com.sap.document.sap.rfc.functions;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="FE_OUTPUT" type="{urn:sap-com:document:sap:rfc:functions}ZMM_OUTPUT_WS_MOV_TT"/>
 *         &lt;element name="FE_RETURN" type="{urn:sap-com:document:sap:rfc:functions}BAPIRET2_T"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "feoutput",
    "fereturn"
})
@XmlRootElement(name = "ZMM_CONSULTA_MOVIMIENTOResponse")
public class ZMMCONSULTAMOVIMIENTOResponse {

    @XmlElement(name = "FE_OUTPUT", required = true)
    protected ZMMOUTPUTWSMOVTT feoutput;
    @XmlElement(name = "FE_RETURN", required = true)
    protected BAPIRET2T fereturn;

    /**
     * Gets the value of the feoutput property.
     * 
     * @return
     *     possible object is
     *     {@link ZMMOUTPUTWSMOVTT }
     *     
     */
    public ZMMOUTPUTWSMOVTT getFEOUTPUT() {
        return feoutput;
    }

    /**
     * Sets the value of the feoutput property.
     * 
     * @param value
     *     allowed object is
     *     {@link ZMMOUTPUTWSMOVTT }
     *     
     */
    public void setFEOUTPUT(ZMMOUTPUTWSMOVTT value) {
        this.feoutput = value;
    }

    /**
     * Gets the value of the fereturn property.
     * 
     * @return
     *     possible object is
     *     {@link BAPIRET2T }
     *     
     */
    public BAPIRET2T getFERETURN() {
        return fereturn;
    }

    /**
     * Sets the value of the fereturn property.
     * 
     * @param value
     *     allowed object is
     *     {@link BAPIRET2T }
     *     
     */
    public void setFERETURN(BAPIRET2T value) {
        this.fereturn = value;
    }

}
