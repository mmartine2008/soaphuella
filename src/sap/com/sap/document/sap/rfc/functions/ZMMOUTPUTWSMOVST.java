
package com.sap.document.sap.rfc.functions;

import java.math.BigDecimal;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ZMM_OUTPUT_WS_MOV_ST complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ZMM_OUTPUT_WS_MOV_ST">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="MAT_DOC" type="{urn:sap-com:document:sap:rfc:functions}char10"/>
 *         &lt;element name="DOC_YEAR" type="{urn:sap-com:document:sap:rfc:functions}numeric4"/>
 *         &lt;element name="DOC_DATE" type="{urn:sap-com:document:sap:rfc:functions}date10"/>
 *         &lt;element name="PSTNG_DATE" type="{urn:sap-com:document:sap:rfc:functions}date10"/>
 *         &lt;element name="ENTRY_DATE" type="{urn:sap-com:document:sap:rfc:functions}date10"/>
 *         &lt;element name="USERNAME" type="{urn:sap-com:document:sap:rfc:functions}char12"/>
 *         &lt;element name="MATDOC_ITM" type="{urn:sap-com:document:sap:rfc:functions}numeric4"/>
 *         &lt;element name="MATERIAL" type="{urn:sap-com:document:sap:rfc:functions}char40"/>
 *         &lt;element name="PLANT" type="{urn:sap-com:document:sap:rfc:functions}char4"/>
 *         &lt;element name="STGE_LOC" type="{urn:sap-com:document:sap:rfc:functions}char4"/>
 *         &lt;element name="BATCH" type="{urn:sap-com:document:sap:rfc:functions}char10"/>
 *         &lt;element name="MOVE_TYPE" type="{urn:sap-com:document:sap:rfc:functions}char3"/>
 *         &lt;element name="ENTRY_QNT" type="{urn:sap-com:document:sap:rfc:functions}quantum13.3"/>
 *         &lt;element name="ENTRY_UOM" type="{urn:sap-com:document:sap:rfc:functions}unit3"/>
 *         &lt;element name="GR_RCPT" type="{urn:sap-com:document:sap:rfc:functions}char12"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ZMM_OUTPUT_WS_MOV_ST", propOrder = {
    "matdoc",
    "docyear",
    "docdate",
    "pstngdate",
    "entrydate",
    "username",
    "matdocitm",
    "material",
    "plant",
    "stgeloc",
    "batch",
    "movetype",
    "entryqnt",
    "entryuom",
    "grrcpt"
})
public class ZMMOUTPUTWSMOVST {

    @XmlElement(name = "MAT_DOC", required = true)
    protected String matdoc;
    @XmlElement(name = "DOC_YEAR", required = true)
    protected String docyear;
    @XmlElement(name = "DOC_DATE", required = true)
    protected String docdate;
    @XmlElement(name = "PSTNG_DATE", required = true)
    protected String pstngdate;
    @XmlElement(name = "ENTRY_DATE", required = true)
    protected String entrydate;
    @XmlElement(name = "USERNAME", required = true)
    protected String username;
    @XmlElement(name = "MATDOC_ITM", required = true)
    protected String matdocitm;
    @XmlElement(name = "MATERIAL", required = true)
    protected String material;
    @XmlElement(name = "PLANT", required = true)
    protected String plant;
    @XmlElement(name = "STGE_LOC", required = true)
    protected String stgeloc;
    @XmlElement(name = "BATCH", required = true)
    protected String batch;
    @XmlElement(name = "MOVE_TYPE", required = true)
    protected String movetype;
    @XmlElement(name = "ENTRY_QNT", required = true)
    protected BigDecimal entryqnt;
    @XmlElement(name = "ENTRY_UOM", required = true)
    protected String entryuom;
    @XmlElement(name = "GR_RCPT", required = true)
    protected String grrcpt;

    /**
     * Gets the value of the matdoc property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMATDOC() {
        return matdoc;
    }

    /**
     * Sets the value of the matdoc property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMATDOC(String value) {
        this.matdoc = value;
    }

    /**
     * Gets the value of the docyear property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDOCYEAR() {
        return docyear;
    }

    /**
     * Sets the value of the docyear property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDOCYEAR(String value) {
        this.docyear = value;
    }

    /**
     * Gets the value of the docdate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDOCDATE() {
        return docdate;
    }

    /**
     * Sets the value of the docdate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDOCDATE(String value) {
        this.docdate = value;
    }

    /**
     * Gets the value of the pstngdate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPSTNGDATE() {
        return pstngdate;
    }

    /**
     * Sets the value of the pstngdate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPSTNGDATE(String value) {
        this.pstngdate = value;
    }

    /**
     * Gets the value of the entrydate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getENTRYDATE() {
        return entrydate;
    }

    /**
     * Sets the value of the entrydate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setENTRYDATE(String value) {
        this.entrydate = value;
    }

    /**
     * Gets the value of the username property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUSERNAME() {
        return username;
    }

    /**
     * Sets the value of the username property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUSERNAME(String value) {
        this.username = value;
    }

    /**
     * Gets the value of the matdocitm property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMATDOCITM() {
        return matdocitm;
    }

    /**
     * Sets the value of the matdocitm property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMATDOCITM(String value) {
        this.matdocitm = value;
    }

    /**
     * Gets the value of the material property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMATERIAL() {
        return material;
    }

    /**
     * Sets the value of the material property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMATERIAL(String value) {
        this.material = value;
    }

    /**
     * Gets the value of the plant property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPLANT() {
        return plant;
    }

    /**
     * Sets the value of the plant property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPLANT(String value) {
        this.plant = value;
    }

    /**
     * Gets the value of the stgeloc property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSTGELOC() {
        return stgeloc;
    }

    /**
     * Sets the value of the stgeloc property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSTGELOC(String value) {
        this.stgeloc = value;
    }

    /**
     * Gets the value of the batch property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBATCH() {
        return batch;
    }

    /**
     * Sets the value of the batch property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBATCH(String value) {
        this.batch = value;
    }

    /**
     * Gets the value of the movetype property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMOVETYPE() {
        return movetype;
    }

    /**
     * Sets the value of the movetype property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMOVETYPE(String value) {
        this.movetype = value;
    }

    /**
     * Gets the value of the entryqnt property.
     * 
     * @return
     *     possible object is
     *     {@link BigDecimal }
     *     
     */
    public BigDecimal getENTRYQNT() {
        return entryqnt;
    }

    /**
     * Sets the value of the entryqnt property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigDecimal }
     *     
     */
    public void setENTRYQNT(BigDecimal value) {
        this.entryqnt = value;
    }

    /**
     * Gets the value of the entryuom property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getENTRYUOM() {
        return entryuom;
    }

    /**
     * Sets the value of the entryuom property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setENTRYUOM(String value) {
        this.entryuom = value;
    }

    /**
     * Gets the value of the grrcpt property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGRRCPT() {
        return grrcpt;
    }

    /**
     * Sets the value of the grrcpt property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGRRCPT(String value) {
        this.grrcpt = value;
    }

}
