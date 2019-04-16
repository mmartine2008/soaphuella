import javax.xml.ws.Endpoint;
 
public class Servicio {
  public static void main(String[] args) {
    Endpoint.publish(
      "http://localhost:8080/ServicioWeb/Hello",
       new Hello());
  }
}