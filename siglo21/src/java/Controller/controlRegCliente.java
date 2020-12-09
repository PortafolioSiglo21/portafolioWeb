/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import domain.Clientes;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ClientesDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlRegCliente extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String rut      = request.getParameter("txtRutCli");
        String nombres  = request.getParameter("txtNombresCli");
        String apellidos= request.getParameter("txtApellidosCli");
        String telefono = request.getParameter("txtTelefonoCli");
        String email    = request.getParameter("txtEmailCli");
        String estado   = "ACTIVO";
        
        
        
        // comparamos con la consulta e ingreso de newCliente()
        boolean existeONo = ClientesDAO.existeCliente(rut);
        
        
        //instanciar RequestDispatcher
        RequestDispatcher rd;
        
        // variable nombre completo
        String fullNombre = nombres.concat(" ".concat(apellidos));
        
        // verificamos con sentencia
        if(existeONo==true)
        {
           
            request.setAttribute("existeCliente", "true");
            request.setAttribute("nombreCliente", fullNombre);
            rd = request.getRequestDispatcher("registroCliente.jsp");
            rd.forward(request, response);
        }else
        {
            boolean creado = false;
            
            // llamamos a la clase
            Clientes c = new Clientes();
        
            //seteamos los datos
            c.setRut_cliente(rut);
            c.setNombres(nombres.toLowerCase());
            c.setApellidos(apellidos.toLowerCase());
            c.setTelefono(telefono);
            c.setEmail(email.toLowerCase());
            c.setEstado(estado);
            
            // agregar datos del cliente a la dba y asignar valor  a la variable
            creado = ClientesDAO.crearRegCliente(c);
            
           
            
            //verificar con sentencia si se creo o no
            if(creado == true)
            {
                 
                request.setAttribute("clienteAgregado", "true");
                request.setAttribute("nombreClienteAgregado", fullNombre);
                rd = request.getRequestDispatcher("registroCliente.jsp");
                rd.forward(request, response);
            }else
            {
               
                request.setAttribute("clienteAgregado", "false");
                request.setAttribute("nombreClienteAgregado", fullNombre);
                rd = request.getRequestDispatcher("registroCliente.jsp");
                rd.forward(request, response);
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
