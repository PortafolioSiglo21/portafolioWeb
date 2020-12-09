package Controller.admin;

import domain.Administrador;
import domain.Proveedores;
import java.io.IOException;
import java.io.PrintWriter;
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
public class controlAddProveedor extends HttpServlet {

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
        
        // instanciar boolean de creacion o consultas
        boolean creado = false;
        boolean existe = false;
        boolean editado = false;
        
        // instanciar RequestDispatcher
        RequestDispatcher rd;
        
        // importar datos desde proveedores.jsp
        String idAdminSTR       = request.getParameter("txtIdAdmin");
        
        
        int idProveedor         = Integer.parseInt(request.getParameter("txtIdProv"));
        
        // Crear objeto de la clase
        Proveedores p = new Proveedores();
        Administrador a = new Administrador();
       
        // condicionante si es nuevo o para editar
        if(idProveedor == 0)
        {
            String rutProveedor     = request.getParameter("txtRutProv");
            String nombreProveedor  = request.getParameter("txtNombreProv");
            String contactoProveedor= request.getParameter("txtContactoProv");
            String telefonoProveedor= request.getParameter("txtTelefonoProv");
            String webProveedor     = request.getParameter("txtWebProv");
            String emailProveedor   = request.getParameter("txtEmailProv");
            String estadoProveedor  = request.getParameter("cboEstadoPro");

            //  settear datos
            p.setId_proveedor(idProveedor);
            p.setRut_proveeedor(rutProveedor);
            p.setProveedor(nombreProveedor.toLowerCase());
            p.setNombre_contacto(contactoProveedor.toLowerCase());
            p.setTelefono(telefonoProveedor);
            p.setSitio_web(webProveedor.toLowerCase());
            p.setEmail_proveedor(emailProveedor.toLowerCase());
            p.setEstado(estadoProveedor.toUpperCase());
            a.setId_admin(idAdminSTR);

            p.setAdministrador(a);


            existe = ProveedorDAO.existeProveedor(rutProveedor);
            // condicionante si existe o no el rut del proveedor
            if(existe == false)
            {
                creado = ProveedorDAO.crearProveedor(p);
                // condicionante si es creado o no
                if(creado == true)
                {
                    String nameProvAdd = nombreProveedor;

                    request.setAttribute("provAdd", "true");
                    request.setAttribute("nameProvAdd", nameProvAdd);
                }else{
                    String nameProvAdd = nombreProveedor;

                    request.setAttribute("provAdd", "false");
                    request.setAttribute("nameProvAdd", nameProvAdd);
                }
            }else{
                request.setAttribute("existeRut", "true");
                request.setAttribute("numRutExiste", rutProveedor);
            }
            
            
            rd = request.getRequestDispatcher("proveedores.jsp");
            rd.forward(request, response);
        }else if(idProveedor > 0)
        {
            String proveedorEdit    = request.getParameter("txtNombreProvEdit");
            String contactoEdit     = request.getParameter("txtContactoProvEdit");
            String telefonoEdit     = request.getParameter("txtTelefonoProvEdit");
            String webEdit          = request.getParameter("txtWebProvEdit");
            String emailEdit        = request.getParameter("txtEmailProvEdit");
            String estadoEdit       = request.getParameter("cboEstadoPro");
            
            p.setId_proveedor(idProveedor);
            p.setProveedor(proveedorEdit.toLowerCase());
            p.setNombre_contacto(contactoEdit.toLowerCase());
            p.setTelefono(telefonoEdit);
            p.setSitio_web(webEdit.toLowerCase());
            p.setEmail_proveedor(emailEdit.toLowerCase());
            p.setEstado(estadoEdit.toUpperCase());
            
            
            editado = ProveedorDAO.editarProveedor(p);
            
            if(editado == true)
            {
                String nameProvAdd = proveedorEdit;

                request.setAttribute("provEdit", "true");
                request.setAttribute("nameProvEdit", nameProvAdd);
            }else{
                String nameProvAdd = proveedorEdit;

                request.setAttribute("provEdit", "false");
                request.setAttribute("nameProvEdit", nameProvAdd);
            }
            
            rd = request.getRequestDispatcher("proveedores.jsp");
            rd.forward(request, response);
            
        }
        
        
        
        
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
