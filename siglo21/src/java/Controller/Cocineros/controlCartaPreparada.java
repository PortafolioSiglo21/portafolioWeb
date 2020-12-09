/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Cocineros;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.OrdenesDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlCartaPreparada extends HttpServlet {

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
        
        // instancias
        boolean yaFuePreparado = false;
        boolean ordenPreparada = false;
        RequestDispatcher rd = null;
        
        // captura from jsp
        int idOrdenPedido = Integer.parseInt(request.getParameter("txtCerrarOrdenPedido"));
        
        yaFuePreparado = OrdenesDAO.estaPreparado(idOrdenPedido);
        
        if(idOrdenPedido !=0)
        {
            if(yaFuePreparado == true)
            {
                request.setAttribute("estaPreparado", "true");
                rd = request.getRequestDispatcher("pedidosCocina.jsp");
            }else
            {   
                ordenPreparada = OrdenesDAO.OrdenPreparada(idOrdenPedido);
                
                if(ordenPreparada == true)
                {
                    request.setAttribute("ordenPreparada", "true");
                    rd = request.getRequestDispatcher("pedidosCocina.jsp");
                }else
                {
                    request.setAttribute("ordenPreparada", "false");
                    rd = request.getRequestDispatcher("pedidosCocina.jsp");
                }
            }
        }else{
            request.setAttribute("errorPedidoCocina", "true");
            rd = request.getRequestDispatcher("pedidosCocina.jsp");
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
