package Controller.chef;

import domain.Carta;
import domain.TipoCarta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.CartaDAO;

/**
 *
 * @author Dr4g0n
 */
public class controlAddCarta extends HttpServlet {

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
        Carta c = new Carta();
        TipoCarta t = new TipoCarta();
        RequestDispatcher rd = null;
        boolean creada = false;
        
        // captura de id
        int idmenu = Integer.parseInt(request.getParameter("idMenu"));
        
        if(idmenu == 0)
        {
            int tipoCarta       = Integer.parseInt(request.getParameter("cboTipoMenuAdd"));
            String descripcion  = (String)request.getParameter("txtAddDescriptionMenu");
            String nameCarta    = (String)request.getParameter("txtAddNameMenu");
            double precio       = Double.parseDouble(request.getParameter("precioMenu"));
            t.setId_tipo_carta(tipoCarta);
            c.setTipoCarta(t);
            c.setDescripcion_Carta(descripcion);
            c.setNombre(nameCarta);
            c.setPrecio(precio);
           
            creada = CartaDAO.crearCarta(c);


            if(creada == true)
            {
                request.setAttribute("cartaCreada", "true");
                request.setAttribute("nameCarta", nameCarta);
                rd = request.getRequestDispatcher("crearMenu.jsp");
            }else
            {
                request.setAttribute("cartaCreada", "false");
                rd = request.getRequestDispatcher("crearMenu.jsp");
            }
        }else{
            
            int tipoCarta       = Integer.parseInt(request.getParameter("cboTipoMenuEdit"));
            String descripcion  = request.getParameter("EditDescriptionMenu");
            String nameCarta    = request.getParameter("EditNameMenu");
            double precio       = Double.parseDouble(request.getParameter("EditPrecio"));

            t.setId_tipo_carta(tipoCarta);
            c.setTipoCarta(t);
            c.setDescripcion_Carta(descripcion);
            c.setNombre(nameCarta);
            c.setPrecio(precio);
            c.setId_carta(idmenu);
            
            
            boolean editada = CartaDAO.editarCarta(c);
            
            if(editada == true)
            {
                request.setAttribute("editada", "true");
                request.setAttribute("nombreEditada", nameCarta);
                rd = request.getRequestDispatcher("crearMenu.jsp");
            }else{
                request.setAttribute("editada", "false");
                rd = request.getRequestDispatcher("editMenu.jsp");
            }
            
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
        response.setContentType("text/html;charset=UTF-8");
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
        response.setContentType("text/html;charset=UTF-8");
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
