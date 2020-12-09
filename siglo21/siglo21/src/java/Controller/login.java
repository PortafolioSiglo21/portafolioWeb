/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import domain.Administrador;
import domain.Cargos;
import domain.Empleados;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.EmpleadosDAO;

/**
 *
 * @author Dr4g0n
 */
public class login extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
         
            
        HttpSession session = request.getSession();
         
        String userWeb = request.getParameter("txtUser");
        String passWeb = request.getParameter("txtPass");
        
        EmpleadosDAO empDao = new EmpleadosDAO();
        
        try {
            RequestDispatcher rd;
            String url;
            boolean existeInfo= empDao.existeInfo(userWeb, passWeb);
            
            if(existeInfo == false)
            {
                session.setAttribute("cargo", "");
                session.setAttribute("Acceso", "false");
                url = "login.jsp";
                rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }else if(existeInfo == true)
            {
                LinkedList<Empleados> empleado = empDao.recuperarUserPassName(userWeb.toLowerCase(), passWeb);
            
                Empleados e = new Empleados();
                Cargos c = new Cargos();
                Administrador a = new Administrador();

                for (int i = 0; i < empleado.size(); i++) {
                    String nombresDBA   = empleado.get(i).getNombres();
                    String apellidosDBA = empleado.get(i).getApellidos();
                    String cargoDBA     = empleado.get(i).getCargos().getCargo();
                    int idCargoDBA      = empleado.get(i).getCargos().getId_cargo();
                    String estadoDBA    = empleado.get(i).getStatus_empleado();
                    int idAdminDBA      = empleado.get(i).getId_empleado();

                    String usuarioDBA = empleado.get(i).getUsuario();
                    String passwordDBA = empleado.get(i).getUsuario();

                    e.setNombres(nombresDBA);
                    e.setApellidos(apellidosDBA);
                    c.setCargo(cargoDBA);
                    c.setId_cargo(idCargoDBA);
                    e.setCargos(c);
                    e.setStatus_empleado(estadoDBA);
                    a.setId_admin(Integer.toString(idAdminDBA));
                    e.setUsuario(usuarioDBA);
                    e.setPassword(passwordDBA);
                    

                }

                String nombres = e.getNombres();
                String apellidos = e.getApellidos();
                String cargo = e.getCargos().getCargo();
                int idCargo = e.getCargos().getId_cargo();
                String estado = e.getStatus_empleado();
                String idAdmin = a.getId_admin();

                String user = e.getUsuario();
                String pass = e.getPassword();

                String idAdminSTR = idAdmin;
                String idCargoSTR = Integer.toString(idCargo);

                String Nombre[] = nombres.split(" ");
                String Apellido[] = apellidos.split(" ");

                String primerNombre = Nombre[0];
                String primerApellido = Apellido[0];

                String nomFinal = primerNombre.concat(" ".concat(primerApellido));

                String newCargo = "";
            
                    if(empleado != null || !empleado.isEmpty() )
                    {

                        if(cargo.equals("ADMINISTRADOR"))
                        {
                            if(estado.equals("ACTIVO"))
                            {
                                 session.setAttribute("cargo", "Administrador");
                                // session.setAttribute("cargo", cargo.toString().toUpperCase());
                                session.setAttribute("idCargo", idCargoSTR);
                                session.setAttribute("Acceso", "true");
                                session.setAttribute("Nombre", nomFinal);
                                session.setAttribute("idAdmin", idAdminSTR);
                               
                                session.setAttribute("estadoEmp", estado);
                                url = "index.jsp";
                                 //response.sendRedirect(url);;
                                rd = request.getRequestDispatcher(url);
                                rd.forward(request, response);
                            }else
                            {
                                session.setAttribute("cargo", "");
                                session.setAttribute("Acceso", "false");
                                 url = "login.jsp";
                                 //response.sendRedirect(url);;
                                rd = request.getRequestDispatcher(url);
                                rd.forward(request, response);
                            }
                        }else if(cargo.equals("FINANZA") )
                        {
                            session.setAttribute("cargo", "");
                            session.setAttribute("Acceso", "false");
                            url = "login.jsp";
                            rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                        }else if(cargo.equals("CHEF"))
                        {
                            if(estado.equals("ACTIVO"))
                            {
                                session.setAttribute("cargo", "Chef");
                                // session.setAttribute("cargo", cargo.toString().toUpperCase());
                                session.setAttribute("idCargo", idCargoSTR);
                                session.setAttribute("Acceso", "true");
                                session.setAttribute("Nombre", nomFinal);
                                session.setAttribute("idAdmin", idAdminSTR);
                                session.setAttribute("estadoEmp", estado);
                                url = "index.jsp";
                                 //response.sendRedirect(url);;
                                rd = request.getRequestDispatcher(url);
                                rd.forward(request, response);
                            }else{
                                session.setAttribute("cargo", "");
                                session.setAttribute("Acceso", "false");
                                url = "login.jsp";
                                 //response.sendRedirect(url);;
                                rd = request.getRequestDispatcher(url);
                                rd.forward(request, response);
                            }
                        }else if(cargo.equals("COCINERO") )
                        {
                            
                            session.setAttribute("cargo", "Cocinero");
                            // session.setAttribute("cargo", cargo.toString().toUpperCase());
                            session.setAttribute("idCargo", idCargoSTR);
                            session.setAttribute("Acceso", "true");
                            session.setAttribute("Nombre", nomFinal);
                            session.setAttribute("idAdmin", idAdminSTR);
                            session.setAttribute("estadoEmp", estado);
                            url = "index.jsp";
                             //response.sendRedirect(url);;
                            rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                        }else if(cargo.equals("GARZON"))
                        {
                            if(estado.equals("ACTIVO"))
                            {
                                session.setAttribute("cargo", "Garzon");
                                // session.setAttribute("cargo", cargo.toString().toUpperCase());
                                session.setAttribute("idCargo", idCargoSTR);
                                session.setAttribute("Acceso", "true");
                                session.setAttribute("Nombre", nomFinal);
                                session.setAttribute("idAdmin", idAdminSTR);
                                session.setAttribute("estadoEmp", estado);
                                url = "index.jsp";
                                 //response.sendRedirect(url);;
                                rd = request.getRequestDispatcher(url);
                                rd.forward(request, response);
                            }else
                            {
                                session.setAttribute("Acceso", "false");
                                url = "login.jsp";
                                rd = request.getRequestDispatcher(url);
                                rd.forward(request, response);
                            }
                        }else if(cargo.equals("TOTEM"))
                        {
                            if(estado.equals("ACTIVO"))
                            {
                                session.setAttribute("cargo", "Totem");
                                // session.setAttribute("cargo", cargo.toString().toUpperCase());
                                session.setAttribute("idCargo", idCargoSTR);
                                session.setAttribute("Acceso", "true");
                                session.setAttribute("Nombre", nomFinal);
                                session.setAttribute("idAdmin", idAdminSTR);
                                session.setAttribute("estadoEmp", estado);
                                url = "index.jsp";
                                 //response.sendRedirect(url);;
                                rd = request.getRequestDispatcher(url);
                                rd.forward(request, response);
                            }else
                            {
                                session.setAttribute("Acceso", "false");
                                url = "login.jsp";
                                rd = request.getRequestDispatcher(url);
                                rd.forward(request, response);
                            }
                        }else if(cargo.equals("BODEGUERO"))
                        {
                            session.setAttribute("cargo", "");
                            session.setAttribute("Acceso", "false");
                            url = "login.jsp";
                            rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                        }
                        else
                        {
                            session.setAttribute("Acceso", "false");
                            url = "login.jsp";
                            rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                        }
                          
                    }else 
                    {
                        session.setAttribute("cargo", "");
                        session.setAttribute("Acceso", "false");
                        url = "login.jsp";
                        rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);
                    }    
                
            }
            
            
            
           
            
        } catch (Exception e) {
            e.printStackTrace();
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
        
        
           /*
        HttpSession session = request.getSession();
         
        String userWeb = request.getParameter("txtUser");
        String passWeb = request.getParameter("txtPass");
        
        EmpleadosDAO empDao = new EmpleadosDAO();
        
        try {
            RequestDispatcher rd;
            String url;
            
            Empleados empleado = empDao.recuperarUserPassName(userWeb, passWeb);
            
            String nombres = empleado.getNombres();
            String apellidos = empleado.getApellidos();
            String cargo = empleado.getCargos().getCargo();
            int idCargo = empleado.getCargos().getId_cargo();
            String estado = empleado.getStatus_empleado();
            int idAdmin = empleado.getId_empleado();
            
            String idAdminSTR = Integer.toString(idAdmin);
            String idCargoSTR = Integer.toString(idCargo);
            
            String Nombre[] = nombres.split(" ");
            String Apellido[] = apellidos.split(" ");
            
            String primerNombre = Nombre[0];
            String primerApellido = Apellido[0];
            
            String nomFinal = primerNombre.concat(" ".concat(primerApellido));
            
            String newCargo = "";
            
            
               
            
            if(empleado != null )
            {
                    if(cargo.equals("ADMINISTRADOR"))
                    {
                        session.setAttribute("cargo", "Administrador");
                    }else if(cargo.equals("FINANZA"))
                    {
                        session.setAttribute("cargo", "Finanza");
                    }else if(cargo.equals("CHEF"))
                    {
                        session.setAttribute("cargo", "Chef");
                    }else if(cargo.equals("COCINERO"))
                    {
                        session.setAttribute("cargo", "Cocinero");
                    }else if(cargo.equals("GARZON"))
                    {
                        session.setAttribute("cargo", "Garzon");
                    }else if(cargo.equals("BODEGUERO"))
                    {
                        session.setAttribute("cargo", "Bodeguero");
                    }
                   // session.setAttribute("cargo", cargo.toString().toUpperCase());
                    session.setAttribute("idCargo", idCargoSTR);
                    session.setAttribute("Acceso", "true");
                    session.setAttribute("Nombre", nomFinal);
                    session.setAttribute("idAdmin", idAdminSTR);
                    session.setAttribute("estadoEmp", estado);
                    url = "index.jsp";
                     //response.sendRedirect(url);;
                    //rd = request.getRequestDispatcher(url);
                   // rd.forward(request, response);
                   // response.sendRedirect(url);
               
            }else{
                session.setAttribute("Acceso", "false");
                url = "login.jsp";
                //rd = request.getRequestDispatcher(url);
               // rd.forward(request, response);
            }
           
            rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            response.sendRedirect(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
            */
        
        
        
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
