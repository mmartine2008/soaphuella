package wsserver;

/**
 * Esta clase accede al servicio SOAP parseando el archivo XML que se encuetran en
 * /data, lo lee como texto, lo convierte a XML , le cambia los datos y lo envia
 * Todo lo lee a partir de un archivo de configuracion.
 */
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import org.xml.sax.InputSource;
import java.io.StringReader;
import java.io.IOException;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import java.lang.StringBuilder;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import java.io.StringWriter;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.OutputKeys;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;
import java.net.HttpURLConnection;
import java.net.URLConnection;
import java.net.URL;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.net.Authenticator;
import java.net.PasswordAuthentication;


public class EasyClient {

    private String username;
    private String password;

    private String baseFileConsulta; 
    private String wsEndPointConsulta; 
    private String SOAPActionConsulta; 

    private String baseFileCreacion;
    private String wsEndPointCreacion;
    private String SOAPActionCreacion; 

    private String plant;
    private String stage_loc;
    
    /**
     * Lee la configuracion del arvhico ini
     */
    private void leerConfiguracion() {
        try{
            IniFile ini = new IniFile("configuracion.ini");
            
            baseFileConsulta  = ini.getString("Consulta", "baseFileConsulta", "");
            wsEndPointConsulta = ini.getString("Consulta", "wsEndPointConsulta", "");
            SOAPActionConsulta = ini.getString("Consulta", "SOAPActionConsulta", "");

            baseFileCreacion   = ini.getString("Creacion", "baseFileCreacion", "");
            wsEndPointCreacion = ini.getString("Creacion", "wsEndPointCreacion", "");
            SOAPActionCreacion = ini.getString("Creacion", "SOAPActionCreacion", "");
            
            username   = ini.getString("Comun", "username", "");
            password   = ini.getString("Comun", "password", "");

            plant = ini.getString("Comun", "PLANT", "");
            stage_loc = ini.getString("Comun", "STGE_LOC", "");
        
        }catch(Exception e){
            System.err.println(e.getMessage());
        }        
    }

    /**
     * Devuelve el string del contenido del archivo del servicio
     * @name puede ser consulta o modificacion (por ahora solo consulta) 
     */
    public static String getStringService(String fileName)
    {
        // Lo paso a una cadena
        String response = new String();
        try {
            // Leo el archivo
            FileReader fr = new FileReader(fileName);
            BufferedReader bf = new BufferedReader(fr);

            for (String line; (line = bf.readLine()) != null; response += line.trim());

        } catch (IOException e)
        {
            System.out.println(e);
        }        

        return response;
    }

    /**
     * Recibe un string y devuelve un XML Document
     */
    public static Document convertStringToDocument(String xmlStr) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();  
        DocumentBuilder builder;  
        try  
        {  
            builder = factory.newDocumentBuilder();  
            Document doc = builder.parse( new InputSource( new StringReader( xmlStr ) ) ); 
            return doc;
        } catch (Exception e) {  
            e.printStackTrace();  
        } 
        return null;
    }    

    private String convertDocumentToString(Document doc) {
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer;
        try {
            transformer = tf.newTransformer();
            // below code to remove XML declaration
            // transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
            StringWriter writer = new StringWriter();
            transformer.transform(new DOMSource(doc), new StreamResult(writer));
            String output = writer.getBuffer().toString();
            return output;
        } catch (TransformerException e) {
            e.printStackTrace();
        }
        
        return null;
    }

    /** 
     * Prepara el pedido en el XML doc
     */
    private void prepareConsulta(String desde, String hasta, Document doc)
    {
        Node nodeDesde = doc.getElementsByTagName("LOW").item(0);
        nodeDesde.setTextContent(desde);

        Node nodeHasta = doc.getElementsByTagName("HIGH").item(0);
        nodeHasta.setTextContent(hasta);
    }

    public String getMovimientos(String desde, String hasta)
    {
        BufferedReader br;
        String response;

        leerConfiguracion();
    
        String xmlBase = getStringService(baseFileConsulta);
        Document doc = convertStringToDocument(xmlBase);
        prepareConsulta(desde, hasta, doc);
        String xmlInput = convertDocumentToString(doc);

        HttpURLConnection httpConn = getConnection(wsEndPointConsulta);
        sendRequest(httpConn, SOAPActionConsulta, xmlInput);
        response = getResponse(httpConn);

        System.out.println(response);

        return response;
    }

    /**
     * setea un valor del XML de intercambio
     */
    private void preparaParametro(Document doc, String tagName, String tagValue)
    {
        Node node = doc.getElementsByTagName(tagName).item(0);
        node.setTextContent(tagValue);
    }

    private void preparaParametrosComunes(Document doc)
    {
        preparaParametro(doc, "PLANT", plant);
        preparaParametro(doc, "STGE_LOC", stage_loc);
    }    

    /**
     * categoriaDestino puede ser null , si no es un cambio de categoria
     */
    public String setMovimiento(String fecha, String tipoMovimiento, String caravana, 
                    String categoriaOrigen, String categoriaDestino)
    {
        String response = "";
        leerConfiguracion();
    
        String xmlBase = getStringService(baseFileCreacion);

        Document doc = convertStringToDocument(xmlBase);

        preparaParametrosComunes(doc);
        preparaParametro(doc, "PSTNG_DATE", fecha);
        preparaParametro(doc, "DOC_DATE", fecha);
        preparaParametro(doc, "MOVE_TYPE", tipoMovimiento);
        preparaParametro(doc, "BATCH", caravana);
        preparaParametro(doc, "MATERIAL", categoriaOrigen);
        if (tipoMovimiento.equals("309"))  // Es un cambio
        {
            preparaParametro(doc, "MOVE_MAT", categoriaDestino);
            preparaParametro(doc, "MOVE_BATCH", caravana);
            preparaParametro(doc, "MOVE_PLANT", plant);
            preparaParametro(doc, "MOVE_STLOC", stage_loc);
        }
        
        String xmlInput = convertDocumentToString(doc);

        HttpURLConnection httpConn = getConnection(wsEndPointCreacion);
        sendRequest(httpConn, SOAPActionCreacion, xmlInput);
        response = getResponse(httpConn);

        return response;        
    }

    /**
     * Ejemplo de consulta para una clase.
     */
    public static void main(String args[]) {
        EasyClient easyClient = new EasyClient();

        String respuesta = easyClient.getMovimientos("2019-01-01", "2019-06-01");

        System.out.println(respuesta);
    }

    protected  HttpURLConnection getConnection(String wsEndPoint)
    {
        try {
            
    
            // Crea la conexion
            URL url = new URL(wsEndPoint);
            
            URLConnection connection = url.openConnection();


            HttpURLConnection httpConn = (HttpURLConnection) connection;
            return httpConn;
        } catch (Exception e)
        {
            System.out.println(e);
        }
        return null;
    }

    private  void sendRequest(HttpURLConnection httpConn, String SOAPAction, String xmlInput)
    {
        try {
            ByteArrayOutputStream bout = new ByteArrayOutputStream();

            // Toma el XML y lo carga a un buffer
            byte[] buffer = new byte[xmlInput.length()];
            buffer = xmlInput.getBytes();
            bout.write(buffer);
            byte[] b = bout.toByteArray();

            String userpass = username + ":" + password;
            String basicAuth = "Basic " + new String(Base64.encode(userpass.getBytes()));

            httpConn.setRequestProperty("Content-Length", String.valueOf(b.length));
            httpConn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
            httpConn.setRequestProperty("SOAPAction", SOAPAction);
            httpConn.setRequestProperty ("Authorization", basicAuth);

            httpConn.setRequestMethod("POST");
            httpConn.setDoOutput(true);
            httpConn.setDoInput(true);
            
            OutputStream out = httpConn.getOutputStream();
            // Write the content of the request to the outputstream of the HTTP
            // Connection.
            out.write(b);
            out.close();
        } catch (Exception e)
        {
            
            System.out.println("266: "+e.toString());
        }
    }

    private  String getResponse(HttpURLConnection httpConn)
    {
		String responseString = "";
        String outputString = "";
                
        try {
            InputStreamReader isr = new InputStreamReader(httpConn.getInputStream(), Charset.forName("UTF-8"));
            BufferedReader in = new BufferedReader(isr);
    
            // Write the SOAP message response to a String.
            while ((responseString = in.readLine()) != null) {
                            outputString = outputString + responseString;
            }
        } catch (IOException e)
        {
            System.out.println("285: "+e);
        }

		// Write the SOAP message formatted to the console.
		String formattedSOAPResponse = formatXML(outputString);
        
        return formattedSOAPResponse;
    }

	// format the XML in pretty String
	private  String formatXML(String unformattedXml) {
		try {
			Document document = parseXmlFile(unformattedXml);
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			transformerFactory.setAttribute("indent-number", 3);
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			DOMSource source = new DOMSource(document);
			StreamResult xmlOutput = new StreamResult(new StringWriter());
			transformer.transform(source, xmlOutput);
			return xmlOutput.getWriter().toString();
		} catch (TransformerException e) {
			throw new RuntimeException(e);
		}
    }   
    
	private  Document parseXmlFile(String in) {
		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			InputSource is = new InputSource(new StringReader(in));
			return db.parse(is);
		} catch (IOException | ParserConfigurationException | SAXException e) {
			throw new RuntimeException(e);
		}
	}    
}