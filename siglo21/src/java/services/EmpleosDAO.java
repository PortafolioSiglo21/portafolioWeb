package services;

import basedatos.Conexion;
import domain.Empleos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * 
 * @author Dr4g0n
 */
public class EmpleosDAO {
    
    public static ArrayList<Empleos> listarEmpleos()
    {
         // crear list de datos
        ArrayList<Empleos> datos = new ArrayList<Empleos>();
        
        
        //instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        
        try {
            
            con = Conexion.getConnection();
            sentencia = "SELECT * FROM EMPLEOS";
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            // recorrido en la DB
            while (rs.next()) {                
                Empleos e = new Empleos();
                
                e.setId_tipo_empleo(rs.getInt("ID_TIPO_EMPLEO"));
                e.setTipo_empleo(rs.getString("TIPO_EMPLEO"));
                
                datos.add(e);
            }
            
            //cierre conexiones
            rs.close();
            pst.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                //cierre conexiones
                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return datos;
    }
    
    public static boolean existeUsuarioTotem()
    {
        boolean res = false;
        ResultSet rs = null;
        PreparedStatement pst = null;
        Connection con = null;
        String sentencia;
        
        try {
            con = Conexion.getConnection();
            sentencia = " SELECT * FROM EMPLEADOS " +
                        " WHERE ID_CARGO = 7";
            pst = con.prepareStatement(sentencia);
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
