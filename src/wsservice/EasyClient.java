
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

public class EasyClient {


    public static void main(String args[]) {

        try {
            // Leo el archivo
            FileReader fr = new FileReader("../data/movimiento.xml");
            BufferedReader bf = new BufferedReader(fr);

            // Lo paso a una cadena
            String response = new String();
            for (String line; (line = bf.readLine()) != null; response += line.trim());

            // Construyo el XML
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();  
            DocumentBuilder builder;
            
            builder = factory.newDocumentBuilder();  
            Document doc = builder.parse( new InputSource( new StringReader( response )) ); 

            System.out.println(response);
        } catch (IOException e)
        {
            System.out.println(e);
        }  catch (ParserConfigurationException e)
        {
            System.out.println(e);
        } catch (SAXException e)
        {
            System.out.println(e);
        }
    }

}