/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.totem;

import domain.Cargos;
import domain.Clientes;
import domain.Mesas;
import domain.Pedidos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.MesasDAO;
import services.PedidosDAO;

/**
 *
 * @author Dr4g0n
 */
public class ingresoReserva extends HttpServlet {

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
        RequestDispatcher rd ;
        Pedidos p = new Pedidos();
        Cargos car = new Cargos();
        Clientes c = new Clientes();
        Mesas m = new Mesas();
        
        int mesaTomada = Integer.parseInt(request.getParameter("cboMesaSeleccionada"));
        int idCargo = Integer.parseInt(request.getParameter("txtCargo"));
        String rutReserva = request.getParameter("txtRutReserva");
        String nombre = request.getParameter("txtNombreRes");
        
        m.setId_mesa(mesaTomada);
        car.setId_cargo(idCargo);
        c.setRut_cliente(rutReserva);
        
        p.setCargos(car);
        p.setMesas(m);
        p.setClientes(c);
        
        PedidosDAO.insertarRegistroPedidoTotem(p);
                
        MesasDAO.editarMesaRes(mesaTomada);
        
        request.setAttribute("ingresoRes", "true");
        request.setAttribute("nombreIngreso", nombre);
        request.setAttribute("mesaTomadaRes", Integer.toString(mesaTomada));
        rd = request.getRequestDispatcher("index.jsp");
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
