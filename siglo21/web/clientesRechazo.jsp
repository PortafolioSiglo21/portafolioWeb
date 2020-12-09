<%-- 
    Document   : clientesRechazo
    Created on : 14-nov-2020, 20:52:03
    Author     : Dr4g0n
--%>

<%@page import="services.ClientesDAO"%>
<%@page import="domain.Clientes"%>
<%@page import="services.ReservacionesDAO"%>
<%@page import="domain.Reservaciones"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Clientes Rechazo</title>
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-3.4.1.js" ></script>
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
         <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody"  style="overflow-x: hidden;">
       
        
        <!-- Titulo menu -->
        <div class="col-12 titlePageCarta text-center">
            <h4 class="font-weight-bold">Reporte de Clientes </h4>
            <h4 >Cancelaciones y Rechazos </h4>
        </div>
        <!-- /Titulo menu -->
        <%
            String pdfRechazo = (String)request.getAttribute("pdfRechazosGenerado");
            String pdfCancelados = (String)request.getAttribute("pdfCancelacionesGenerado");
            String clienteRechazo = (String)request.getAttribute("rutClienteRechazado");
            String rutClienteRechazo = (String)request.getAttribute("rutClienteRechazado");
        
            if(clienteRechazo == "true")
            {
        %>
                 <!--    alerta de Registro Editado true   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack let">Cliente Rut:<%=rutClienteRechazo%> fue rechazado con éxito </h3>
                            </strong> 
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
                <!--    /alerta de Registro Editado true   -->
        <%
            }else if(clienteRechazo == "false"){
        %>
                 <!--    alerta de Registro Editado true   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-danger text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack let">Ocurrio un problema</h3>
                            </strong> 
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
                <!--    /alerta de Registro Editado true   -->
        <%
            }

            if(pdfRechazo == "true")
            {
        %>
                 <!--    alerta de Registro Editado true   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack let">Se generó exitosamente el reporte pdf de clientes rechazados  </h3>
                            </strong> 
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
                <!--    /alerta de Registro Editado true   -->
        <%
            }
            
            if(pdfCancelados == "true")
            {
        %>     
                 <!--    alerta de Registro Editado true   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack let">Se generó exitosamente el reporte pdf de reservas canceladas </h3>
                            </strong> 
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
                <!--    /alerta de Registro Editado true   -->
        <%
            }
        %>
                
                
                
        <%
            int contador = 0;
            LinkedList<Reservaciones> arrCanRes = new LinkedList<Reservaciones>();
            arrCanRes = ReservacionesDAO.listaCantidadCancelacionXCli();
            
            if(arrCanRes == null || arrCanRes.isEmpty())
            {
        %>
                <div class="row sepBody">
                    <div class="col-12 text-center">
                        <h3 class="text-black font-weight-bold let sepBottom">
                            no hay clientes con reservas canceladas.
                        </h3>
                    </div>
                </div>
        <%
            }else{
        %>
                <!-- listado cancelados -->
                <div class="row sepBody">
                    <div class="col-12 let text-center font-weight-bold">
                        <h5 class="text-black capitalizada">
                            cancelaciones
                        </h5>
                    </div>
                    <div class="col-12">
                        <div class="row ">
                            <div class="col-12 capitalizada">
                                <div class="row ">
                                    <div class="col-lg-2 col-md-1 col-sm-12"></div>
                                    <div class="col-lg-8 col-md-10 col-sm-12">
                                        <table class="table table-striped text-center">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Rut</th>
                                                    <th>Nombre</th>
                                                    <th>Cantidad</th>
                                                    <th>Acción</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < arrCanRes.size(); i++) 
                                                    {
                                                        contador = contador + 1;
                                                        int cantidad = arrCanRes.get(i).getCantidad_personas();
                                                        String rut = arrCanRes.get(i).getClientes().getRut_cliente();
                                                        String nombres = arrCanRes.get(i).getClientes().getNombres();
                                                        String apellidos = arrCanRes.get(i).getClientes().getApellidos();
                                                        String cutName[] = nombres.split(" ");
                                                        String nombreCli = cutName[0].concat(" ".concat(apellidos));
                                                        
                                                        String estado = arrCanRes.get(i).getClientes().getEstado();
                                                        
                                                        
                                                        if(estado.equals("RECHAZADO"))
                                                        {
                                                            out.println("<tr class=table-danger>");
                                                        }
                                                        else
                                                        {
                                                            out.println("<tr>");
                                                        }
                                                        
                                                %>
                                                        <th class="TextBlack"><%=contador%></th>
                                                        <td><%=rut%></td>
                                                        <td><%=nombreCli%></td>
                                                        <td><%=cantidad%></td>

                                                        <%
                                                            if(estado.equals("ACTIVO"))
                                                            {
                                                        %>
                                                        <form action="controlRechazarCliente" method="POST">
                                                            <td>
                                                                <input  class="txtRutCliRech"
                                                                        type="hidden"
                                                                        id="txtRutCliRech"
                                                                        name="txtRutCliRech"
                                                                        value=<%=rut%> readonly>
                                                                <input class="btn btn-edit btnEditar" 
                                                                       type="submit" 
                                                                       name="btnEditar"
                                                                       id="btnEditar"
                                                                       value="Rechazar">
                                                            </td>
                                                        </form>
                                                         <%
                                                            }else
                                                            {
                                                        %>
                                                        <td>
                                                            <a class="text-black">RECHAZADO</a>
                                                        </td>
                                                        <%
                                                            }
                                                        %>
                                                    </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-lg-2 col-md-1 col-sm-12"></div>
                                </div>
                            </div>
                        </div>
                       <div class="row sepBody">
                            <div class="col-4"></div>
                            <div class="col-4">
                                <div class="row">
                                    <div class="col-12 text-center">
                                        <form action="rptCancelacionesReservas" method="POST">
                                            <input type="submit" 
                                                   class="btn btn-Siglo font-weight-bold sepBut btnRptCancelaciones sepBottom" 
                                                   value="Generar PDF Cancelaciones">
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4"></div>
                        </div>             
                    </div>
                </div>
                <!-- /listado cancelados -->
        <%
            }

            int contadorRec = 0;
            LinkedList<Clientes> arrCliRec = new LinkedList<Clientes>();
            arrCliRec = ClientesDAO.listaRechazosCli();
            
            if(arrCliRec == null || arrCliRec.isEmpty())
            {
        %>
                 <div class="row sepBody">
                    <div class="col-12 text-center">
                        <h3 class="text-black font-weight-bold let sepBottom">
                            no hay clientes rechazados.
                        </h3>
                    </div>
                </div>
        <%
            }else{
        %>
                <!-- listado Rechazados -->
                <div class="row ">
                    <div class="col-12 let text-center font-weight-bold">
                        <h5 class="text-black capitalizada ">
                            Rechazados
                        </h5>
                    </div>
                    <div class="col-12">
                        <div class="row ">
                            <div class="col-12 capitalizada">
                                <div class="row ">
                                    <div class="col-lg-2 col-md-1 col-sm-12"></div>
                                    <div class="col-lg-8 col-md-10 col-sm-12">
                                        <table class="table table-striped text-center">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Rut</th>
                                                    <th>Nombre</th>
                                                    <th>Teléfono</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < arrCliRec.size(); i++) 
                                                    {
                                                        contadorRec = contadorRec + 1;
                                                        String rut = arrCliRec.get(i).getRut_cliente();
                                                        String nombres = arrCliRec.get(i).getNombres();
                                                        String apellidos = arrCliRec.get(i).getApellidos();
                                                        String telefono = arrCliRec.get(i).getTelefono();
                                                        String cutName[] = nombres.split(" ");
                                                        String nombreCli = cutName[0].concat(" ".concat(apellidos));

                                                %>
                                                <tr>
                                                    <th class="TextBlack"><%=contadorRec%></th>
                                                    <td><%=rut%></td>
                                                    <td><%=nombreCli%></td>
                                                    <td>
                                                        <a href="tel:<%=telefono%>"><%=telefono%></a>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-lg-2 col-md-1 col-sm-12"></div>
                                </div>
                            </div>
                        </div>
                       <div class="row sepBody">
                            <div class="col-4"></div>
                            <div class="col-4">
                                <div class="row">
                                    <div class="col-12 text-center">
                                        <form action="rptRechazados" method="POST">
                                            <input type="submit" 
                                                   class="btn btn-Siglo font-weight-bold sepBut btnRptCancelaciones sepBottom" 
                                                   value="Generar PDF Rechazados">
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4"></div>
                        </div>             
                    </div>
                </div>
                <!-- /listado Rechazados -->
        <%
            }
        %>
        
        
    </body>
</html>
