package basedatos;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 * @author Dr4g0n
 */
public class Conexion {
    


        
         private static Conexion instance = new Conexion();
        
        public  static Conexion getInstance()
        {
           return instance;
        }

     private Conexion(){
         String dvr = "oracle.jdbc.OracleDriver"; // aca pones el driver mysql.jdbc.xxxxxxx el que corresponda
        try{
            System.out.println("Conexion() : instanciando Driver");
            Class.forName(dvr);
            System.out.println("Conexion(): Driver instanciado!");
        }catch(Exception e){
            System.out.println("Conexion(): ERROR: No se pudo instanciar el driver");
            e.printStackTrace();
        }
      }


    public static Connection getConnection(){
        String url     = "jdbc:oracle:thin:@awsportafolio.cvt6px1zwifi.us-east-1.rds.amazonaws.com:1521:ORCL"; // la url de conexion a la base de datos
        String user    = "admin";  // el usuario asociado... si no tiene, es root
        String password= "portafolio";  // contraseña de conexion... si no tienes, solo quedan las "" y con eso, te conecta bien
        
        return getConnection(url, user, password);
    }

    public static Connection getConnection(String url, String user, String password){
        Connection conn = null;

        try{
           conn = DriverManager.getConnection(url, user, password);
        }catch (Exception e){
            System.out.println("Conexion:getConnection() : ERROR: No se pudo crear la conexion");
            e.printStackTrace();
        }

        return conn;
        
    }
    
}

