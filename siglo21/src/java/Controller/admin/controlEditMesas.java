/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import domain.Mesas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.MesasDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlEditMesas extends HttpServlet {

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
       
        // instanciar objetos
        RequestDispatcher rd;
        LinkedList<Mesas> arrMesas = new LinkedList<Mesas>();
        
        //recepcion de datos
        String idMesaSTR      = request.getParameter("txtIdMesaEdit");
        int id = Integer.parseInt(idMesaSTR);
        
        // creamos la clase
        Mesas m = new Mesas();

        //seteamos los datos
       // m.setId_mesa(id);
      
        arrMesas = MesasDAO.recuperarIdMesas(id);

        if(arrMesas != null || !arrMesas.isEmpty())
        {
            //Setter atributos
            request.setAttribute("editable", "true");
            request.setAttribute("arrEditMesa", arrMesas);
            

            //dispatcher
            rd =request.getRequestDispatcher("editarMesas.jsp");
            
        }else{
            //Setter atributos
            request.setAttribute("mesaEditada", "false");

            //dispatcher
            rd =request.getRequestDispatcher("mesas.jsp");
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
