package services;

import basedatos.Conexion;
import domain.Categorias;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author Dr4g0n
 */
public class CategoriaDAO {
    
    public static LinkedList<Categorias> traerCategorias()
    {
        // instanciar arreglo
        LinkedList<Categorias> datos = new LinkedList<Categorias>();
        
        // instaciar conectividad de DB
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT * FROM CATEGORIAS";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Categorias c = new Categorias();
                
                c.setId_categoria(rs.getInt("ID_CATEGORIA"));
                c.setCategoria(rs.getString("CATEGORIA"));
                
                datos.add(c);
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
