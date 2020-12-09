<%-- 
    Document   : datosReserva
    Created on : 19-nov-2020, 13:53:02
    Author     : Dr4g0n
--%>

<%@page import="services.MesasDAO"%>
<%@page import="domain.Mesas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Clientes"%>
<%@page import="domain.Reservaciones"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Datos de la Reservas</title>    
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-3.4.1.js" ></script>
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
        <script src="bootstrap/js/totem.js" ></script>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <%
        if(session.getAttribute("cargo") !="Totem") {
            response.sendRedirect("index.jsp");
        }
    %>
    
    
    <body class="backBody">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center capitalizada">
            <h4>Datos de la Reservas</h4>
        </div>
        <!-- /Titulo menu -->
        <%
            LinkedList<Reservaciones> arrDatos = (LinkedList<Reservaciones>)request.getAttribute("arrDatosReserva");
            Reservaciones r = new Reservaciones();
            Clientes c = new Clientes();
            SimpleDateFormat df = new SimpleDateFormat();
            
            for (int i = 0; i < arrDatos.size(); i++) 
            {
                c.setRut_cliente(arrDatos.get(i).getClientes().getRut_cliente());
                c.setNombres(arrDatos.get(i).getClientes().getNombres());
                c.setApellidos(arrDatos.get(i).getClientes().getApellidos());
                r.setClientes(c);
                r.setCantidad_personas(arrDatos.get(i).getCantidad_personas());
                r.setFecha_hora(arrDatos.get(i).getFecha_hora());
            }
            
            String rut = c.getRut_cliente();
            String nombre = c.getNombres();
            String apellidos = c.getApellidos();
                String fullName = nombre.concat(" ".concat(apellidos));
            int cantidad = r.getCantidad_personas();
                String cantidadSTR;
                if(cantidad == 1)
                {
                    cantidadSTR = Integer.toString(cantidad).concat(" Persona");
                }else
                {
                    cantidadSTR = Integer.toString(cantidad).concat(" Personas");
                }
            Date fechaReserva = r.getFecha_hora();
            String fechaStr = df.format(fechaReserva);
            String cortarFecha[] = fechaStr.split(" ");
            String onlyFecha = cortarFecha[0];
            String onlyHora = cortarFecha[1];

        %>
        <form action="ingresoReserva" method="POST">
            <div class="row sepBody">
            <div class="col-4"></div>
            <div class="col-6 ">
                <div class="row sepBody">
                    <div class="col-3 ">
                        <h4 class=" text-black font-weight-bold ">
                            Rut
                        </h4>
                    </div>
                    <div class="col-9">
                        <h4 class=" TextBlack ">
                            <%=rut%>
                        </h4>
                    </div>
                </div>
                <div class="row sepBody">
                    <div class="col-3 ">
                        <h4 class=" text-black font-weight-bold ">
                            Nombre
                        </h4>
                    </div>
                    <div class="col-9">
                        <h4 class=" TextBlack capitalizada">
                            <%=fullName%>
                        </h4>
                    </div>
                </div>
                <div class="row sepBody">
                    <div class="col-3 ">
                        <h4 class=" text-black font-weight-bold ">
                            Cantidad
                        </h4>
                    </div>
                    <div class="col-9">
                       <h4 class=" TextBlack ">
                            <%=cantidadSTR%>
                        </h4>
                    </div>
                </div>
                <div class="row sepBody">
                    <div class="col-3 ">
                        <h4 class=" text-black font-weight-bold ">
                            Mesa
                        </h4>
                    </div>
                    <div class="col-9">
                       <h4 class=" TextBlack ">
                             <select name="cboMesaSeleccionada"
                                    id="cboMesaSeleccionada"
                                    class="browser-default custom-select cboMesaSeleccionada capitalizada"
                                    style="width: 250px;">
                                <%
                                    ArrayList<Mesas> arrMesas = new ArrayList<Mesas>();
                                    arrMesas = MesasDAO.recuperarMesas();
                                    for (int i = 0; i < arrMesas.size(); i++) 
                                    {
                                        int numMesa = arrMesas.get(i).getId_mesa();
                                        int capacidad = arrMesas.get(i).getCapacidad();
                                        String estado = arrMesas.get(i).getStatus_mesa();
                                        String strCapacidad;
                                        if(capacidad==1)
                                        {
                                            strCapacidad = Integer.toString(capacidad).concat(" Persona");
                                        }else
                                        {
                                            strCapacidad = Integer.toString(capacidad).concat(" Personas");
                                        }
                                        
                                        if(estado.equals("RESERVADA"))
                                        {
                                %>
                                            <option value="<%=numMesa%>">Mesa <%=numMesa%> para <%=strCapacidad%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </h4>
                    </div>
                </div>
                <div class="row sepBody">
                    <div class="col-3 ">
                        <h4 class=" text-black font-weight-bold ">
                            Fecha
                        </h4>
                    </div>
                    <div class="col-9">
                       <h4 class=" TextBlack ">
                            <%=onlyFecha%>
                        </h4>
                    </div>
                </div>
                <div class="row sepBody">
                    <div class="col-3 ">
                        <h4 class=" text-black font-weight-bold ">
                            Hora
                        </h4>
                    </div>
                    <div class="col-9">
                       <h4 class=" TextBlack ">
                            <%=onlyHora%>
                        </h4>
                    </div>
                </div>
                <div class="row sepBody">
                    <div class="col-3 ">
                        
                    </div>
                    <div class="col-9">
                       <h4 class="">
                           <input name="txtNombreRes"
                                  id="txtNombreRes"
                                  class="txtNombreRes ocultar"
                                  value="<%=fullName%>">
                           <input class="btn btn-SigloBG font-weight-bold " type="submit" value="Ingresar">
                        </h4>
                    </div>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
        </form>
    </body>
</html>
