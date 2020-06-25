package cr.ac.tec.resources;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.GET;
import javax.ws.rs.Path;

@ApplicationPath ("/restAPI")
public class Login {
    @GET
    public String getLogin(){
        return "hola";
    }
}
