
package services;

import basedatos.Conexion;
import domain.Carta;
import domain.TipoCarta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

/**
 *
 * @author Dr4g0n
 */
public class CartaDAO {
    
    
    /*
    *
    *       Especiales
    *
    */
    
    private static int getLastId()
    {
        int returned = 0;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT MAX(ID_CARTA) AS max_id FROM CARTA";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                returned = rs.getInt("max_id")+1;
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
        
        return returned;
    }
    
    /*
    *
    *       CRUD
    *
    */
    public static boolean crearCarta(Carta c)
    {
        boolean res = false;
        Connection con = null;
        PreparedStatement pst = null;
        String sentencia;
        
        try {
            
            con = Conexion.getConnection();
            sentencia = "INSERT INTO CARTA (ID_CARTA,ID_TIPO_CARTA, DESCRIPCION_CARTA, PRECIO, NOMBRE) VALUES (?,?,?,?,?)";
            pst = con.prepareStatement(sentencia);
            
            int lastId = getLastId();
            
            pst.setInt(1, lastId);
            pst.setInt(2, c.getTipoCarta().getId_tipo_carta());
            pst.setString(3, c.getDescripcion_Carta().toLowerCase());
            pst.setInt(4, (int)c.getPrecio());
            pst.setString(5, c.getNombre().toLowerCase());
            
            pst.executeUpdate();
            res = true;
            
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                pst.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return res;
    }
    
    public static boolean editarCarta(Carta c)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " UPDATE CARTA SET ID_TIPO_CARTA = ?,DESCRIPCION_CARTA = ?, " +
                        " PRECIO = ?, NOMBRE = ? WHERE ID_CARTA = ?";
            pst = con.prepareStatement(sentencia);
            
            // settear pst
            pst.setInt(1, c.getTipoCarta().getId_tipo_carta());
            pst.setString(2, c.getDescripcion_Carta());
            pst.setInt(3, (int)c.getPrecio());
            pst.setString(4, c.getNombre());
            pst.setInt(5, c.getId_carta());
            
            pst.executeUpdate();
            
            res=true;
            
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
            try {
                pst.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        return res;
    }
    
    public static LinkedList<Carta> recuperarCarta(int id)
    {
        LinkedList<Carta> datos = new LinkedList<Carta>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM CARTA " +
                        " WHERE ID_CARTA = ?";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, id);
            
            rs = pst.executeQuery();
            Carta c = new Carta();
            TipoCarta t = new TipoCarta();
            if(rs.next())
            {
                c.setId_carta(rs.getInt("ID_CARTA"));
                    t.setId_tipo_carta(rs.getInt("ID_TIPO_CARTA"));
                c.setTipoCarta(t);
                c.setDescripcion_Carta(rs.getString("DESCRIPCION_CARTA"));
                c.setPrecio(rs.getInt("PRECIO"));
                c.setNombre(rs.getString("NOMBRE"));
                
                datos.add(c);
            }
            
            rs.close();
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
            try {
                rs.close();
                pst.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        return datos;
    }
            
    public static LinkedList<Carta> listaCarta()
    {
        LinkedList<Carta> datos = new LinkedList<Carta>();
        
        
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM CARTA c " +
                        "  inner join tipo_carta t on c.ID_TIPO_CARTA = t.ID_TIPO_CARTA order by ID_CARTA asc";
            pst = con.prepareStatement(sentencia);
            rs  = pst.executeQuery();
            
            while(rs.next()){
                Carta c = new Carta();
                TipoCarta t = new TipoCarta();
                
                c.setId_carta(rs.getInt("ID_CARTA"));
                    // tipo de carta
                    t.setId_tipo_carta(rs.getInt("ID_TIPO_CARTA"));
                    t.setDescripcion(rs.getString("DESCRIPCION_TIPO_CARTA"));
                c.setTipoCarta(t);
                c.setDescripcion_Carta(rs.getString("DESCRIPCION_CARTA"));
                c.setPrecio(rs.getDouble("PRECIO"));
                c.setNombre(rs.getString("NOMBRE"));
                
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
    
    public static LinkedList<Carta> contarCartasPorTipo()
    {
        LinkedList<Carta> datos = new LinkedList<Carta>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia=  " SELECT COUNT(*) AS cantidad ,ID_TIPO_CARTA FROM CARTA " +
                        " GROUP BY ID_TIPO_CARTA";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Carta c = new Carta();
                
                c.setId_carta(rs.getInt("ID_TIPO_CARTA"));
                c.setPrecio(rs.getInt("cantidad"));
                
                datos.add(c);
            }
            
            rs.close();
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
            try {
                rs.close();
                pst.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        return datos;
    }
}
