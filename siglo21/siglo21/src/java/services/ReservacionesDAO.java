package services;

import basedatos.Conexion;
import domain.Clientes;
import domain.Reservaciones;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.Locale;
import javax.sound.sampled.Clip;

/**
 *
 * @author Dr4g0n
 */
public class ReservacionesDAO {
    
    private static int getLastId()
    {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        int returned = 0;
        
        try {
            con = Conexion.getConnection();
            sentencia ="SELECT MAX(ID_RESERVA) AS MAX_ID FROM RESERVACIONES";
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
  
    public static boolean reservasCanceladas(String rut)
    {
        boolean res = false;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            //  preparacion de sentencias y conexion
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM RESERVACIONES " +
                        " WHERE RUT_CLIENTE= ? AND ESTADO_RESERVA = 'CANCELADO'";;
            
            pst = con.prepareStatement(sentencia);
            pst.setString(1, rut);
            rs = pst.executeQuery();
            
            //  recorrer resultados
            if(rs.next())
            {
                res = true;
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
    
     public static boolean reservasGenerada(String rut)
    {
        boolean res = false;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            //  preparacion de sentencias y conexion
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM RESERVACIONES " +
                        " WHERE RUT_CLIENTE= ? AND ESTADO_RESERVA = 'RESERVADO'";;
            
            pst = con.prepareStatement(sentencia);
            pst.setString(1, rut);
            rs = pst.executeQuery();
            
            //  recorrer resultados
            if(rs.next())
            {
                res = true;
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
    
    
     public static int existeDatos(String rut)
    {
        int res = 0;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            //  preparacion de sentencias y conexion
            con = Conexion.getConnection();
            sentencia = " SELECT COUNT(*) as cantidad FROM RESERVACIONES " +
                        " where RUT_CLIENTE= ?";
            
            pst = con.prepareStatement(sentencia);
            pst.setString(1, rut);
            rs = pst.executeQuery();
            
            //  recorrer resultados
            if(rs.next())
            {
                res = rs.getInt("cantidad");
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
    
    public static boolean existePreviaReservacion(String rut)
    {
        boolean res = false;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "SELECT * FROM RESERVACIONES " +
                        "where RUT_CLIENTE= ? and ESTADO_RESERVA = 'RESERVADO'";
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
        
        return res;
    }
    
    public static boolean crearReserva(Reservaciones r)
    {
        boolean res = false;
        Connection con = null;
        PreparedStatement pst = null;
        String sentencia ="";
        
        try {
           
            
            con = Conexion.getConnection();
            sentencia = "INSERT INTO RESERVACIONES(ID_RESERVA , RUT_CLIENTE , FECHA_HORA , ESTADO_RESERVA, CANTIDAD_PERSONAS) " +
                        " VALUES (? , ? , to_date( ? , 'DD-MON-YYYY HH24:MI' ) , ? , ?)";
            pst = con.prepareStatement(sentencia);
            
              // captura de datos
            int lastId = getLastId();
            
            SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
            String reservaStr = df.format(r.getFecha_hora());
           
            
            pst.setInt(1, lastId);
            pst.setString(2, r.getClientes().getRut_cliente());
            pst.setString(3, reservaStr);
            pst.setString(4, r.getEstado_reserva());
            pst.setInt(5, r.getCantidad_personas());
            
            pst.executeUpdate();
            res = true;
            
            pst.close();
            con.close();
        }  catch (Exception ex) {
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
    
    public static boolean cancelarReserva(String rut)
    {
        boolean res = false;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = "UPDATE RESERVACIONES SET ESTADO_RESERVA = 'CANCELADO' " +
                        "WHERE RUT_CLIENTE = ?";
            pst = con.prepareStatement(sentencia);
            pst.setString(1, rut);
            
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

    public static LinkedList<Reservaciones> datosReserva(String rut)
    {
        LinkedList<Reservaciones> datos = new LinkedList<Reservaciones>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        Reservaciones r = new Reservaciones();
        Clientes c = new Clientes();
        
        try {
            Date today = new Date();
            SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
            String todayStr = df.format(today);
            String fechaHoraIni = todayStr.concat(" 08:30");
            String fechaHoraFin = todayStr.concat(" 22:30");
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM RESERVACIONES r " +
                        " INNER JOIN CLIENTES c on c.RUT_CLIENTE = r.RUT_CLIENTE " +
                        " WHERE r.RUT_CLIENTE=?  AND r.ESTADO_RESERVA = 'RESERVADO'  AND r.FECHA_HORA BETWEEN to_date( ? , 'DD-MON-YYYY HH24:MI' ) AND to_date( ? , 'DD-MON-YYYY HH24:MI' )";
            pst = con.prepareStatement(sentencia);
            pst.setString(1, rut);
            pst.setString(2, fechaHoraIni);
            pst.setString(3, fechaHoraFin);
            
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                r.setId_reserva(rs.getInt("ID_RESERVA"));
                    c.setRut_cliente(rs.getString("RUT_CLIENTE"));
                    c.setNombres(rs.getString("NOMBRES"));
                    c.setApellidos(rs.getString("APELLIDOS"));
                r.setClientes(c);
                r.setFecha_hora(rs.getDate("FECHA_HORA"));
                r.setEstado_reserva(rs.getString("ESTADO_RESERVA"));
                r.setCantidad_personas(rs.getInt("CANTIDAD_PERSONAS"));
                
                datos.add(r);
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
    
     public static LinkedList<Reservaciones> datosReservaTotal(String rut)
    {
        LinkedList<Reservaciones> datos = new LinkedList<Reservaciones>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        Reservaciones r = new Reservaciones();
        Clientes c = new Clientes();
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM RESERVACIONES r " +
                        " INNER JOIN CLIENTES c on c.RUT_CLIENTE = r.RUT_CLIENTE " +
                        " WHERE r.RUT_CLIENTE=?  AND r.ESTADO_RESERVA = 'RESERVADO'";
            pst = con.prepareStatement(sentencia);
            pst.setString(1, rut);
            
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                r.setId_reserva(rs.getInt("ID_RESERVA"));
                    c.setRut_cliente(rs.getString("RUT_CLIENTE"));
                    c.setNombres(rs.getString("NOMBRES"));
                    c.setApellidos(rs.getString("APELLIDOS"));
                r.setClientes(c);
                r.setFecha_hora(rs.getDate("FECHA_HORA"));
                r.setEstado_reserva(rs.getString("ESTADO_RESERVA"));
                r.setCantidad_personas(rs.getInt("CANTIDAD_PERSONAS"));
                
                datos.add(r);
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
    
    public static boolean clienteRechazado(String rut)
    {
        boolean res = false;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM CLIENTES " +
                        " WHERE RUT_CLIENTE = ? and ESTADO ='RECHAZADO'";
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
    
    public static int cantidadReservasDelDia()
    {
        int returned = 0;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            
            Date fechaActual = new Date();
            SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
            String fechaHoy = df.format(fechaActual);
            String fechaHoraActual = fechaHoy;
            
            String cortarFecha[] = fechaHoy.split(" ");
            
            String fecha2 = cortarFecha[0]+ " 22:30" ;
            
            con = Conexion.getConnection();
            sentencia = " SELECT COUNT(*) as cantidad " +
                        " FROM RESERVACIONES " +
                        " WHERE ESTADO_RESERVA = 'RESERVADO' AND FECHA_HORA BETWEEN to_date( ? , 'DD-MON-YYYY HH24:MI' ) AND to_date( ? , 'DD-MON-YYYY HH24:MI' )";
            pst = con.prepareStatement(sentencia);
            pst.setString(1, fechaHoraActual);
            pst.setString(2, fecha2);
            
            rs = pst.executeQuery();
            
            if(rs.next())
            {
                returned = rs.getInt("cantidad");
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
        
        return returned;
    }
    
    public static LinkedList<Reservaciones> listadoReservasDelDia()
    {
        LinkedList<Reservaciones> datos = new LinkedList<>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
      
        
        try {
            con = Conexion.getConnection();
            Date hoy = new Date();
            SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
            String fechaActual = df.format(hoy);
            String cortarFecha[] = fechaActual.split(" ");
            String fechaHoraFin = cortarFecha[0];
            
            sentencia = " SELECT * FROM RESERVACIONES r " +
                        " INNER JOIN CLIENTES C ON r.RUT_CLIENTE = c.RUT_CLIENTE " +
                        " WHERE r.ESTADO_RESERVA = 'RESERVADO' AND FECHA_HORA BETWEEN to_date( ? , 'DD-MON-YYYY HH24:MI' ) AND to_date( ? , 'DD-MON-YYYY HH24:MI' )" +
                        " ORDER BY r.FECHA_HORA ASC";
            pst = con.prepareStatement(sentencia);
            pst.setString(1, fechaActual);
            pst.setString(2, fechaHoraFin+" 23:30");
            
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Reservaciones r = new Reservaciones();
                Clientes c = new Clientes();
                
                r.setFecha_hora(rs.getDate("FECHA_HORA"));
                r.setCantidad_personas(rs.getInt("CANTIDAD_PERSONAS"));
                c.setRut_cliente(rs.getString("RUT_CLIENTE"));
                c.setNombres(rs.getString("NOMBRES"));
                c.setApellidos(rs.getString("APELLIDOS"));
                c.setTelefono(rs.getString("TELEFONO"));
                r.setClientes(c);
                
                datos.add(r);
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
    
    public static LinkedList<Reservaciones> listaCantidadCancelacionXCli()
    {
        LinkedList<Reservaciones> datos = new LinkedList<>();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT r.RUT_CLIENTE,  c.NOMBRES,c.APELLIDOS, c.ESTADO, COUNT(*) as cantidad FROM RESERVACIONES r " +
                        " INNER JOIN CLIENTES c ON c.RUT_CLIENTE = r.RUT_CLIENTE " +
                        " WHERE ESTADO_RESERVA = 'CANCELADO'  " +
                        " GROUP BY r.RUT_CLIENTE, c.NOMBRES,c.APELLIDOS, c.ESTADO " +
                        " ORDER BY cantidad DESC, r.RUT_CLIENTE DESC, c.ESTADO asc";      
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                Reservaciones r = new Reservaciones();
                Clientes c = new Clientes();
                
                c.setRut_cliente(rs.getString("RUT_CLIENTE"));
                c.setNombres(rs.getString("NOMBRES"));
                c.setApellidos(rs.getString("APELLIDOS"));
                c.setEstado(rs.getString("ESTADO"));
                r.setClientes(c);
                r.setCantidad_personas(rs.getInt("cantidad"));
                
                datos.add(r);
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
