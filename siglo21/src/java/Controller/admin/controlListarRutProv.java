package Controller.admin;

import domain.Proveedores;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ProveedorDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlListarRutProv extends HttpServlet {

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
       
        // recepcion datos from web
        String rutSearch    = request.getParameter("txtRutProSearch");
        
        // instanciar 
        RequestDispatcher rd;
        
        LinkedList<Proveedores> arrRutProveedor = new LinkedList<Proveedores>();
        arrRutProveedor = ProveedorDAO.listarProveedorRut(rutSearch);
        
       if(rutSearch != null || !rutSearch.isEmpty())
       {
           
            // settear attributes
            request.setAttribute("rutProvArr", arrRutProveedor);
            request.setAttribute("devuelveRutCli", "true");
            
       
       }else 
       {
           request.setAttribute("devuelveRutCli", "false");
       }
       
       //DIspatcher 
        rd = request.getRequestDispatcher("proveedores.jsp");
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
