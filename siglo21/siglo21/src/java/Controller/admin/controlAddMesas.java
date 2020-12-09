package Controller.admin;

import domain.Mesas;
import java.io.IOException;
import java.io.PrintWriter;
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
public class controlAddMesas extends HttpServlet {

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
        
        
        
        int idMesa          = Integer.parseInt(request.getParameter("txtIdNumMesa"));
        
        
        
        
        if(idMesa == 0)
        {
            // recepcion de datos crear
            int numMesa         = Integer.parseInt(request.getParameter("txtNumMesa"));
            int capacidad       = Integer.parseInt(request.getParameter("txtCapMesa"));
            String estadoStr    = request.getParameter("cboEstado");
        
            // comparamos la existencia de la mensa o no        
            boolean existeMesa = MesasDAO.existeMesa(numMesa);

            //instanciar RequestDispatcher
            RequestDispatcher rd;


            // verificamos con sentencia
            if(existeMesa==true)
            {


                request.setAttribute("existeMesa", "true");
                request.setAttribute("numExisteMesa", Integer.toString(numMesa));
                rd = request.getRequestDispatcher("mesas.jsp");
                rd.forward(request, response);
            }else{
                boolean creada = false;

                // creamos la clase
                Mesas m = new Mesas();

                // seteamos los datos
                m.setId_mesa(numMesa);
                m.setCapacidad(capacidad);
                m.setStatus_mesa(estadoStr);

                // agregar datos de la mesa a la dba y asignar valor  a la variable
                creada = MesasDAO.crearMesa(m);

                //verificar sentencia si se creo o no
                if(creada==true)
                {

                    //Setter atributos
                    request.setAttribute("mesaAgregada", "true");
                    request.setAttribute("capacidadMesaAdd", Integer.toString(capacidad));
                    request.setAttribute("numeroMesaAdd", Integer.toString(numMesa));

                    //dispatcher
                    rd =request.getRequestDispatcher("mesas.jsp");
                    rd.forward(request, response);
                }else{
                    //Setter atributos
                    request.setAttribute("mesaAgregada", "false");
                    request.setAttribute("capacidadMesaAdd", Integer.toString(capacidad));
                    request.setAttribute("numeroMesaAdd", Integer.toString(numMesa));

                    //dispatcher
                    rd =request.getRequestDispatcher("mesas.jsp");
                    rd.forward(request, response);
                }


            }
        }else if(idMesa != 0){
            
            // recepcion de datos Editar
            int numMesaEdit         = Integer.parseInt(request.getParameter("txtNumMesaEdit"));
            int capacidadEdit       = Integer.parseInt(request.getParameter("txtCapMesaEdit"));
            String estadoStrEdit    = request.getParameter("cboEstadoEdit");
        
            //instanciar RequestDispatcher
            RequestDispatcher rd;
            
            boolean editada = false;
            
            // creacion de clase
            Mesas m  = new Mesas();
            
            m.setId_mesa(numMesaEdit);
            m.setCapacidad(capacidadEdit);
            m.setStatus_mesa(estadoStrEdit);
            
            editada = MesasDAO.editarMesa(m);
            
            if(editada==true)
            {
                // settear attributes
                request.setAttribute("editMesa" , "true");
                request.setAttribute("numMesaEdit",Integer.toString(numMesaEdit));
                request.setAttribute("capacidadMesaEdit", Integer.toString(capacidadEdit));
                request.setAttribute("estadoMesaEdit", estadoStrEdit);
                
                rd = request.getRequestDispatcher("mesas.jsp");
                rd.forward(request, response);
            }else{
                request.setAttribute("editMesa" , "false");
                request.setAttribute("numMesaEdit",Integer.toString(numMesaEdit));
                
                rd = request.getRequestDispatcher("mesas.jsp");
                rd.forward(request, response);
            }
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
