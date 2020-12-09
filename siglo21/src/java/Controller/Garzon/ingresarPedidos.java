/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Garzon;

import domain.Carta;
import domain.Mesas;
import domain.Ordenes;
import domain.Pedidos;
import domain.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.OrdenesDAO;
import services.PedidosDAO;

/**
 *
 * @author Dr4g0n
 */
public class ingresarPedidos extends HttpServlet {

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
        RequestDispatcher rd = null ;
        Ordenes o = new Ordenes();
        Mesas m = new Mesas();
        Carta c = new Carta();
        Productos p = new Productos();
        Pedidos pe = new Pedidos();
        
        
        String[] idEntradas = request.getParameterValues("entradas[]");
        String[] idPrincipal = request.getParameterValues("principal[]");
        String[] idPostres = request.getParameterValues("postre[]");
        String[] idBebestibles = request.getParameterValues("bebestibles[]");
        
        int idMesa = Integer.parseInt(request.getParameter("cboSelAddMesa"));
        
        m.setId_mesa(idMesa);
        pe.setMesas(m);
        
        if( idEntradas == null && idPrincipal == null && idPostres == null && idBebestibles == null)
        {
            request.setAttribute("noHayIngresos", "true");
            rd = request.getRequestDispatcher("ingresoPedidos.jsp");
        }else
        {
            if(idEntradas !=null )
            {
                int idEnt;
                
                for (String idEntrada : idEntradas) {
                    idEnt = Integer.parseInt(idEntrada);
                    c.setId_carta(idEnt);
                    o.setMesas(m);
                    o.setCarta(c);
                    
                    OrdenesDAO.ingresarOrdenPedidoCartas(o);
                }
            }
             
            if(idPrincipal != null)
            {
               int idPri;
               
                for (String idPrinci : idPrincipal) {
                    idPri = Integer.parseInt(idPrinci);
                    c.setId_carta(idPri);
                    o.setMesas(m);
                    o.setCarta(c);
                    
                    OrdenesDAO.ingresarOrdenPedidoCartas(o);
                }
            }
            
            if(idPostres != null)
            {
                int idPos;
                
                for (String idPostre : idPostres) {
                    idPos = Integer.parseInt(idPostre);
                    c.setId_carta(idPos);
                    o.setMesas(m);
                    o.setCarta(c);
                    
                    OrdenesDAO.ingresarOrdenPedidoCartas(o);
                }
            }
            
            if(idBebestibles != null)
            {
                int idBeb;
                
                for (String idBebestible : idBebestibles) {
                    idBeb = Integer.parseInt(idBebestible);
                    p.setId_producto(idBeb);
                    o.setMesas(m);
                    o.setProductos(p);
                    
                    OrdenesDAO.ingresarOrdenPedidoProductos(o);
                }
            }
             
            PedidosDAO.actualizarPedidoSolicitado(pe);
            request.setAttribute("numMesa", Integer.toString(idMesa));
            request.setAttribute("ordenIngresada", "true");
            rd = request.getRequestDispatcher("ingresoPedidos.jsp");
            
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
