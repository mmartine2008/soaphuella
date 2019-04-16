import javax.jws.WebService;
import javax.jws.WebMethod;
 
@WebService
public class Hello {
    private String message = new String("Hola, ");
     
    public void Hello() {

    }
     
    @WebMethod
    public String sayHello(String name) {
        return message + name + ".";
    }
}