/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

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
public class controlAddCliente extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
            // llamado a clase cliente
            Clientes c = new Clientes();
            
            // recepcion de datos
            int idCli           = Integer.parseInt(request.getParameter("txtIdCli"));
            String rutCli       = request.getParameter("txtRutCli");
            String nombresCli   = request.getParameter("txtNombresCli");
            String apellidosCli = request.getParameter("txtApellidosCli");
            String telefonoCli  = request.getParameter("txtTelefonoCli");
            String emailCli     = request.getParameter("txtEmailCli");
            String estadoCli    = request.getParameter("cboEstadoCli");
            
            // verificamos la existencia del cliente
            boolean existeCliente = ClientesDAO.existeCliente(rutCli);
            
            // instanciamos RequestDispatcher
            RequestDispatcher rd;
            
            if(idCli==0)
            {
                if(existeCliente==true)
                {
                   
                    request.setAttribute("existeCliente", "true");
                    request.setAttribute("nombreClienteExiste", rutCli);
                    rd = request.getRequestDispatcher("clientes.jsp");
                    rd.forward(request, response);
                }else{
                    boolean creado = false;
                    
                    c.setId_cliente(idCli);
                    c.setRut_cliente(rutCli);
                    c.setNombres(nombresCli.toLowerCase());
                    c.setApellidos(apellidosCli.toLowerCase());
                    c.setTelefono(telefonoCli);
                    c.setEmail(emailCli.toLowerCase());
                    c.setEstado(estadoCli);
                    
                    creado = ClientesDAO.crearRegCliente(c);
                    
                    if(creado == true)
                    {
                        // crear nombre completo
                        String fullName = nombresCli + " " + apellidosCli;
                        
                        // settear attributes
                        request.setAttribute("clienteAgregado", "true");
                        request.setAttribute("nombreClienteAdd", fullName);
                        
                        // dispatcher
                        rd = request.getRequestDispatcher("clientes.jsp");
                        rd.forward(request, response);
                    }else{
                        // crear nombre completo
                        String fullName = nombresCli + " " + apellidosCli;
                        
                        // settear attributes
                        request.setAttribute("clienteAgregado", "false");
                        request.setAttribute("nombreClienteAdd", fullName);
                        
                        // dispatcher
                        rd = request.getRequestDispatcher("clientes.jsp");
                        rd.forward(request, response);
                    }
                }
                
            }
            else if(idCli >0){
                // update cliente
                boolean editado = false;
                String fullNameEdit;
                
                // importar desde jsp editClientes
                int idCliente = Integer.parseInt(request.getParameter("txtIdCli"));
                String nombres = request.getParameter("txtNombresCliEdit");
                String apellidos = request.getParameter("txtApellidosCliEdit");
                String telefono = request.getParameter("txtTelefonoCliEdit");
                String email    = request.getParameter("txtEmailCliEdit");
                String estado   = request.getParameter("cboEstadoCliEdit");
                
                Clientes cl = new Clientes();
                
                cl.setId_cliente(idCliente);
                cl.setNombres(nombres);
                cl.setApellidos(apellidos);
                cl.setTelefono(telefono);
                cl.setEmail(email);
                cl.setEstado(estado);
                
                editado = ClientesDAO.editarCliente(cl);
                
                if(editado == true)
                {
                    fullNameEdit = nombres.concat(" ".concat(apellidos));
                    // settear attributes
                    request.setAttribute("clienteEditado", "true");
                    request.setAttribute("nombreCliEdit", fullNameEdit);

                    // dispatcher
                    rd = request.getRequestDispatcher("clientes.jsp");
                    rd.forward(request, response);
                }else{
                    fullNameEdit = nombres.concat(" ".concat(apellidos));
                    // settear attributes
                    request.setAttribute("clienteEditado", "false");
                    request.setAttribute("nombreCliEdit", fullNameEdit);

                    // dispatcher
                    rd = request.getRequestDispatcher("clientes.jsp");
                    rd.forward(request, response);
                }
                
                
                
            }else{
                // settear attributes
                request.setAttribute("clienteEditado", "false");
                
                 // dispatcher
                rd = request.getRequestDispatcher("clientes.jsp");
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
