package services;

import basedatos.Conexion;
import domain.Categorias;
import domain.Productos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author Dr4g0n
 */
public class ProductosDAO {

    public static LinkedList<Productos> listarTodoStock()
    {
        // creacion lista de datos
        LinkedList<Productos> datos = new LinkedList<Productos>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
       
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT * " +
                        " FROM PRODUCTOS p" +
                        "  INNER JOIN CATEGORIAS c ON c.ID_CATEGORIA = p.ID_CATEGORIA where 1=1 " +
                        " order by p.ID_CATEGORIA, p.NOMBRE asc";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            // recorrido a datos en la DB
            while(rs.next())
            {
                // creacion de objeto
                Productos p = new Productos();
                Categorias c = new Categorias();
                
                p.setNombre(rs.getString("NOMBRE"));
                p.setCantidad(rs.getInt("CANTIDAD"));
                p.setPrecio(rs.getInt("PRECIO_UNITARIO"));
                p.setStock_minimo(rs.getInt("STOCK_MINIMO"));
                c.setMedida_categoria(rs.getString("MEDIDA_CATEGORIA"));
                p.setCategorias(c);
                
                datos.add(p);
            }
            
            // cierre de conexiones
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
    
    public static LinkedList<Productos> stockPorCategoria(int idCategoria)
    {
        LinkedList<Productos> datos = new LinkedList<Productos>();
        
        // instanciar variables de conectividad
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT * " +
                        "FROM PRODUCTOS p " +
                        "  INNER JOIN CATEGORIAS c ON c.ID_CATEGORIA = p.ID_CATEGORIA " +
                        "where p.ID_CATEGORIA = "+idCategoria+" " +
                        "order by p.ID_CATEGORIA, p.NOMBRE asc ";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Productos p = new Productos();
                Categorias c = new Categorias();
                
                p.setNombre(rs.getString("NOMBRE"));
                p.setPrecio(rs.getInt("PRECIO_UNITARIO"));
                p.setCantidad(rs.getInt("CANTIDAD"));
                p.setStock_minimo(rs.getInt("STOCK_MINIMO"));
                c.setMedida_categoria(rs.getString("MEDIDA_CATEGORIA"));
                p.setCategorias(c);
                
                datos.add(p);
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
    
    public static LinkedList<Productos> allProd()
    {
        // creacion lista de datos
        LinkedList<Productos> datos = new LinkedList<Productos>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
       
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT * " +
                        " FROM PRODUCTOS p" +
                        "  INNER JOIN CATEGORIAS c ON c.ID_CATEGORIA = p.ID_CATEGORIA where 1=1 " +
                        " order by p.NOMBRE asc";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            // recorrido a datos en la DB
            while(rs.next())
            {
                // creacion de objeto
                Productos p = new Productos();
                Categorias c = new Categorias();
                
                p.setId_producto(rs.getInt("ID_PRODUCTO"));
                p.setPrecio(rs.getDouble("PRECIO_UNITARIO"));
                p.setNombre(rs.getString("NOMBRE"));
                p.setCategorias(c);
                
                datos.add(p);
            }
            
            // cierre de conexiones
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
    
    public static int getPrice(int idProd)
    {
       // LinkedList<Productos> datos = new LinkedList<Productos>();
        int precio = 0;
        
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "select PRECIO_UNITARIO from productos where ID_PRODUCTO = ?";
            pst = con.prepareStatement(sentencia);
            
            pst.setInt(1, idProd);
            
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                precio = rs.getInt("PRECIO_UNITARIO");
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
        return precio;
    }
    
    public static LinkedList<Productos> productoPorIDCategoria(int idcat)
    {
        LinkedList<Productos> datos = new LinkedList<Productos>();
        
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM PRODUCTOS " +
                        " WHERE ID_CATEGORIA = ? " +
                        " ORDER BY NOMBRE ASC";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, idcat);
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Productos p = new Productos();
                Categorias c = new Categorias();
                
                p.setId_producto(rs.getInt("ID_PRODUCTO"));
                p.setNombre(rs.getString("NOMBRE"));
                    c.setId_categoria(rs.getInt("ID_CATEGORIA"));
                p.setCategorias(c);
                
                datos.add(p);
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
    
    public static LinkedList<Productos> listarLicoresYbebidas()
    {
        LinkedList<Productos> datos = new LinkedList<Productos>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM PRODUCTOS " +
                        " WHERE ID_CATEGORIA=84 or ID_CATEGORIA=90" + 
                        " ORDER BY ID_CATEGORIA ASC";
            pst = con.prepareStatement(sentencia);
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Productos p = new Productos();
                int idProd          = rs.getInt("ID_PRODUCTO");
                String nombreProd   = rs.getString("NOMBRE");
                String descripProd  = rs.getString("DESCRIPCION");
                
                p.setId_producto(idProd);
                p.setNombre(nombreProd);
                p.setDescripcion(descripProd);
                
                datos.add(p);
            }
            
            rs.close();
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally
        {
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
