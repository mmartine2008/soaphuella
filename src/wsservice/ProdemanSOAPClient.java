package wsserver;

import com.sap.document.sap.rfc.functions.*;
import java.net.URL;
 
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.Holder;

public class ProdemanSOAPClient {
	
	public static void main(String[] args) {
		
	}

    public String consultaMovimiento(String desde, String hasta)
    {

    	return "";
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

	private static void pruebaConexion() {

		try {
			ZMMRANGOFECHATT fiFECHA = new ZMMRANGOFECHATT();
			Holder<ZMMOUTPUTWSMOVTT> feOUTPUT = new Holder<ZMMOUTPUTWSMOVTT>();
			Holder<BAPIRET2T> feRETURN = new Holder<BAPIRET2T>();

			ZMMWSCONSULTAMOVIMIENTO_Service service = new ZMMWSCONSULTAMOVIMIENTO_Service(); 
			ZMMWSCONSULTAMOVIMIENTO ws = service.getZMMWSCONSULTAMOVIMIENTO();

			ZMMRANGOFECHAST item = new ZMMRANGOFECHAST();
			item.setSIGN("I");
			item.setOPTION("BT");
			item.setLOW("2019-01-01");
			item.setHIGH("2019-04-01");

			fiFECHA.getItem().add(item);

			ws.zmmCONSULTAMOVIMIENTO(fiFECHA, feOUTPUT, feRETURN);

			System.out.println(feRETURN);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}
