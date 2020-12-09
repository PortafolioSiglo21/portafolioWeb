package services;

import basedatos.Conexion;
import domain.Carta;
import domain.Mesas;
import domain.Ordenes;
import domain.Productos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

/**
 *
 * @author Dr4g0n
 */
public class OrdenesDAO {
    
    public static LinkedList<Ordenes> contarVentasPorCarta()
    {
        LinkedList<Ordenes> datos = new LinkedList<>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT c.NOMBRE, COUNT(*) AS cantidades FROM ORDENES o " +
                        " INNER JOIN CARTA c on c.ID_CARTA = o.ID_CARTA " +
                        " GROUP BY c.NOMBRE " +
                        " ORDER BY cantidades desc";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            while (rs.next()) 
            {                
                Ordenes o = new Ordenes();
                Carta c = new Carta();
                
                c.setNombre(rs.getString("NOMBRE"));
                c.setId_carta(rs.getInt("cantidades"));
                o.setCarta(c);
                
                datos.add(o);
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
    
    public static LinkedList<Ordenes> recuperarPedidoPorMesa(int numMesa)
    {
        LinkedList<Ordenes> datos = new LinkedList<Ordenes>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " select  C.NOMBRE, O.STATUS from ORDENES O" +
                        " INNER JOIN CARTA C ON C.ID_CARTA = O.ID_CARTA " +
                        " WHERE O.ID_MESAS= ? AND (O.STATUS = 'ATENDIDA' or O.STATUS = 'PREPARADO') " +
                        " ORDER by C.NOMBRE asc";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, numMesa);
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Ordenes o = new Ordenes();
                Carta c = new Carta();
                
                o.setStatus(rs.getString("STATUS"));
                    c.setNombre(rs.getString("NOMBRE"));
                o.setCarta(c);
                
                datos.add(o);
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
    
    public static LinkedList<Ordenes> pedidosActuales()
    {
        LinkedList<Ordenes> datos = new LinkedList<Ordenes>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT  C.NOMBRE, O.STATUS, O.ID_MESAS, O.ID_ORDEN FROM ORDENES O " +
                        " INNER JOIN CARTA C ON C.ID_CARTA = O.ID_CARTA " +
                        " WHERE O.STATUS = 'ATENDIDA' " +
                        " ORDER by C.NOMBRE asc";
            
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Ordenes o = new Ordenes();
                Mesas m = new Mesas();
                Carta c = new Carta();
                
                    c.setNombre(rs.getString("NOMBRE"));
                o.setCarta(c);
                    m.setId_mesa(rs.getInt("ID_MESAS"));
                o.setMesas(m);
                o.setStatus(rs.getString("STATUS"));
                o.setId_orden(rs.getInt("ID_ORDEN"));
                
                datos.add(o);
                
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
    
    public static boolean OrdenPreparada(int idPedido)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " UPDATE ORDENES SET STATUS='PREPARADO' " +
                        " WHERE ID_ORDEN = ?";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, idPedido);
            
            pst.executeUpdate();

            res = true;
            
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
    
    public static boolean estaPreparado (int idPedido)
    {
        boolean res = false;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT STATUS FROM ORDENES " +
                        " WHERE ID_ORDEN = ? AND STATUS='PREPARADO'";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, idPedido);
            
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                res = true;
            }
            
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
    
    public static LinkedList<Ordenes> contarOrdenes()
    {
        LinkedList<Ordenes> datos = new LinkedList<Ordenes>();
        //int returned = 0;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT COUNT(*) as cantidad , ID_MESAS " +
                        " FROM ORDENES " +
                        " WHERE STATUS = 'ATENDIDA' " +
                        " GROUP BY ID_MESAS";
            pst = con.prepareStatement(sentencia);
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Mesas m = new Mesas();
                Ordenes o = new Ordenes();
                
                m.setId_mesa(rs.getInt("ID_MESAS"));
                m.setCapacidad(rs.getInt("cantidad"));
                o.setMesas(m);
                
                datos.add(o);
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
        //return returned;
    }
    
    public static boolean ingresarOrdenPedidoCartas(Ordenes o)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "INSERT INTO ORDENES (ID_ORDEN, ID_MESAS,ID_CARTA, STATUS) " +
                        "VALUES(1,?,?,'ATENDIDA')";
            pst = con.prepareStatement(sentencia);
            
            pst.setInt(1, o.getMesas().getId_mesa());
            pst.setInt(2, o.getCarta().getId_carta());
            
            pst.executeQuery();
            
            res = true;
            
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally
        {
            try {
                pst.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        return res;
    }
    
    public static boolean ingresarOrdenPedidoProductos(Ordenes o)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "INSERT INTO ORDENES (ID_ORDEN, ID_MESAS,ID_PRODUCTO, STATUS) " +
                        "VALUES(1,?,?,'PREPARADO')";
            pst = con.prepareStatement(sentencia);
            
            pst.setInt(1, o.getMesas().getId_mesa());
            pst.setInt(2, o.getProductos().getId_producto());
            
            pst.executeQuery();
            
            res = true;
            
            pst.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally
        {
            try {
                pst.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        return res;
    }
    
    public static LinkedList<Ordenes> traerCartasOrdenes(int idMesa)
    {
        LinkedList<Ordenes> datos = new LinkedList<Ordenes>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT C.NOMBRE, C.PRECIO " +
                        " FROM ORDENES O " +
                        " INNER JOIN CARTA C ON C.ID_CARTA = O.ID_CARTA " +
                        " WHERE O.ID_MESAS = ? AND O.STATUS = 'PREPARADO' " +
                        " ORDER BY C.NOMBRE asc";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, idMesa);
            
            rs = pst.executeQuery();
            
            
            
            while(rs.next())
            {
                Ordenes o = new Ordenes();
                Carta c = new Carta();
                
                String nombre   = rs.getString("NOMBRE");
                int precio      = rs.getInt("PRECIO");
                
                c.setNombre(nombre);
                c.setPrecio(precio);
                
                o.setCarta(c);
                
                datos.add(o);
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
    
    public static LinkedList<Ordenes> traerProductosOrdenes(int idMesa)
    {
        LinkedList<Ordenes> datos = new LinkedList<Ordenes>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT P.NOMBRE, P.DESCRIPCION, P.PRECIO_UNITARIO FROM ORDENES O " +
                        " INNER JOIN PRODUCTOS P ON P.ID_PRODUCTO = O.ID_PRODUCTO " +
                        " WHERE O.ID_MESAS = ? AND STATUS='PREPARADO' " +
                        " ORDER BY P.ID_CATEGORIA, P.NOMBRE ASC ";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, idMesa);
            
            rs = pst.executeQuery();
            
           
            
            while(rs.next())
            {
                 Ordenes o = new Ordenes();
                Productos p = new Productos();
                
                String nombre = rs.getString("NOMBRE");
                String descripcion = rs.getString("DESCRIPCION");
                int Precio  = rs.getInt("PRECIO_UNITARIO");
                
                p.setNombre(nombre);
                p.setDescripcion(descripcion);
                p.setPrecio(Precio);
                
                o.setProductos(p);
                
                datos.add(o);
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
    
    public static boolean cerrarOrdenesDeMesa(int idMesa)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " UPDATE ORDENES SET STATUS='FINALIZADA' " +
                        " WHERE ID_MESAS=?";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, idMesa);
            
            pst.executeUpdate();
            
            res = true;
            
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
    
}
