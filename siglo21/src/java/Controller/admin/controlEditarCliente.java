/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import domain.Clientes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class controlEditarCliente extends HttpServlet {

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
        
        // instanciar Dispatcher
        RequestDispatcher rd = null;
        
        // instanciar ArrayList
        ArrayList<Clientes> arrCliente = new ArrayList<Clientes>();
        
        // recepcion de datos from jsp clientes
        int idCliente = Integer.parseInt(request.getParameter("idClienteList"));
        
        // recibir datos desde el servidor a array
        arrCliente = ClientesDAO.recuperarClientePorID(idCliente);
        
        if (arrCliente != null ||!arrCliente.isEmpty()) {
            // settear attributes if true
            request.setAttribute("clienteEditable", "true");
            request.setAttribute("arrCliente", arrCliente);
            
            // dispatcher
            rd = request.getRequestDispatcher("editarClientes.jsp");
            
        }else if(arrCliente.size() == 0){
            // settear attributes if true
            request.setAttribute("clienteEditable", "false");
            
            // dispatcher
            rd = request.getRequestDispatcher("clientes.jsp");
        }else {
            // settear attributes if true
            request.setAttribute("clienteEditable", "false");
            
            // dispatcher
            rd = request.getRequestDispatcher("clientes.jsp");
        }
        
        rd.forward(request, response);
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