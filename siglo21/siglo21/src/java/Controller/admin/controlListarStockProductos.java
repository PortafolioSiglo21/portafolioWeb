package Controller.admin;

import domain.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ProductosDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlListarStockProductos extends HttpServlet {

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
           
        // instanciar dispatcher
        RequestDispatcher rd;

        // instanciar arreglo
        LinkedList<Productos> arrProdCat = new LinkedList<Productos>();

        // recepcion datos desde formulario
        int idCategoria = Integer.parseInt(request.getParameter("cboTipoProdCat"));

        // recibir desde el servidor al arreglo
        arrProdCat = ProductosDAO.stockPorCategoria(idCategoria);

        if(arrProdCat != null || !arrProdCat.isEmpty())
        {
            // settear attributes if true
            request.setAttribute("existeStockCat", "true");
            request.setAttribute("arrProdCat", arrProdCat);

            //dispatcher
            rd = request.getRequestDispatcher("stockPorProductos.jsp");
        }else if(arrProdCat.size() == 0)
        {
            // settear attributes if false
            request.setAttribute("existeStockCat", "false");

            //dispatcher
            rd = request.getRequestDispatcher("stockPorProductos.jsp");   
        }else{
            // settear attributes if false
            request.setAttribute("existeStockCat", "false");

            //dispatcher
            rd = request.getRequestDispatcher("stockPorProductos.jsp");   
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
