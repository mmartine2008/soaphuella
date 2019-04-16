package wsserver;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

@WebService
@SOAPBinding(style=SOAPBinding.Style.RPC)
public class HuellaServer {

	// Estas son constantes del servicio:
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

	public String consultaMovimiento(String desde, String hasta) {
		this.logging("consultaMovimiento "+desde+" "+hasta);

		return "Animal 1, Animal 2, Animal 3";
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
