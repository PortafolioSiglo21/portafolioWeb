/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import domain.Empleados;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.EmpleadosDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlEditEmpleados extends HttpServlet {

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
       
        // instanciar
            RequestDispatcher rd = null;
        LinkedList<Empleados> arrEmpleadoEdit = new LinkedList<Empleados>();
        
        // recepcion de datos desde jsp empleados
        int idEmpleadoEditable = Integer.parseInt(request.getParameter("txtIdEmpleadoEdit"));
        
        // recibir datos desde servidor a array
        arrEmpleadoEdit = EmpleadosDAO.recuperarEmpleadosPorID(idEmpleadoEditable);
        
        if(arrEmpleadoEdit != null ||!arrEmpleadoEdit.isEmpty())
        {
            // settear attributes if true
            request.setAttribute("empleadoEditado", "true");
            request.setAttribute("arrEditEmpleado", arrEmpleadoEdit);
            
            // desvio edicion de datos
            rd = request.getRequestDispatcher("editarPersonal.jsp");
        }else if(arrEmpleadoEdit.size() == 0){
            // settear attributes if false
            request.setAttribute("empleadoEditado", "false");
            
            // desvio edicion con problemas
            rd = request.getRequestDispatcher("personal.jsp");
        }else{
            // settear attributes if false
            request.setAttribute("empleadoEditado", "false");
            
            // desvio edicion con problemas
            rd = request.getRequestDispatcher("personal.jsp");
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
