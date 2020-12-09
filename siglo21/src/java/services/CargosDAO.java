
package services;

import basedatos.Conexion;
import domain.Cargos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author Dr4g0n
 */
public class CargosDAO {
    
    
    public static ArrayList<Cargos> ListarCargos(boolean totem)
    {
        // crear list de datos
        ArrayList<Cargos> datos = new ArrayList<Cargos>();
        
        // instanciar variables de conectividad
        Connection con = null; // se crea la connection
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection(); // aca, entregas la conexion con getConection(); y Conexion es la clase.. y eso, es todo lo que debes configurar
            
            if(totem == false)
            {
                sentencia ="select * from CARGOS";  
                pst = con.prepareStatement(sentencia);
            }else
            {
                sentencia ="select * from CARGOS where id_cargo < 7"; 
                pst = con.prepareStatement(sentencia);
                
            }
            rs = pst.executeQuery();
            
            //recorrido de datos en la DB
            while (rs.next()) {
                Cargos c = new Cargos();
                
                c.setId_cargo(rs.getInt("ID_CARGO"));
                c.setCargo(rs.getString("CARGO"));
                
                datos.add(c);
            }
            
            // cierre de conexiones
            rs.close();
            pst.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                // cierre de conexiones
                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return datos;
    }
}
