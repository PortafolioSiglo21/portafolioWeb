/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import domain.Cargos;
import domain.Empleados;
import domain.Empleos;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
//import java.sql.Date;
//import java.text.DateFormat;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.EmpleadosDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlAddEmpleados extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        
        // instanciar verificar creacion
        boolean creado = false;
        
        // instanciar dispatcher
        RequestDispatcher rd;
        
        // preguntar si se crea o edita
        int idEmpleado      = Integer.parseInt(request.getParameter("txtIdEmp"));       //13
       
        if(idEmpleado==0)
        {
            // importar datos desde jsp
            String nombres      = request.getParameter("txtNombresEmp");                    //1
            String apellidos    = request.getParameter("txtApellidosEmp");                  //2
            int codigoTipoEmpleo= Integer.parseInt(request.getParameter("cboTipoEmpleo"));  //12
            int codigoCargo     = Integer.parseInt(request.getParameter("cboTipoCargo"));   //3
            int salario         = Integer.parseInt(request.getParameter("txtSalarioEmp"));  //4
            String nacimiento   = request.getParameter("dateNacimientoEmp");                //5
            String direccion    = request.getParameter("txtDireccionEmp");                  //6
            String telefono     = request.getParameter("txtTelefonoEmp");                   //7
            String email        = request.getParameter("txtEmailEmp");                      //8
            int añosExperiencia = Integer.parseInt(request.getParameter("txtExpeEmp"));  //9
            String usuario      = request.getParameter("txtUserEmp");                       //10
            String password     = request.getParameter("txtPassEmp");                       //11
            String statusEmp    = request.getParameter("cboStatusEmp");                     //14
            String rutEmp       = request.getParameter("txtRutEmp");


            //crear clase
            Empleados e = new Empleados();
            Cargos c    = new Cargos();
            Empleos em  = new Empleos();

            SimpleDateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
            String nacStr = nacimiento;
            Date nacDate = df.parse(nacStr);


            // seteamos datos
            e.setId_empleado(idEmpleado);
            e.setNombres(nombres.toLowerCase());
            e.setApellidos(apellidos.toLowerCase());
            // settear las otras clases
            em.setId_tipo_empleo(codigoTipoEmpleo);
            c.setId_cargo(codigoCargo);
            //settear atributos de clases
            e.setEmpleos(em);
            e.setCargos(c);
            e.setSalario(salario);
            e.setDireccion(direccion.toLowerCase());
            e.setTelefono(telefono);
            e.setEmail(email.toLowerCase());
            e.setAños_experiencia(añosExperiencia);
            e.setUsuario(usuario.toLowerCase());
            e.setPassword(password);
            e.setStatus_empleado(statusEmp.toUpperCase());
            e.setNacimiento(nacDate);
            e.setRut(rutEmp);

            creado = EmpleadosDAO.crearEmpleado(e);

            if(creado==true)
            {
                String fullName = nombres+ " "+apellidos;
                String addEmp = "true";
                // settear atributos
                request.setAttribute("empleadoAdd", addEmp);
                request.setAttribute("nombreEmpAdd", fullName);

                //dispatcher
                rd  = request.getRequestDispatcher("personal.jsp");
                rd.forward(request, response);
            }else{
                String fullName = nombres+ " "+apellidos;
                String addEmp = "false";
                // settear atributos
                request.setAttribute("empleadoAdd", addEmp);
                request.setAttribute("nombreEmpAdd", fullName);
                rd  = request.getRequestDispatcher("personal.jsp");
                rd.forward(request, response);            
            }
        }else if(idEmpleado > 0)
        {
            // instanciar verificar edicion
            boolean editado = false;
            String fullname;
            
            // importar datos desde jsp
             String nombres      = request.getParameter("txtNombresEmpEdit");                    //1
            String apellidos    = request.getParameter("txtApellidosEmpEdit");                  //2
            int codigoTipoEmpleo= Integer.parseInt(request.getParameter("cboTipoEmpleoEdit"));  //12
            int codigoCargo     = Integer.parseInt(request.getParameter("cboTipoCargoEdit"));   //3
            int salario         = Integer.parseInt(request.getParameter("txtSalarioEmpEdit"));  //4
            String direccion    = request.getParameter("txtDireccionEmpEdit");                  //6
            String telefono     = request.getParameter("txtTelefonoEmpEdit");                   //7
            String email        = request.getParameter("txtEmailEmpEdit");                      //8
            int añosExperiencia = Integer.parseInt(request.getParameter("txtExpeEmpEdit"));  //9
            String password     = request.getParameter("txtPassEmpEdit");                       //11
            String statusEmp    = request.getParameter("cboStatusEmpEdit");                     //14
            
            //crear clases
            Empleados e = new Empleados();
            Empleos em  = new Empleos();
            Cargos c    = new Cargos();

            //settear los datos
            e.setId_empleado(idEmpleado);
           
            em.setId_tipo_empleo(codigoTipoEmpleo);
            c.setId_cargo(codigoCargo);
            
            e.setEmpleos(em);
            e.setCargos(c);
            e.setSalario(salario);
            e.setDireccion(direccion.toLowerCase());
            e.setTelefono(telefono);
            e.setEmail(email.toLowerCase());
            e.setAños_experiencia(añosExperiencia);
            e.setPassword(password);
            e.setStatus_empleado(statusEmp.toUpperCase());
            
            editado = EmpleadosDAO.editarEmpleado(e);
            
            if(editado == true)
            {
                fullname = nombres.concat(" ".concat(apellidos));
                // settear atributos
                request.setAttribute("empleadoEditado", "true");
                request.setAttribute("nombreEmpEdit", fullname);

                //dispatcher
                rd  = request.getRequestDispatcher("personal.jsp");
                rd.forward(request, response);
                
            }else
            {
                // settear attributes
                request.setAttribute("empleadoEditado", "false");
                rd = request.getRequestDispatcher("personal.jsp");
                rd.forward(request, response);
            }
            
        }else{
            rd = request.getRequestDispatcher("personal.jsp");
            rd.forward(request, response);
        }
        
    
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(controlAddEmpleados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(controlAddEmpleados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
