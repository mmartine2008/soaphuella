package wsserver;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import javax.xml.bind.annotation.XmlRootElement;
import javax.jws.WebResult;

/*
120010101	TERNERO
120010102	TERNERA
120010103	NOVILLO
120010104	VACA
120010105	TORO
120010106	VAQUILLONA
*/
public class Animal {
    public String rp;
    public String categoria;
    public String fecha;

    private String parseCategoria(String material)
    {
        switch (material) {
            case "000000000120010101": return "TERNERO"; 
            case "000000000120010102": return "TERNERA"; 
            case "000000000120010103": return "NOVILLO"; 
            case "000000000120010104": return "VACA"; 
            case "000000000120010105": return "TORO"; 
            case "000000000120010106": return "VAQUILLONA"; 
        }
        return material;
    }

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
        String categoria = getValorXML(nodo, "MATERIAL");
        categoria = this.parseCategoria(categoria);

        String fecha = getValorXML(nodo, "DOC_DATE");
        this.rp = rp;
        this.categoria = categoria;
        this.fecha = fecha;
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
                    "Fecha" + ":" + this.fecha +
                    "}";
    }
}
