/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.totem;

import domain.Reservaciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ReservacionesDAO;

/**
 *
 * @author Dr4g0n
 */
public class tomarReserva extends HttpServlet {

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
       
        // instacias
        RequestDispatcher rd = null;
                
        
        String rutReservante = request.getParameter("txtRutReserva");
        
        if(rutReservante == null || rutReservante == " " || rutReservante.isEmpty())
        {
            request.setAttribute("faltaRutReserva", "true");
            rd = request.getRequestDispatcher("tomarReserva.jsp");
        }else{
            LinkedList<Reservaciones> arrDatos = new LinkedList<>();
            arrDatos = ReservacionesDAO.datosReserva(rutReservante);
            
            if(arrDatos.isEmpty() || arrDatos == null || arrDatos.size() == 0)
            {
                request.setAttribute("noHayReservas", "true");
                rd = request.getRequestDispatcher("index.jsp");
            }else{
                request.setAttribute("arrDatosReserva", arrDatos);
                rd = request.getRequestDispatcher("datosReserva.jsp");
            }
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
