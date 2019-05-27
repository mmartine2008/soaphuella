package wsserver;

import javax.jws.WebMethod;
import javax.jws.WebResult;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.ws.ResponseWrapper;
import javax.jws.soap.SOAPBinding;
import java.util.List;
import java.util.ArrayList;

@WebService
@SOAPBinding(style=SOAPBinding.Style.RPC)
public class HuellaServer {

	// Estas son constantes del servicio:
	// Eventualmente las levantara de un archivo
	private String ganado = "120010101";
	private String centro = "5010";
	private String almacen = "A001";


	/**
	* Logging interno del servicio. 
	* Por ahora solo emite por pantalla
	*/
	protected void logging(String mensaje)
	{
		System.out.println(mensaje);
	}

	@WebMethod
	@WebResult(name="animales", partName="animales")
	public String[] consultaMovimiento(
		@WebParam(name="desde", mode=WebParam.Mode.IN)
		String desde,
		@WebParam(name="hasta", mode=WebParam.Mode.IN)
		String hasta) {
		this.logging("consultaMovimiento "+desde+" "+hasta);

		ProdemanSOAPClient prodemanSOAPClient = new ProdemanSOAPClient();
		
		// Esta linea consulta al servicio
//		ArrayList<Animal> respuesta = prodemanSOAPClient.consultaMovimiento(desde, hasta);
		// Esta linea (alternativa) consulta un archivo simulado
		ArrayList<Animal> respuesta = prodemanSOAPClient.mock_consultaMovimiento(desde, hasta);

		String[] output = new String[respuesta.size()];

		int i = 0;
		for (Animal animal : respuesta) {
			output[i++] = animal.rp + '|' + animal.categoria + '|' + animal.fecha;
	 	}

		return output;
	}

	@WebMethod
	public String alta(
		@WebParam(name="fecha", mode=WebParam.Mode.IN) 
		String fecha, 
		@WebParam(name="categoria", mode=WebParam.Mode.IN) 
		String categoria)
	{
		String resultado = "Ok";

		String consulta = "Movimiento:";
		consulta += " Material:"+ categoria;
		consulta += " Centro:" + this.centro;
		consulta += " Almacen:" + this.almacen;
		consulta += " Fecha:"+ fecha;
		consulta += " TipoMovimiento: Alta";

		ProdemanSOAPClient prodemanSOAPClient = new ProdemanSOAPClient();

		// Esta linea consulta al servicio
		//resultado = prodemanSOAPClient.alta(fecha, categoria);
		// Esta linea simula el servicio
		resultado = prodemanSOAPClient.mock_altaAnimal(fecha, categoria);
		
		consulta += " Id Nuevo: " +resultado;
		this.logging(consulta);

		return resultado;
	}

	@WebMethod
	public String baja(
		@WebParam(name="fecha", mode=WebParam.Mode.IN)
		String fecha, 
		@WebParam(name="caravana", mode=WebParam.Mode.IN)
		String caravana)
	{
		String resultado = "Ok";

		String consulta = "Movimiento:";
		consulta += " Material:"+ caravana;
		consulta += " Centro:" + this.centro;
		consulta += " Almacen:" + this.almacen;
		consulta += " Fecha:"+ fecha;
		consulta += " TipoMovimiento: Baja";

		ProdemanSOAPClient prodemanSOAPClient = new ProdemanSOAPClient();

		// Esta linea consulta al servicio
		resultado = prodemanSOAPClient.baja(fecha, caravana);
		// Esta linea simula el servicio
		// ??
		
		consulta += " Id borrado: " +resultado;
		this.logging(consulta);

		return resultado;		
	}

	@WebMethod	
	public String modificacion(
			@WebParam(name="fecha", mode=WebParam.Mode.IN)
			String fecha, 
			@WebParam(name="caravana", mode=WebParam.Mode.IN)
			String caravana, 
			@WebParam(name="categoria", mode=WebParam.Mode.IN)
			String categoria)
	{
		String resultado = "Ok";

		String consulta = "Movimiento:";
		consulta += " Material:"+ categoria;
		consulta += " Centro:" + this.centro;
		consulta += " Almacen:" + this.almacen;
		consulta += " Fecha:"+ fecha;
		consulta += " TipoMovimiento: Modificacion";

		ProdemanSOAPClient prodemanSOAPClient = new ProdemanSOAPClient();

		// Esta linea consulta al servicio
		resultado = prodemanSOAPClient.modificacion(fecha, caravana, categoria);
		// Esta linea simula el servicio
		// -- ??;
		
		consulta += " Id modificado: " +resultado;
		this.logging(consulta);

		return resultado;		
	}		
}
