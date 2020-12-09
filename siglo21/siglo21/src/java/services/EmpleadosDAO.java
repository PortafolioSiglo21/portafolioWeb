package services;

import basedatos.Conexion;
import domain.Cargos;
import domain.Empleados;
import domain.Empleos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author Dr4g0n
 */
public class EmpleadosDAO {
    
    
     /*
    *
    *       Consultas especiales para EMPLEADOS
    *
    */
    public static boolean existeInfo(String user, String pass)
    {
        boolean res = false;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia;
        try {
            con =Conexion.getConnection();
            sentencia = "select * from empleados where usuario =? and pass=?";
            pst = con.prepareStatement(sentencia);
            
            pst.setString(1, user.toLowerCase());
            pst.setString(2, pass);
            
            rs = pst.executeQuery();
            
            //  recorrer resultados
            if(rs.next())
            {
                res=true;
            }    
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                rs.close();
                pst.close();
                con.close();;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }        
        return res;
    }
    
        
    public static LinkedList<Empleados> recuperarUserPassName(String user, String pass) 
    {
        LinkedList<Empleados> datos = new LinkedList<Empleados>();
        Connection con = null;
        String sentencia;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Empleados e = null;
        Cargos c = null;
        try {
            con =Conexion.getConnection();
            sentencia = " select e.nombres, e.apellidos, e.usuario, e.pass, c.cargo, e.STATUS_EMPLEADO, e.ID_CARGO  " +
                        " from empleados e  " +
                        "  inner join Cargos c On c.id_cargo = e.ID_CARGO " +
                        " where usuario = ? and pass = ?";
            pst = con.prepareStatement(sentencia);
            pst.setString(1, user.toLowerCase());
            pst.setString(2, pass);
            rs = pst.executeQuery();
            
            
            
            if(rs.next()) {
                e = new Empleados();
                c = new Cargos();
                
                e.setNombres(rs.getString("nombres"));
                e.setApellidos(rs.getString("apellidos"));
                e.setUsuario(rs.getString("usuario"));
                e.setPassword(rs.getString("pass"));
                c.setCargo(rs.getString("cargo"));
                c.setId_cargo(rs.getInt("id_cargo"));
                e.setCargos(c);
                e.setStatus_empleado(rs.getString("status_empleado"));
                e.setId_empleado(rs.getInt("ID_CARGO"));
                
                datos.add(e);
               // System.out.println(e);
            }
            
             
            rs.close();
            pst.close();
            con.close();     
            
           
            
        } catch (SQLException ex) {
            ex.printStackTrace();
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
            sentencia = "select MAX(ID_EMPLEADO) as max_id from EMPLEADOS";
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
         
         return returned;
     }
    
    /*
    *
    *       CRUD EMPLEADOS
    *
    */
    //  Crear
    public static boolean crearEmpleado(Empleados e) 
    {
        boolean res = false;
        Connection con = null;
        PreparedStatement pst = null;
        String sentencia ="";
        
        try {
            con = Conexion.getConnection();
            sentencia = "INSERT INTO EMPLEADOS(ID_EMPLEADO,NOMBRES,APELLIDOS,ID_TIPO_EMPLEO,ID_CARGO,SALARIO,NACIMIENTO,DIRECCION,TELEFONO,CORREO,ANIOS_EXPERIENCIA,USUARIO,PASS,STATUS_EMPLEADO,RUT_EMPLEADO) \n" +
                        "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pst = con.prepareStatement(sentencia);
            
           
             // crear otras clases
            new Empleos();
            new Cargos();
            
            // convertir datos
            int idEmpleo = e.getEmpleos().getId_tipo_empleo();
            int idCargo = e.getCargos().getId_cargo();
            SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String nac = df.format(e.getNacimiento());
            int lastId = getLastId();
          
            
            pst.setInt(1, lastId);
            pst.setString(2, e.getNombres());
            pst.setString(3, e.getApellidos());
            pst.setInt(4, idEmpleo);
            pst.setInt(5, idCargo);
            pst.setInt(6, e.getSalario());
            pst.setString(7, nac);
            pst.setString(8, e.getDireccion());
            pst.setString(9, e.getTelefono());
            pst.setString(10, e.getEmail());
            pst.setInt(11, e.getAños_experiencia());
            pst.setString(12, e.getUsuario());
            pst.setString(13, e.getPassword());
            pst.setString(14, e.getStatus_empleado());
            pst.setString(15, e.getRut());
            
            
            pst.executeUpdate();
            res=true;
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
  
    public static ArrayList<Empleados> recuperarEmpleadosPorCargo(int codCargo)
    {
        // creacion lista de datos
        ArrayList<Empleados> datos = new ArrayList<Empleados>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia = "";
        
        try {
            con = Conexion.getConnection();
            
            // si son todos los empleados o por cargo
            if(codCargo==0)
            {
                sentencia = " SELECT E.ID_EMPLEADO, NOMBRES, E.APELLIDOS, E.SALARIO, E.NACIMIENTO,E.DIRECCION,E.TELEFONO,E.CORREO,E.ANIOS_EXPERIENCIA,E.USUARIO,E.PASS,E.STATUS_EMPLEADO, E.RUT_EMPLEADO, EM.ID_TIPO_EMPLEO,EM.TIPO_EMPLEO,C.ID_CARGO,C.CARGO " +
                            " FROM EMPLEADOS E " +
                            "  INNER JOIN CARGOS C ON C.ID_CARGO = E.ID_CARGO " +
                            "  INNER JOIN EMPLEOS EM ON EM.ID_TIPO_EMPLEO = E.ID_TIPO_EMPLEO " +
                            " WHERE 1=1 " +
                            " ORDER BY  E.STATUS_EMPLEADO, E.ID_CARGO , E.ID_EMPLEADO ASC";
            }
            
            if(codCargo>0){
                sentencia = " SELECT E.ID_EMPLEADO, E.NOMBRES, E.APELLIDOS, E.SALARIO, E.NACIMIENTO,E.DIRECCION,E.TELEFONO,E.CORREO,E.ANIOS_EXPERIENCIA,E.USUARIO,E.PASS,E.STATUS_EMPLEADO, E.RUT_EMPLEADO, EM.ID_TIPO_EMPLEO,EM.TIPO_EMPLEO,C.ID_CARGO,C.CARGO " +
                            " FROM EMPLEADOS E " +
                            "  INNER JOIN CARGOS C ON C.ID_CARGO = E.ID_CARGO " +
                            "  INNER JOIN EMPLEOS EM ON EM.ID_TIPO_EMPLEO = E.ID_TIPO_EMPLEO " +
                            " WHERE E.ID_CARGO = '"+codCargo+"'" +
                            " ORDER BY  E.STATUS_EMPLEADO, E.ID_CARGO , E.ID_EMPLEADO ASC ";
            }
            
            pst = con.prepareStatement(sentencia);
            rs = pst.executeQuery();
            
            // recorrido de datos
            while(rs.next())
            {
                // crear obj
                Empleados e = new Empleados();
                Empleos em  = new Empleos();
                Cargos c    = new Cargos();
                
                // add attributes to object
                e.setId_empleado(rs.getInt("ID_EMPLEADO"));
                e.setNombres(rs.getString("NOMBRES"));
                e.setApellidos(rs.getString("APELLIDOS"));                
                e.setSalario(rs.getInt("SALARIO"));
                e.setNacimiento(rs.getDate("NACIMIENTO"));
                e.setDireccion(rs.getString("direccion"));
                e.setTelefono(rs.getString("telefono"));
                e.setEmail(rs.getString("correo"));
                e.setAños_experiencia(rs.getInt("anios_experiencia"));
                e.setUsuario(rs.getString("usuario"));
                e.setPassword(rs.getString("pass"));
                e.setStatus_empleado(rs.getString("status_empleado"));
                e.setRut(rs.getString("RUT_EMPLEADO"));
                
                em.setId_tipo_empleo(rs.getInt("id_tipo_empleo"));
                em.setTipo_empleo(rs.getString("tipo_empleo"));
                e.setEmpleos(em);
               
                e.setCargos(    new Cargos(    rs.getInt("id_cargo")  , rs.getString("cargo") ));
                
                datos.add(e);
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
    
    public static LinkedList<Empleados> recuperarEmpleadosPorID(int idEmpleado)
    {
        // creacion lista de datos
        LinkedList<Empleados> datos = new LinkedList<Empleados>();
        
        // instanciar variables de conectividad
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sentencia = "";
        
        try {
            con = Conexion.getConnection();
            sentencia = " select * from EMPLEADOS e where e.ID_EMPLEADO = ?";
            pst = con.prepareStatement(sentencia);
            pst.setInt(1, idEmpleado);

            rs = pst.executeQuery();
            
            // recorrido de datos
            if(rs.next())
            {
                // crear obj
                Empleados e = new Empleados();
                Empleos em  = new Empleos();
                Cargos c    = new Cargos();
                
                // add attributes to object
                e.setId_empleado(rs.getInt("ID_EMPLEADO"));
                e.setNombres(rs.getString("NOMBRES"));
                e.setApellidos(rs.getString("APELLIDOS"));                
                    // clases externas
                    em.setId_tipo_empleo(rs.getInt("ID_TIPO_EMPLEO"));
                    c.setId_cargo(rs.getInt("ID_CARGO"));
                e.setEmpleos(em);
                e.setCargos(c);

                e.setSalario(rs.getInt("SALARIO"));
                e.setNacimiento(rs.getDate("NACIMIENTO"));
                e.setDireccion(rs.getString("DIRECCION"));
                e.setTelefono(rs.getString("TELEFONO"));
                e.setEmail(rs.getString("CORREO"));
                e.setAños_experiencia(rs.getInt("ANIOS_EXPERIENCIA"));
                e.setUsuario(rs.getString("USUARIO"));
                e.setPassword(rs.getString("PASS"));
                e.setStatus_empleado(rs.getString("STATUS_EMPLEADO"));
                
                datos.add(e);
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
   
    public static boolean editarEmpleado(Empleados e)
    {
        boolean res = false;
        Connection con = null;
        PreparedStatement pst = null;
        String sentencia;
        
        
        try {
            con = Conexion.getConnection();
            sentencia = " UPDATE EMPLEADOS SET ID_TIPO_EMPLEO = ?, ID_CARGO = ?, SALARIO = ?, " +
                        " DIRECCION = ?, TELEFONO = ?, CORREO = ?, ANIOS_EXPERIENCIA = ? , " +
                        " PASS = ?, STATUS_EMPLEADO = ?" +
                        " WHERE ID_EMPLEADO = ?";
            pst = con.prepareStatement(sentencia);
            
            // setteo envio datos a servidor con Statements
            pst.setInt(1, e.getEmpleos().getId_tipo_empleo());
            pst.setInt(2, e.getCargos().getId_cargo());
            pst.setInt(3, e.getSalario());
            pst.setString(4, e.getDireccion());
            pst.setString(5, e.getTelefono());
            pst.setString(6, e.getEmail());
            pst.setInt(7, e.getAños_experiencia());
            pst.setString(8, e.getPassword());
            pst.setString(9, e.getStatus_empleado());
            pst.setInt(10, e.getId_empleado());
            
            pst.executeUpdate();
            
            res = true;
            
            pst.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally
        {
            try {
                pst.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        
        return res;
    }
    
    
}