package services;

import basedatos.Conexion;
import domain.TipoCarta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Dr4g0n
 */
public class TipoCartaDAO {
    
    public static LinkedList<TipoCarta> listadoTipo()
    {
        LinkedList<TipoCarta> datos = new LinkedList<TipoCarta>();
       
        
        // instanciar conectividad  de DB
        ResultSet rs = null; 
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT * FROM TIPO_CARTA order by ID_TIPO_CARTA asc ";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                 TipoCarta t = new TipoCarta();
                 
                t.setId_tipo_carta(rs.getInt("ID_TIPO_CARTA"));
                t.setDescripcion(rs.getString("DESCRIPCION_TIPO_CARTA"));
                
                datos.add(t);
            }
            
            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
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
