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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
//import services.ReservacionesDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlReservacion extends HttpServlet {

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
            throws ServletException, IOException, ParseException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        
        // recepcion de datos from jsp
        String rut = request.getParameter("txtRutCliRes");
        int cantidadAsistente = Integer.parseInt(request.getParameter("txtCantidadAsiste"));
        String fechaReserva = request.getParameter("Freserva");
        String horaReserva = request.getParameter("Hreserva");
         
        
        // instancias
        RequestDispatcher rd;

        // verificar si esta rechazado o no
        boolean rechazado = ReservacionesDAO.clienteRechazado(rut);
        
        if(rechazado == true)
        {
            request.setAttribute("estadoRechazado", "true");
            rd = request.getRequestDispatcher("reservas.jsp");
            rd.forward(request, response);
        }else
        {
            // verificar si existe cliente
            boolean existeCli = ReservacionesDAO.existeCliente(rut);

            if(existeCli == true)
            {


                 boolean reservaPrevia = ReservacionesDAO.existePreviaReservacion(rut);

                 if(reservaPrevia == true)
                 {
                    request.setAttribute("reservaPrevia", "true");
                    rd = request.getRequestDispatcher("reservas.jsp");
                    rd.forward(request, response);
                 }else
                 {
                     boolean reservado = false;

                    // call class
                    Reservaciones r = new Reservaciones();
                    Clientes c = new Clientes();
                    LinkedList<Clientes> arrClie = new LinkedList<Clientes>();

                    // parse info
                   // String reservacion  = fechaReserva.concat(" ".concat(horaReserva)) ;
                    String sReservacion  = fechaReserva+" "+horaReserva;
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    Date fechaHoraRes   = df.parse(sReservacion);
                    arrClie = ClientesDAO.listarClientes(rut);

                    // setter datos
                    for (int i = 0; i < arrClie.size(); i++) {
                        c.setRut_cliente(arrClie.get(i).getRut_cliente());
                        c.setEmail(arrClie.get(i).getEmail());
                    }
                    r.setClientes(c);
                    r.setFecha_hora(fechaHoraRes);
                    r.setEstado_reserva("RESERVADO");
                    r.setCantidad_personas(cantidadAsistente);

                    reservado = ReservacionesDAO.crearReserva(r);

                    if(reservado == true)
                    {
                        EnvioMail.enviarMailReservaciones(r);

                        request.setAttribute("reservado", "true");

                        rd = request.getRequestDispatcher("reservas.jsp");
                        rd.forward(request, response);
                    }else{
                        request.setAttribute("reservado", "false");
                        rd = request.getRequestDispatcher("reservas.jsp");
                        rd.forward(request, response);
                    }

                 }

            }else{
                request.setAttribute("faltaRegistro", "true");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(controlReservacion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(controlReservacion.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(controlReservacion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(controlReservacion.class.getName()).log(Level.SEVERE, null, ex);
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
