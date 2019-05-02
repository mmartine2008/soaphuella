package wsserver;

import javax.jws.WebMethod;
import javax.jws.WebResult;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import java.util.List;
import java.util.ArrayList;

// @WebService
// @SOAPBinding(style=SOAPBinding.Style.RPC)

@WebService
@SOAPBinding(style=SOAPBinding.Style.DOCUMENT,
			 use=SOAPBinding.Use.LITERAL, 
			 parameterStyle=SOAPBinding.ParameterStyle.WRAPPED)
public class HuellaServer {

	// Estas son constantes del servicio:
	// Eventualmente las levantara de un archivo
	private String ganado = "120010101";
	private String centro = "5010";
	private String almacen = "A001";
	private String movimientoAlta = "971";
	private String movimientoBaja = "973";
	private String movimientoModificacion = "309";

	/**
	* Logging interno del servicio. 
	* Por ahora solo emite por pantalla
	*/
	protected void logging(String mensaje)
	{
		System.out.println(mensaje);
	}

	@WebMethod
	@WebResult(name="animal")	
	public Animal[] consultaMovimiento(
		@WebParam(name="desde",
               targetNamespace="http://example.org/complex")
		String desde,
		@WebParam(name="hasta",
               targetNamespace="http://example.org/complex")
		String hasta) {
		this.logging("consultaMovimiento "+desde+" "+hasta);

		ProdemanSOAPClient prodemanSOAPClient = new ProdemanSOAPClient();
		
//		ArrayList<Animal> respuesta = prodemanSOAPClient.consultaMovimiento(desde, hasta);
		ArrayList<Animal> respuesta = prodemanSOAPClient.mock_consultaMovimiento(desde, hasta);

		Animal[] output = new Animal[respuesta.size()];

		int i = 0;
		for (Animal animal : respuesta) {
			output[i++] = animal;
	 	}

		return output;
	}

	protected String movimiento(String fecha, String caravana, String movimiento)
	{
		String consulta = "Movimiento:";
		consulta += " Material:"+ this.ganado;
		consulta += " Centro:" + this.centro;
		consulta += " Almacen:" + this.almacen;
		consulta += " Fecha:"+ fecha;
		consulta += " Caravana:"+ caravana;
		consulta += " TipoMovimiento:" + movimiento;

		this.logging(consulta);

		String resultado = "Ok";

		return resultado;
	}

	public String alta(String fecha, String caravana)
	{
		String resultado = 
		this.movimiento(fecha, caravana, this.movimientoAlta);

		return resultado;
	}

	public String baja(String fecha, String caravana)
	{
		String resultado = 
		this.movimiento(fecha, caravana, this.movimientoBaja);

		return resultado;
	}

	public String modificacion(String fecha, String caravana)
	{
		String resultado = 
		this.movimiento(fecha, caravana, this.movimientoModificacion);

		return resultado;
	}		
}
