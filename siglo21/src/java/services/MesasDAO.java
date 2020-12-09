package services;

import basedatos.Conexion;
import domain.Mesas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author Dr4g0n
 */
public class MesasDAO {
    
    /*
    *
    *       validaciones en servidor
    *
    */
    
    public static boolean existeMesa(int id)
    {
        boolean res = false;
        String sentencia;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            //  preparacion de sentencias y conexion
            con = Conexion.getConnection();
            sentencia = "select * from MESAS m where m.ID_MESAS = '"+id+"'";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            //  recorrer resultados
            while (rs.next()) 
            {
               int numMesaDBA = rs.getInt("ID_MESAS");
               if(numMesaDBA == id)
               {
                   res=true;
               }            
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
        
        return res;
    }
    
     public static LinkedList<Mesas> recuperarIdMesas( int idMesa)
    {
        // crear list de datos
        LinkedList<Mesas> datos = new LinkedList<Mesas>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "select id_mesas,capacidad,status_mesas from MESAS where id_mesas="+idMesa+"";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            //recorrido a datos de la DB
            while(rs.next())
            {
                // crea objeto
                Mesas m = new Mesas();
                
                m.setId_mesa(rs.getInt("id_mesas"));
                m.setCapacidad(rs.getInt("capacidad"));
                m.setStatus_mesa(rs.getString("status_mesas"));
                
                datos.add(m);
            }
            
            // cierre de conexiones
            rs.close();
            pst.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally
        {
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
    
    
    public static LinkedList<Mesas> recuperarMesasPorCapacidad( int cap)
    {
        // crear list de datos
        LinkedList<Mesas> datos = new LinkedList<Mesas>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "select * from MESAS where cap";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            //recorrido a datos de la DB
            while(rs.next())
            {
                // crea objeto
                Mesas m = new Mesas();
                
                m.setId_mesa(rs.getInt("id_mesas"));
                m.setCapacidad(rs.getInt("capacidad"));
                m.setStatus_mesa(rs.getString("status_mesas"));
                
                datos.add(m);
            }
            
            // cierre de conexiones
            rs.close();
            pst.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally
        {
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
    
    
    
    /*
    *
    *       CRUD
    *
    */
    public static boolean crearMesa(Mesas m)
    {
        boolean res = false;
        Connection con = null;
        String sentencia;
        PreparedStatement pst = null;
        
        try {
            // conexion y sentencia
            con = Conexion.getConnection();
            sentencia ="insert into MESAS (ID_MESAS, CAPACIDAD, STATUS_MESAS) VALUES(?,?,?)";
            pst = con.prepareStatement(sentencia);
            
            // creacion de objeto
            new Mesas();
            
            //PreparedStatement con el objeto
            pst.setInt(1, m.getId_mesa());
            pst.setInt(2, m.getCapacidad());
            pst.setString(3,String.valueOf(m.getStatus_mesa()));
            
            // ejecucion query
            pst.executeQuery();
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
    
    public static boolean editarMesa(Mesas m)
    {
        boolean res = false;
        Connection con = null;
        PreparedStatement pst = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "UPDATE MESAS set CAPACIDAD = ?, STATUS_MESAS =? where ID_MESAS = ?";
            pst = con.prepareStatement(sentencia);
            
           
            pst.setInt(1, m.getCapacidad());
            pst.setString(2, m.getStatus_mesa());
            pst.setInt(3, m.getId_mesa());
            
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }        
        return res;
    }
    
    public static ArrayList<Mesas> recuperarMesas()
    {
        // crear list de datos
        ArrayList<Mesas> datos = new ArrayList<Mesas>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT ID_MESAS,CAPACIDAD,STATUS_MESAS FROM MESAS ORDER BY ID_MESAS ASC";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            //recorrido a datos de la DB
            while(rs.next())
            {
                // crea objeto
                Mesas m = new Mesas();
                
                m.setId_mesa(rs.getInt("id_mesas"));
                m.setCapacidad(rs.getInt("capacidad"));
                m.setStatus_mesa(rs.getString("status_mesas"));
                
                datos.add(m);
            }
            con.setAutoCommit(true);
            // cierre de conexiones
            rs.close();
            pst.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally
        {
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
    
     public static boolean editarMesaRes(int id)
    {
        boolean res = false;
        Connection con = null;
        PreparedStatement pst = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "UPDATE MESAS set STATUS_MESAS ='OCUPADA' where ID_MESAS = ?";
            pst = con.prepareStatement(sentencia);
            
           
            pst.setInt(1, id);
            
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }        
        return res;
    }
     
    public static LinkedList<Mesas> mesasOcupadas()
    {
        LinkedList<Mesas> datos = new LinkedList<Mesas>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT * FROM MESAS WHERE STATUS_MESAS = 'OCUPADA'";
            pst = con.prepareStatement(sentencia);
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Mesas m = new Mesas();
                
                m.setId_mesa(rs.getInt("ID_MESAS"));
                
                datos.add(m);
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
    
     public static LinkedList<Mesas> mesasLibres()
    {
        LinkedList<Mesas> datos = new LinkedList<Mesas>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT * FROM MESAS WHERE STATUS_MESAS = 'LIBRE'";
            pst = con.prepareStatement(sentencia);
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Mesas m = new Mesas();
                
                m.setId_mesa(rs.getInt("ID_MESAS"));
                
                datos.add(m);
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
