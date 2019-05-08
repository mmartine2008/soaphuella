package wsserver;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import javax.xml.bind.annotation.XmlRootElement;
import javax.jws.WebResult;

public class Animal {
    public String rp;
    public String categoria;

    private static String getValorXML(Node nodo, String TagName)
	{
		Element element = (Element) nodo;
		String output = element.getElementsByTagName(TagName).item(0).getTextContent();
		return output;
    }

    Animal () {
    }

    Animal (String rp, String categoria) {
        this.rp = rp;
        this.categoria = categoria;
    }

    Animal (Node nodo) {

        String rp = getValorXML(nodo, "MAT_DOC");
        String categoria = getValorXML(nodo, "MOVE_TYPE");

        this.rp = rp;
        this.categoria = categoria;
    }

    public String toString()
    {
        return this.rp+","+this.categoria;
    }

    public String toJSON()
    {
        return "{"+
                    "RP" + ":" + this.rp +
                    "Categoria" + ":" + this.categoria + 
                    "}";
    }
}
