<%-- 
    Document   : insumos
    Created on : 09-nov-2020, 22:21:46
    Author     : Dr4g0n
--%>

<%@page import="domain.PedidoProveedor"%>
<%@page import="domain.Proveedores"%>
<%@page import="services.PedidoProveedorDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insumos</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody" style="overflow-x: hidden;">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Insumos</h4>
            <h5 class="text-ColBg ">solicitud a proveedores</h5>
        </div>
        <!-- /Titulo menu -->
        <%
            String pedidoEnviado = (String)request.getAttribute("pdfEnviado");
            
            if(pedidoEnviado == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack">PDF de Pedido fue enviado con éxito vía email</h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
        <%
            }
            
            if(pedidoEnviado == "false")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack">El pedido ya había sido enviado al proveedor,<br> no puede volver a enviarse</h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
         <%
            }
        %>
        
        <%
            LinkedList<PedidoProveedor> arrPedidos = new LinkedList<PedidoProveedor>();
            arrPedidos = PedidoProveedorDAO.pedidosSolicitados();

            request.setAttribute("arrPedidos", arrPedidos);
            int contador = 0;
            PedidoProveedor p = new PedidoProveedor();
            Proveedores pr = new Proveedores();
            
            if(arrPedidos == null || arrPedidos.isEmpty())
            {
        %>
                 <div class="row sepBodyEspecial">
                    <div class="col-2"></div>
                    <div class="col-8 text-center">
                        <h3 class="capitalizada TextBlack">no existen pedidos por aprobar</h3>
                    </div>
                    <div class="col-2"></div>
                </div>
        <%
            }else{
        %>
                <div class="row sepBody">
                    <div class="col-2"></div>
                    <div class="col-8 text-center sepBody">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Fecha Solicitud</th>
                                    <th scope="col">Cantidad Productos</th>
                                    <th scope="col">Nombre Proveedor</th>
                                    <th scope="col">Número Solicitud</th>
                                    <th scope="col">Acción</th>
                                </tr>
                            </thead>
                            <%
                                for (int i = 0; i < arrPedidos.size(); i++) 
                                {
                                    contador = contador+1;
                                    Date fechaBD    = arrPedidos.get(i).getFecha_solicitud();
                                    int cantidad    = arrPedidos.get(i).getCantidad();
                                    String nombre   = arrPedidos.get(i).getProveedores().getProveedor();
                                    int id          = arrPedidos.get(i).getId_pedido();
                                    SimpleDateFormat df     = new SimpleDateFormat("dd-MMM-yyyy");
                                    String fecha = df.format(fechaBD);
                                    
                            %>
                                    <tr>
                                        <td class="text-black"><%=contador%></td>
                                        <td><%=fecha%></td>
                                        <td><%=cantidad%></td>
                                        <td><%=nombre%></td>
                                        <td><%=id%></td>
                                    <form action="controlListarPedidoProveedor" method="POST">
                                        <td>
                                            <input type="text" name="txtIdPedido" id="txtIdPedido" class="form-control txtIdPedido ocultar" value="<%=id%>" readonly>
                                            <input type="submit" class="btn btn-edit btnEditar btnVerPedido" value="ver pedido">
                                        </td>
                                    </form>
                                    </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                    <div class="col-2"></div>
                </div>
        <%
            }
        %>
        
    </body>
</html>
