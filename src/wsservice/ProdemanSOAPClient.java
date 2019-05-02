package wsserver;

import com.sap.document.sap.rfc.functions.*;
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

				Animal animal = new Animal(nodo);
				output.add(animal);

			}
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

	public static void main(String[] args) {
		String respuestaPrueba = EasyClient.getStringService("prueba.xml");
		ProdemanSOAPClient p = new ProdemanSOAPClient();
		
		p.procesarRespuestaMovimiento(respuestaPrueba);
		
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

	protected String movimiento(String fecha, String caravana, String movimiento)
	{
		return "";
	}

	public String alta(String fecha, String caravana)
	{
    	return "";
	}

	public String baja(String fecha, String caravana)
	{
		return "";
	}

	public String modificacion(String fecha, String caravana)
	{
		return "";
	}
	
	
}
