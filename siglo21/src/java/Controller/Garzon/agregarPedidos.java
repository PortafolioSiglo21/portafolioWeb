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
public class agregarPedidos extends HttpServlet {

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
        RequestDispatcher rd = null;
        Ordenes o = new Ordenes();
        Mesas m = new Mesas();
        Carta c = new Carta();
        Productos p = new Productos();
        Pedidos pe = new Pedidos();
         int contador =0;
        
        // capturas desde jsp
        int idMesa = Integer.parseInt(request.getParameter("cboSelAddMesa"));
        String[] idExtra = request.getParameterValues("extra[]");
        
        // guardar mesa en objeto
        m.setId_mesa(idMesa);
        pe.setMesas(m);
        
        if(idExtra == null)
        {
            /*
            request.setAttribute("noHayExtras", "true");
            rd = request.getRequestDispatcher("addExtra.jsp");*/
        }else{
            String captura;
           
            for (String idExt : idExtra) 
            {
                captura = idExt;
                String[] cortar = captura.split("-");
                String getNum = cortar[0];
                String getType = cortar[1];
                
                contador = contador +1;
                
                int idPedExtra;
                
                if(getType.contains("C"))
                {
                    idPedExtra = Integer.parseInt(getNum);
                    c.setId_carta(idPedExtra);
                    o.setMesas(m);
                    o.setCarta(c);
                    
                    OrdenesDAO.ingresarOrdenPedidoCartas(o);
                    
                }else if(getType.contains("P"))
                {
                    idPedExtra = Integer.parseInt(getNum);
                    p.setId_producto(idPedExtra);
                    o.setMesas(m);
                    o.setProductos(p);
                    
                    OrdenesDAO.ingresarOrdenPedidoProductos(o);
                }
                
            }
            
            
            request.setAttribute("numMesa", Integer.toString(idMesa));
            request.setAttribute("cantidadExtras", Integer.toString(contador));
            request.setAttribute("extraIngresado", "true");
            rd = request.getRequestDispatcher("addExtra.jsp");
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
