
package wsserver;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the wsserver package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _AltaResponse_QNAME = new QName("http://wsserver/", "altaResponse");
    private final static QName _Baja_QNAME = new QName("http://wsserver/", "baja");
    private final static QName _Alta_QNAME = new QName("http://wsserver/", "alta");
    private final static QName _ConsultaMovimiento_QNAME = new QName("http://wsserver/", "consultaMovimiento");
    private final static QName _Modificacion_QNAME = new QName("http://wsserver/", "modificacion");
    private final static QName _ModificacionResponse_QNAME = new QName("http://wsserver/", "modificacionResponse");
    private final static QName _BajaResponse_QNAME = new QName("http://wsserver/", "bajaResponse");
    private final static QName _ConsultaMovimientoResponse_QNAME = new QName("http://wsserver/", "consultaMovimientoResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: wsserver
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ConsultaMovimientoResponse }
     * 
     */
    public ConsultaMovimientoResponse createConsultaMovimientoResponse() {
        return new ConsultaMovimientoResponse();
    }

    /**
     * Create an instance of {@link Alta }
     * 
     */
    public Alta createAlta() {
        return new Alta();
    }

    /**
     * Create an instance of {@link BajaResponse }
     * 
     */
    public BajaResponse createBajaResponse() {
        return new BajaResponse();
    }

    /**
     * Create an instance of {@link ConsultaMovimiento }
     * 
     */
    public ConsultaMovimiento createConsultaMovimiento() {
        return new ConsultaMovimiento();
    }

    /**
     * Create an instance of {@link Modificacion }
     * 
     */
    public Modificacion createModificacion() {
        return new Modificacion();
    }

    /**
     * Create an instance of {@link ModificacionResponse }
     * 
     */
    public ModificacionResponse createModificacionResponse() {
        return new ModificacionResponse();
    }

    /**
     * Create an instance of {@link AltaResponse }
     * 
     */
    public AltaResponse createAltaResponse() {
        return new AltaResponse();
    }

    /**
     * Create an instance of {@link Baja }
     * 
     */
    public Baja createBaja() {
        return new Baja();
    }

    /**
     * Create an instance of {@link Animal }
     * 
     */
    public Animal createAnimal() {
        return new Animal();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AltaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://wsserver/", name = "altaResponse")
    public JAXBElement<AltaResponse> createAltaResponse(AltaResponse value) {
        return new JAXBElement<AltaResponse>(_AltaResponse_QNAME, AltaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Baja }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://wsserver/", name = "baja")
    public JAXBElement<Baja> createBaja(Baja value) {
        return new JAXBElement<Baja>(_Baja_QNAME, Baja.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Alta }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://wsserver/", name = "alta")
    public JAXBElement<Alta> createAlta(Alta value) {
        return new JAXBElement<Alta>(_Alta_QNAME, Alta.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ConsultaMovimiento }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://wsserver/", name = "consultaMovimiento")
    public JAXBElement<ConsultaMovimiento> createConsultaMovimiento(ConsultaMovimiento value) {
        return new JAXBElement<ConsultaMovimiento>(_ConsultaMovimiento_QNAME, ConsultaMovimiento.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Modificacion }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://wsserver/", name = "modificacion")
    public JAXBElement<Modificacion> createModificacion(Modificacion value) {
        return new JAXBElement<Modificacion>(_Modificacion_QNAME, Modificacion.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ModificacionResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://wsserver/", name = "modificacionResponse")
    public JAXBElement<ModificacionResponse> createModificacionResponse(ModificacionResponse value) {
        return new JAXBElement<ModificacionResponse>(_ModificacionResponse_QNAME, ModificacionResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BajaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://wsserver/", name = "bajaResponse")
    public JAXBElement<BajaResponse> createBajaResponse(BajaResponse value) {
        return new JAXBElement<BajaResponse>(_BajaResponse_QNAME, BajaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ConsultaMovimientoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://wsserver/", name = "consultaMovimientoResponse")
    public JAXBElement<ConsultaMovimientoResponse> createConsultaMovimientoResponse(ConsultaMovimientoResponse value) {
        return new JAXBElement<ConsultaMovimientoResponse>(_ConsultaMovimientoResponse_QNAME, ConsultaMovimientoResponse.class, null, value);
    }

}
