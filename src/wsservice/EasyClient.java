
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


public class EasyClient {

    static String baseFileConsulta; 
    static String wsEndPointConsulta; 
    static String SOAPActionConsulta; 
    
    /**
     * Lee la configuracion del arvhico ini
     */
    private static void leerConfiguracion() {
        try{
            IniFile ini = new IniFile("configuracion.ini");
            
            baseFileConsulta = ini.getString("Consulta", "baseFileConsulta", "");
            wsEndPointConsulta = ini.getString("Consulta", "wsEndPointConsulta", "");
            SOAPActionConsulta = ini.getString("Consulta", "SOAPActionConsulta", "");

        }catch(Exception e){
            System.err.println(e.getMessage());
        }        
    }

    /**
     * Devuelve el string del contenido del archivo del servicio
     * @name puede ser consulta o modificacion (por ahora solo consulta) 
     */
    private static String getStringService(String fileName)
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


    private static Document convertStringToDocument(String xmlStr) {
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

    private static String convertDocumentToString(Document doc) {
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
    private static void prepareConsulta(String desde, String hasta, Document doc)
    {
        Node nodeDesde = doc.getElementsByTagName("LOW").item(0);
        nodeDesde.setTextContent(desde);

        Node nodeHasta = doc.getElementsByTagName("HIGH").item(0);
        nodeHasta.setTextContent(hasta);
    }

    public static void main(String args[]) {

        leerConfiguracion();
        // String wsEndPoint = "http://srv-s4-asq.pdm.local:8000/sap/bc/srt/rfc/sap/zmm_ws_consulta_movimiento/400/zmm_ws_consulta_movimiento/zmm_ws_consulta_movimiento";
        // String SOAPAction = "http://srv-s4-asq.pdm.local:8000/sap/bc/srt/rfc/sap/zmm_ws_consulta_movimiento/400/zmm_ws_consulta_movimiento/zmm_ws_consulta_movimiento";

        String xmlBase = getStringService(baseFileConsulta);
        Document doc = convertStringToDocument(xmlBase);

        prepareConsulta("2019-01-01", "2019-04-01", doc);

        String xmlInput = convertDocumentToString(doc);

        HttpURLConnection httpConn = getConnection(wsEndPointConsulta);
        sendRequest(httpConn, SOAPActionConsulta, xmlInput);
        String response = getResponse(httpConn);

       System.out.println(response);
    }

    protected static HttpURLConnection getConnection(String wsEndPoint)
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

    private static void sendRequest(HttpURLConnection httpConn, String SOAPAction, String xmlInput)
    {
        try {
            ByteArrayOutputStream bout = new ByteArrayOutputStream();

            // Toma el XML y lo carga a un buffer
            byte[] buffer = new byte[xmlInput.length()];
            buffer = xmlInput.getBytes();
            bout.write(buffer);
            byte[] b = bout.toByteArray();

            httpConn.setRequestProperty("Content-Length", String.valueOf(b.length));
            httpConn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
            httpConn.setRequestProperty("SOAPAction", SOAPAction);
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
            System.out.println(e);
        }
    }

    private static String getResponse(HttpURLConnection httpConn)
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
            System.out.println(e);
        }

		// Write the SOAP message formatted to the console.
		String formattedSOAPResponse = formatXML(outputString);
        
        return formattedSOAPResponse;
    }

	// format the XML in pretty String
	private static String formatXML(String unformattedXml) {
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
    
	private static Document parseXmlFile(String in) {
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