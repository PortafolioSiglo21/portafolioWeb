package services;

import basedatos.Conexion;
import domain.Administrador;
import domain.Proveedores;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author Dr4g0n
 */
public class ProveedorDAO {

    /*
    *
    *           CONSULTAS ESPECIALES
    *    
    */
    private static int getLastId()
    {
        Connection con = Conexion.getConnection();
        PreparedStatement pst = null;
        ResultSet rs = null;
        int returned = 0;

        try {

            String sentencia ="SELECT max(ID_PROVEEDOR) AS max_id FROM PROVEEDORES";
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

    public static boolean existeProveedor (String rut)
    {
        boolean res = false;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
         
        try {
                // preparacion de sentencias y conexion
                con = Conexion.getConnection();
                sentencia ="SELECT RUT_PROVEEDOR FROM PROVEEDORES p WHERE p.RUT_PROVEEDOR = '"+rut+"'";
                pst = con.prepareStatement(sentencia);
                rs = pst.executeQuery();
                
                while(rs.next())
                {
                    String rutDBA = rs.getString("RUT_PROVEEDOR");
                    if (rutDBA.equals(rut)) 
                    {
                        res = true;
                    }
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
     
    public static LinkedList<Proveedores> recuperarProveedorPorId(int idProveedor)
    {
        LinkedList<Proveedores> datos = new LinkedList<Proveedores>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            
            con = Conexion.getConnection();
            sentencia = "SELECT * FROM PROVEEDORES WHERE ID_PROVEEDOR = "+idProveedor+"";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                Proveedores p = new Proveedores();
                Administrador a = new Administrador();
                
                // add attributs to object
                p.setId_proveedor(rs.getInt("ID_PROVEEDOR"));
                p.setRut_proveeedor(rs.getString("RUT_PROVEEDOR"));
                p.setProveedor(rs.getString("PROVEEDOR"));
                p.setNombre_contacto(rs.getString("NOMBRE_CONTACTO"));
                p.setTelefono(rs.getString("TELEFONOS"));
                p.setSitio_web(rs.getString("SITIO_WEB"));
                p.setEmail_proveedor(rs.getString("MAIL_PROVEEDOR"));
                a.setId_admin(rs.getString("ID_ADMIN"));
                p.setAdministrador(a);
                p.setEstado(rs.getString("ESTADO_PROVEDOR"));
                
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
    
    /*
    *
    *           CRUD
    *    
    */
    public static boolean crearProveedor(Proveedores p)
    {
        // instanciado
        boolean res = false;
        Connection con = null;
        PreparedStatement pst = null;
        String sentencia;
        
        try {
            
            con = Conexion.getConnection();
            sentencia = "INSERT INTO PROVEEDORES (ID_PROVEEDOR, RUT_PROVEEDOR, PROVEEDOR,NOMBRE_CONTACTO, TELEFONOS, SITIO_WEB, MAIL_PROVEEDOR,ID_ADMIN, ESTADO_PROVEDOR ) " +
                        " VALUES (?,?,?,?,?,?,?,?,?)";
            pst = con.prepareStatement(sentencia);
            
            // crear objeto
            new Proveedores();
            Administrador a = new Administrador();
            
            int lastId = getLastId();
           
            
            pst.setInt(1 , lastId);
            pst.setString(2, p.getRut_proveeedor());
            pst.setString(3, p.getProveedor());
            pst.setString(4, p.getNombre_contacto());
            pst.setString(5, p.getTelefono());
            pst.setString(6, p.getSitio_web());
            pst.setString(7, p.getEmail_proveedor());
            pst.setString(8, p.getAdministrador().getId_admin()  );
            pst.setString(9, p.getEstado());
            
            pst.executeUpdate();
            res=true;
            
            pst.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
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
    
    public static boolean editarProveedor(Proveedores p)
    {
        boolean res = false;
        
        Connection con = null;
        PreparedStatement pst = null;
        String sentencia;
        
        try {
            new Proveedores();
            /*
            String proveedor = p.getProveedor();
            String contacto = p.getNombre_contacto();
            String telefono = p.getTelefono();
            String sitioWeb = p.getSitio_web();
            String email    = p.getEmail_proveedor();
            int idProveedor = p.getId_proveedor();
            */
            con = Conexion.getConnection();
            sentencia = " UPDATE PROVEEDORES SET PROVEEDOR = ? , NOMBRE_CONTACTO =?, TELEFONOS =?, " +
                        "  SITIO_WEB = ?, MAIL_PROVEEDOR = ?, ESTADO_PROVEDOR = ? " +
                        " WHERE ID_PROVEEDOR = ?";
            pst = con.prepareStatement(sentencia);

            // settear pst para envio al servidor
            pst.setString(1, p.getProveedor());
            pst.setString(2, p.getNombre_contacto());
            pst.setString(3, p.getTelefono());
            pst.setString(4, p.getSitio_web());
            pst.setString(5, p.getEmail_proveedor());
            pst.setString(6, p.getEstado());
            pst.setInt(7, p.getId_proveedor());
            
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
    
    public static LinkedList<Proveedores> listarProveedorRut(String rut)
    {
        // creacion list de datos
        LinkedList<Proveedores> lista   = new LinkedList<Proveedores>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            
            con = Conexion.getConnection();
            sentencia ="select * from PROVEEDORES  where RUT_PROVEEDOR like '%"+rut+"%'  order by ESTADO_PROVEDOR,RUT_PROVEEDOR asc ";
            pst = con.prepareStatement(sentencia);
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Proveedores p = new Proveedores();
                Administrador a = new Administrador();
                
                p.setId_proveedor(rs.getInt("ID_PROVEEDOR"));
                p.setRut_proveeedor(rs.getString("RUT_PROVEEDOR"));
                p.setProveedor(rs.getString("PROVEEDOR"));
                p.setNombre_contacto(rs.getString("NOMBRE_CONTACTO"));
                p.setTelefono(rs.getString("TELEFONOS"));
                p.setSitio_web(rs.getString("SITIO_WEB"));
                p.setEmail_proveedor(rs.getString("MAIL_PROVEEDOR"));
                    // settear administradores
                    a.setId_admin(rs.getString("ID_ADMIN"));
                p.setAdministrador(a);
                p.setEstado(rs.getString("ESTADO_PROVEDOR"));
                
                lista.add(p);
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
        return lista;
    }

     public static LinkedList<Proveedores> listarProveedorNombre(String nombre)
    {
        // creacion list de datos
        LinkedList<Proveedores> lista   = new LinkedList<Proveedores>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            
            con = Conexion.getConnection();
            sentencia ="select * from PROVEEDORES  where PROVEEDOR like '%"+nombre+"%' order by ESTADO_PROVEDOR,PROVEEDOR asc ";
            pst = con.prepareStatement(sentencia);
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Proveedores p = new Proveedores();
                Administrador a = new Administrador();
                
                p.setId_proveedor(rs.getInt("ID_PROVEEDOR"));
                p.setRut_proveeedor(rs.getString("RUT_PROVEEDOR"));
                p.setProveedor(rs.getString("PROVEEDOR"));
                p.setNombre_contacto(rs.getString("NOMBRE_CONTACTO"));
                p.setTelefono(rs.getString("TELEFONOS"));
                p.setSitio_web(rs.getString("SITIO_WEB"));
                p.setEmail_proveedor(rs.getString("MAIL_PROVEEDOR"));
                    // settear administradores
                    a.setId_admin(rs.getString("ID_ADMIN"));
                p.setAdministrador(a);
                p.setEstado(rs.getString("ESTADO_PROVEDOR"));
                
                lista.add(p);
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
        return lista;
    }
     
    
}
