<%-- 
    Document   : reservasDelDia
    Created on : 11-nov-2020, 13:33:59
    Author     : Dr4g0n
--%>

<%@page import="services.ReservacionesDAO"%>
<%@page import="domain.Reservaciones"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservas del día</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Reservas del día</h4>
        </div>
        <!-- /Titulo menu -->
        
        <%
            LinkedList<Reservaciones> arrReserva = new LinkedList<Reservaciones>();
            arrReserva = ReservacionesDAO.listadoReservasDelDia();
            int contador = 0;
            if(arrReserva == null || arrReserva.isEmpty())
            {
        %>
                <div class="row sepBody">
                    <div class="col-12 text-center">
                        <h3 class="font-weight-bold capitalizada TextBlack">
                            no hay reservas para hoy
                        </h3>
                    </div>
                </div>
        <%
            }else{

            String generado = (String)request.getAttribute("pdfGenerado");
            if(generado == "true")
            {
        %>
                <!--    alerta de Registro Editado true   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack let">Se generó exitosamente el archivo pdf </h3>
                            </strong> 
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
                <!--    /alerta de Registro Editado true   -->
        <%
            }
        %>
            <div class="row sepBody">
            <div class="col-lg-2 col-md-1"></div>
            <div class="col-lg-8 col-md-10 col-sm-12">
                <div class="row">
                    <div class="col-12">
                        <table class="table table-striped text-center capitalizada">
                            <thead>
                                <tr>
                                     <th>#</th>
                                    <th>Rut Cliente</th>
                                    <th>Nombre</th>
                                    <th>Teléfono</th>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>N° personas</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int i = 0; i < arrReserva.size(); i++) 
                                    {        
                                        contador= contador+1;
                                        String rutCli   = arrReserva.get(i).getClientes().getRut_cliente();
                                        String nombres  = arrReserva.get(i).getClientes().getNombres();
                                        String Apellidos= arrReserva.get(i).getClientes().getApellidos();
                                        String telefono = arrReserva.get(i).getClientes().getTelefono();
                                        Date fechaHora  = arrReserva.get(i).getFecha_hora();
                                        int cantidad    = arrReserva.get(i).getCantidad_personas();
                                        
                                        // conversion de datos
                                        String nombre[]     = nombres.split(" ");
                                        String apellido[]   = Apellidos.split(" ");
                                        String nomApe       = nombre[0] +" "+apellido[0];
                                        SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
                                        String fechas       = df.format(fechaHora);
                                        String cortaFecha[] = fechas.split(" ");
                                        String soloFecha    = cortaFecha[0];
                                        String soloHora     = cortaFecha[1];
                                %>
                                    <tr>
                                        <th><%=contador%></th>
                                        <td>
                                            <a><%=rutCli%></a>
                                        </td>
                                        <td>
                                            <a><%=nomApe%></a>
                                        </td>
                                        <td>
                                            <a href="tel:<%=telefono%>" style="color: #000;"><%=telefono%></a>
                                        </td>
                                        <td>
                                            <a><%=soloFecha%></a>
                                        </td>
                                        <td>
                                            <a><%=soloHora%></a>
                                        </td>
                                        <td>
                                            <a><%=cantidad%></a>
                                        </td>
                                    </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-1"></div>
        </div>
        <div class="row sepBody">
            <div class="col-4"></div>
            <div class="col-4">
                <div class="row">
                    <div class="col-12 text-center">
                        <form action="rptReservasDia" method="POST">
                            <input type="submit" 
                                   class="btn btn-Siglo font-weight-bold sepBut btnGenerarReservaDia" 
                                   name="btnGenerarReservaDia" 
                                   id="btnGenerarReservaDia" 
                                   value="Generar PDF">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-4"></div>
        </div>
        <%
            }
        %>
        
    </body>
</html>
