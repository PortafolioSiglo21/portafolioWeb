/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import domain.Clientes;
import domain.Reservaciones;
import domain.EnvioMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ClientesDAO;
import services.ReservacionesDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlCancelarReserva extends HttpServlet {

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
            throws ServletException, IOException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        
         // captura de datos from jsp
        String rut = request.getParameter("txtRutCancela");
        
        // instancias
        RequestDispatcher rd;
        boolean cancelado = false;
        boolean tieneReservado = false;
        LinkedList<Reservaciones> arrDatosReserva = new LinkedList<Reservaciones>();
        LinkedList<Clientes> arrDatosCliente = new LinkedList<Clientes>();
        Reservaciones r = new Reservaciones();
        Clientes c = new Clientes();
        int tieneDatos = 0;
        
        tieneDatos = ReservacionesDAO.existeDatos(rut);
        
        if(tieneDatos == 0)
        {
            request.setAttribute("sinReservas", "true");

                rd = request.getRequestDispatcher("cancelarReservas.jsp");
        }else{
            tieneReservado = ReservacionesDAO.reservasGenerada(rut);
        
            if(tieneReservado == false)
            {
                request.setAttribute("cancelado", "false");

                rd = request.getRequestDispatcher("cancelarReservas.jsp");
            }else
            {
                // arreglos captura de datos
                arrDatosCliente = ClientesDAO.listarClientes(rut);
                arrDatosReserva = ReservacionesDAO.datosReservaTotal(rut);

                for (int i = 0; i < arrDatosCliente.size(); i++) {
                    c.setRut_cliente(arrDatosCliente.get(i).getRut_cliente());
                    c.setEmail(arrDatosCliente.get(i).getEmail());
                }
                r.setClientes(c);

                for (int i = 0; i < arrDatosReserva.size(); i++) {
                    r.setFecha_hora(arrDatosReserva.get(i).getFecha_hora());
                    r.setCantidad_personas(arrDatosReserva.get(i).getCantidad_personas());
                }

                 // verificaciones 
                cancelado = ReservacionesDAO.cancelarReserva(rut);

                if(cancelado == true)
                {
                    EnvioMail.enviarMailCancelacion(r);
                    request.setAttribute("cancelado", "true");

                    rd = request.getRequestDispatcher("reservas.jsp");
                }else
                {
                    request.setAttribute("cancelado", "false");

                    rd = request.getRequestDispatcher("cancelarReservas.jsp");
                }
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(controlCancelarReserva.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (MessagingException ex) {
            Logger.getLogger(controlCancelarReserva.class.getName()).log(Level.SEVERE, null, ex);
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
