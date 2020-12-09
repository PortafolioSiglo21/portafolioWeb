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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class tomarMesa extends HttpServlet {

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
        Mesas m = new Mesas();
        RequestDispatcher rd = null ;
        Pedidos ped = new Pedidos();
        Clientes c = new Clientes();
        Cargos car = new Cargos();
        
        int idMesa = Integer.parseInt(request.getParameter("cboMesa"));
        int idCargo = Integer.parseInt(request.getParameter("txtIdCargo"));
        
        ArrayList<Mesas> arrMesas = new ArrayList<>();
        arrMesas = MesasDAO.recuperarMesas();
        
        for (int i = 0; i < arrMesas.size(); i++) {
            int id = arrMesas.get(i).getId_mesa();
            int capacidad = arrMesas.get(i).getCapacidad();
            
            if(id == idMesa)
            {
                m.setId_mesa(idMesa);
                m.setCapacidad(capacidad);
                m.setStatus_mesa("OCUPADA");
            }
        }
        // 76191789-7
       
       
        // insertar registro en pedido
        m.setId_mesa(idMesa);
        car.setId_cargo(idCargo);
        c.setRut_cliente("76191789-7");
        
        ped.setCargos(car);
        ped.setMesas(m);
        ped.setClientes(c);
        
        
        boolean registroIngresoTotem = PedidosDAO.insertarRegistroPedidoTotem(ped);
        
        boolean tomada = MesasDAO.editarMesa(m);
        
        if(tomada == false)
        {
            rd = request.getRequestDispatcher("tomarMesa.jsp");
            request.setAttribute("tomada", "false");
        }else{
            if(registroIngresoTotem == false)
            {
                
            }
            else
            {
                String idMesaStr = Integer.toString(idMesa);
                rd = request.getRequestDispatcher("index.jsp");
                request.setAttribute("tomada", "true");
                request.setAttribute("numMesaTomada", idMesaStr);
            }
            String idMesaStr = Integer.toString(idMesa);
            rd = request.getRequestDispatcher("index.jsp");
            request.setAttribute("tomada", "true");
            request.setAttribute("numMesaTomada", idMesaStr);
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
