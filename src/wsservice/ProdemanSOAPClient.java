package wsserver;

//import com.sap.document.sap.rfc.functions.*;
import java.net.URL;
 
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.Holder;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.util.List;
import java.util.ArrayList;

public class ProdemanSOAPClient {

	private String movimientoAlta = "971";
	private String movimientoBaja = "973";
	private String movimientoModificacion = "309";

	/**
	 * Recibe un string y devuelve un array de animales
	 */
	private ArrayList<Animal> procesarRespuestaMovimiento(String respuesta)
	{
		ArrayList<Animal> output = new ArrayList<Animal>();

		Document document = EasyClient.convertStringToDocument(respuesta);

		Node nodeFE_OUTPUT = document.getElementsByTagName("FE_OUTPUT").item(0);
		NodeList listaOutput = nodeFE_OUTPUT.getChildNodes();

		for (int temp = 0; temp < listaOutput.getLength(); temp++) {
			Node nodo = listaOutput.item(temp);

			if (nodo.getNodeType() == Node.ELEMENT_NODE) {

				if (Animal.esCategoriaAnimal(nodo))
				{
					Animal animal = new Animal(nodo);
					output.add(animal);
				}
			}
		}
		return output;
	}

	/**
	 * Procesa el string de la respuesta del service para extraer el error (-1)
	 * o el id de material (id de animal nuevo en SAP o modificado)
	 */
	private String procesarRespuestaCreacion(String respuesta)
	{
		Document document = EasyClient.convertStringToDocument(respuesta);
		String output;
		String errorCode;
		try {
			Node typeError = document.getElementsByTagName("TYPE").item(0);
			errorCode = typeError.getTextContent();
			
			if (errorCode.equals("E"))
			{
				Node nodeMessage = document.getElementsByTagName("MESSAGE").item(0);
				output = "-1 | " + 	nodeMessage.getTextContent();
			} else 
			{
				Node nodeMESSAGE_V1 = document.getElementsByTagName("MESSAGE_V1").item(0);
				output = nodeMESSAGE_V1.getTextContent();
			}
		}
		 catch (Exception e) {
			output = "-1";
		}

		return output;
	}
	/**
	 * Simula un pedido, sin necesidad de conectar al web Service de prodeman
	 */
	public ArrayList<Animal> mock_consultaMovimiento(String desde, String hasta)
	{
		String respuestaPrueba = EasyClient.getStringService("prueba.xml");
		ProdemanSOAPClient p = new ProdemanSOAPClient();
		ArrayList<Animal> l = p.procesarRespuestaMovimiento(respuestaPrueba);
		return l;

	}

	/**
	 * Simula una llamada al servicio de creacion.
	 */
	private String mock_creacion()
	{
		String respuestaPrueba = EasyClient.getStringService("prueba2.xml");
		ProdemanSOAPClient p = new ProdemanSOAPClient();
		String material = p.procesarRespuestaCreacion(respuestaPrueba);

		System.out.println("XML Recibido:");
		System.out.println(respuestaPrueba);
		System.out.println();

		return material;
	}
	/**
	 * Simula un alta, para poder procesar la respuesta
	 */
	public String mock_altaAnimal(String fecha, String caravana, String categoria)
	{
		return mock_creacion();
	}

	public String mock_bajaAnimal(String fecha, String caravana, String categoria)
	{
		return mock_creacion();
	}

	public String mock_cambioCategoria(String fecha, String caravana, 
				String categoria, String categoriaNueva)
	{
		return mock_creacion();
	}	

	public static void main(String[] args) {
		String respuestaPrueba = EasyClient.getStringService("prueba2.xml");
		ProdemanSOAPClient p = new ProdemanSOAPClient();
		
		String o = p.procesarRespuestaCreacion(respuestaPrueba);
		System.out.println(o);
	}

	/**
	 * Envia el pedido al servicio de prodeman
	 */
	public ArrayList<Animal> consultaMovimiento(String desde, String hasta)
    {
        EasyClient easyClient = new EasyClient();

        String respuesta = easyClient.getMovimientos(desde, hasta);

		ArrayList<Animal> procesado = procesarRespuestaMovimiento(respuesta);

    	return procesado;
    }

	/**
	 * El alta de un animal de una categoria, devuelve el codigo de material del animal
	 * es decir el Id del animal en SAP
	 */
	public String alta(String fecha, String caravana, String categoria)
	{
		System.out.println("ALTA: "+fecha+" "+caravana+ " "+categoria);
		EasyClient easyClient = new EasyClient();

		String respuesta = easyClient.setMovimiento(
			fecha, this.movimientoAlta, caravana, categoria, null);

		String materialId = procesarRespuestaCreacion(respuesta);

    	return materialId;
	}

	/**
	 * La baja de un animal con una caravana, devuelve el codigo de material del animal
	 * es decir el Id del animal en SAP (o -1 en error)
	 */	
	public String baja(String fecha, String caravana, String categoria)
	{
		System.out.println("BAJA: "+fecha+" "+caravana+ " "+categoria);
		EasyClient easyClient = new EasyClient();

		String respuesta = easyClient.setMovimiento(
			fecha, this.movimientoBaja, caravana, categoria, null);

		String materialId = procesarRespuestaCreacion(respuesta);

		return materialId;
	}

	public String modificacion(String fecha, String caravana, 
		String categoriaAnterior, String categoriaNueva)
	{
		EasyClient easyClient = new EasyClient();

		String respuesta = easyClient.setMovimiento(
			fecha, this.movimientoModificacion, caravana, 
			categoriaAnterior, categoriaNueva);

		String materialId = procesarRespuestaCreacion(respuesta);


		return materialId;
	}
	
	
}
