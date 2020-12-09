/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import domain.Proveedores;
import domain.PedidoProveedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.PedidoProveedorDAO;
import services.ProveedorDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlListarPedidoProveedor extends HttpServlet {

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
        
        //         captura datos from jsp
        String idPedidoProveedor = request.getParameter("txtIdPedido");
        
        // instanciar Dispatcher
        RequestDispatcher rd = null;
        
        if(idPedidoProveedor == " "|| idPedidoProveedor == null || idPedidoProveedor == "0")
        {
            //request.setAttribute("datosModificados", "true");
            rd = request.getRequestDispatcher("verPedidos.jsp");
        }else{
            //      conversion de dato string to int
            int idPedido = Integer.parseInt(idPedidoProveedor);

            // captura datos de pedidos
            LinkedList<PedidoProveedor> arrPedido = new LinkedList<PedidoProveedor>();
            arrPedido = PedidoProveedorDAO.listarPedidoPorID(idPedido);

            // instanciar clase proveedor
            Proveedores p = new Proveedores();

            // recorrido arreglo para capturar proveedor
            for (int i = 0; i < arrPedido.size(); i++) {
                p.setId_proveedor(arrPedido.get(i).getProveedores().getId_proveedor());
            }

            // captura id proveedor
            int idProveedor = p.getId_proveedor();

            // captura datos de proveedor
            LinkedList<Proveedores> arrProveedor = new LinkedList<Proveedores>();
            arrProveedor = ProveedorDAO.recuperarProveedorPorId(idProveedor);
            
            request.setAttribute("arrPedido", arrPedido);
            request.setAttribute("arrProveedor", arrProveedor);
            rd = request.getRequestDispatcher("datosPedidos.jsp");
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
