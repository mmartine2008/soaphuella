package wsserver;

import javax.xml.ws.Endpoint;

import wsserver.HuellaServer;

public class HuellaServiceStarter {

	private static void mostrarMensajeError() 
	{
		System.out.println("Mal la cantidad de parametros");
		System.out.println("Utilice java wsserver.HuellaServiceStarter http localhost 1212 huella");
	}

	private static void iniciarServidor(String[] args)
	{
		// String protocolo = "http";
		// String host = "MarianoDesarrollo";
		// String port = "1212";
		// String endPoint = "huella";

		String protocolo = args[0];
		String host = args[1];
		String port = args[2];
		String endPoint = args[3];
		
		String url = protocolo+"://"+host+":"+port+"/"+endPoint;
		String wsdl = url + "?" + "wsdl";

		Endpoint.publish(url, new HuellaServer());

		System.out.println("Servicio Huella Iniciado en  @ " + url);
		System.out.println("Puede obtener el WSDL en "+wsdl);
		System.out.println("Para cerrar presione CTRL+C");
	}

	public static void main(String[] args) {

		if (args.length < 4)
		{
			mostrarMensajeError();
		} else
		{
			iniciarServidor(args);
		}
	
	}

}