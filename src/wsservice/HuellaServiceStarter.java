package wsserver;

import javax.xml.ws.Endpoint;

import wsserver.HuellaServer;

public class HuellaServiceStarter {

	public static void main(String[] args) {

		String port = "1212";
		String endPoint = "huella";
		String url = "http://localhost:"+port+"/"+endPoint;
		String wsdl = url + "?" + "wsdl";

		Endpoint.publish(url, new HuellaServer());

		System.out.println("Servicio Huella Iniciado en  @ " + url);
		System.out.println("Puede obtener el WSDL en "+wsdl);
		System.out.println("Para cerrar presione CTRL+C");
	
	}

}