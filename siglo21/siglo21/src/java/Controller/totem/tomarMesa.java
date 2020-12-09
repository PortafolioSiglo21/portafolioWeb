/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.totem;

import domain.Mesas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        
        int idMesa = Integer.parseInt(request.getParameter("cboMesa"));
       
        Mesas m = new Mesas();
        RequestDispatcher rd = null ;
        
        
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
        
        boolean tomada = MesasDAO.editarMesa(m);
        
        if(tomada == false)
        {
            rd = request.getRequestDispatcher("tomarMesa.jsp");
            request.setAttribute("tomada", "false");
        }else{
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
