package services;

import basedatos.Conexion;
import domain.Clientes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author Dr4g0n
 */
public class ClientesDAO {
    
    /*
    *
    *       Consultas especiales para CLIENTES
    *
    */
    public static ArrayList<Clientes> recuperarClientePorID(int idCliente)
    {
        ArrayList<Clientes> datos = new ArrayList<Clientes>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "select * from CLIENTES where ID_CLIENTE = "+idCliente+"";
            
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                Clientes c = new Clientes();
                
                // add attributes to object
                c.setId_cliente(rs.getInt("ID_CLIENTE"));
                c.setRut_cliente(rs.getString("RUT_CLIENTE"));
                c.setNombres(rs.getString("NOMBRES"));
                c.setApellidos(rs.getString("APELLIDOS"));
                c.setTelefono(rs.getString("TELEFONO"));
                c.setEmail(rs.getString("EMAIL"));
                c.setEstado(rs.getString("ESTADO"));
                
                datos.add(c);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                rs.close();
                pst.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return datos;
    }
    
    private static int getLastId()
    {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        int returned = 0;
        
        try {
            con = Conexion.getConnection();
            sentencia ="SELECT MAX(ID_CLIENTE) as max_id FROM CLIENTES";
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
    
    public static boolean existeCliente(String rut)
    {
        boolean res = false;
        String sentencia;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            //  preparacion de sentencias y conexion
            con = Conexion.getConnection();
            sentencia = "select RUT_CLIENTE from CLIENTES c where c.RUT_CLIENTE = '"+rut+"'";
            
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            //  recorrer resultados
            if(rs.next())
            {
                res=true;
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
        return res;
    }
    
     public static LinkedList<Clientes> listaRechazosCli()
    {
        LinkedList<Clientes> datos = new LinkedList<>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM CLIENTES " +
                        " WHERE ESTADO = 'RECHAZADO' " +
                        " ORDER BY APELLIDOS ASC, RUT_CLIENTE DESC";      
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Clientes c = new Clientes();
                
                c.setRut_cliente(rs.getString("RUT_CLIENTE"));
                c.setNombres(rs.getString("NOMBRES"));
                c.setApellidos(rs.getString("APELLIDOS"));
                c.setTelefono(rs.getString("TELEFONO"));
                
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
     
     
    /*
    *
    *       CRUD
    *
    */
    public static boolean crearRegCliente(Clientes c)
    {
        boolean res = false;
        Connection con = null;
        String sentencia;
        PreparedStatement pst = null;
        
        try {
            con = Conexion.getConnection();
            sentencia = "insert into CLIENTES (ID_CLIENTE,RUT_CLIENTE,NOMBRES,APELLIDOS,TELEFONO,EMAIL,ESTADO) VALUES(?,?,?,?,?,?,?)";
            pst = con.prepareStatement(sentencia);
            new Clientes();
            
            int lastId = getLastId();
            
            pst.setInt(1, lastId );
            pst.setString(2, c.getRut_cliente());
            pst.setString(3, c.getNombres());
            pst.setString(4, c.getApellidos());
            pst.setString(5, c.getTelefono());
            pst.setString(6, c.getEmail());
            pst.setString(7, c.getEstado());
            
            pst.executeUpdate();
            res=true;
            
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
    
    public static LinkedList<Clientes> listarClientes(String rut)
    {
        // crear list de datos
        LinkedList<Clientes> datos = new LinkedList<Clientes>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "select * from CLIENTES  where rut_cliente like '"+rut+"%' order by ESTADO, RUT_CLIENTE asc" ;
            
            pst = con.prepareStatement(sentencia);
            
            rs = pst.executeQuery();
            
            while (rs.next()) {                
                Clientes c = new Clientes();
                
                c.setId_cliente(rs.getInt("ID_CLIENTE"));
                c.setRut_cliente(rs.getString("RUT_CLIENTE"));
                c.setNombres(rs.getString("NOMBRES"));
                c.setApellidos(rs.getString("APELLIDOS"));
                c.setTelefono(rs.getString("TELEFONO"));
                c.setEmail(rs.getString("EMAIL"));
                c.setEstado(rs.getString("ESTADO"));
                
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
    
    public static boolean editarCliente(Clientes c)
    {
        boolean res = false;
        
        Connection con = null;
        PreparedStatement pst = null;
        String sentencia;
        
        try {
            
            con = Conexion.getConnection();
            
            sentencia = "UPDATE CLIENTES SET NOMBRES = ?, APELLIDOS = ?, TELEFONO = ?, "
                    + "EMAIL = ?, ESTADO = ? WHERE ID_CLIENTE = ?";
            pst = con.prepareStatement(sentencia);
            
            // settear pst para envio al servidor
            pst.setString(1, c.getNombres());
            pst.setString(2, c.getApellidos());
            pst.setString(3, c.getTelefono());
            pst.setString(4, c.getEmail());
            pst.setString(5, c.getEstado());
            pst.setInt(6, c.getId_cliente());
            
            pst.executeUpdate();
            
            res=true;
            
            pst.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally{
            try {
                pst.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return res;
    }
    
    public static boolean rechazarCliRut(String rut)
    {
        boolean res = false;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        Clientes c = new Clientes();
        
        try {
            con = Conexion.getConnection();
            sentencia = " UPDATE CLIENTES SET ESTADO = 'RECHAZADO'" +
                        " WHERE RUT_CLIENTE = ?";
            pst = con.prepareStatement(sentencia);
            pst.setString(1, rut);
            
            rs = pst.executeQuery();
            
            if(rs.next())
            {
               res = true;
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
        
        return res;
    }
    
}
