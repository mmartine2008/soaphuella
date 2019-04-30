
import java.io.FileReader;
import java.io.BufferedReader;
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
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;

public class EasyClient {

    /**
     * Devuelve el string del contenido del archivo del servicio
     * @name puede ser consulta o modificacion (por ahora solo consulta) 
     */
    private static String getStringService(String name)
    {
        // Lo paso a una cadena
        String response = new String();
        try {
            String path = "../data/";
            String fileName = path + name + ".xml";
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

        String response = getStringService("consulta");
        Document doc = convertStringToDocument(response);

        prepareConsulta("2019-01-01", "2019-04-01", doc);


        String output = convertDocumentToString(doc);
        System.out.println(output);
    }

}