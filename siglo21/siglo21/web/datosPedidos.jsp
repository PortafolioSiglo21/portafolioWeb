<%-- 
    Document   : datosPedidos
    Created on : 11-nov-2020, 14:50:16
    Author     : Dr4g0n
--%>

<%@page import="domain.PedidoProveedor"%>
<%@page import="domain.Proveedores"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Pedidos Proveedor</title>
         <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    <%
        if(session.getAttribute("cargo") != "Administrador")
        {
            response.sendRedirect("index.jsp");
        }
    %>
    
    <body class="backBody" style="overflow-x: hidden;">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Datos de pedido</h4>
        </div>
        <!-- /Titulo menu -->
        <%
            LinkedList<PedidoProveedor> arrPedido = new LinkedList<PedidoProveedor>();
            arrPedido = (LinkedList < PedidoProveedor > )request.getAttribute("arrPedido");
           
            
            LinkedList<Proveedores> arrProveedor = new LinkedList<Proveedores>();
            arrProveedor = (LinkedList<Proveedores>)request.getAttribute("arrProveedor");
            Proveedores pr = new Proveedores();
            PedidoProveedor p = new PedidoProveedor();
            
            int contador = 0;
            for (int a = 0; a < arrPedido.size(); a++) {
                p.setId_pedido(arrPedido.get(a).getId_pedido());
            }
            
            for (int i = 0; i < arrProveedor.size(); i++) {
                pr.setProveedor(arrProveedor.get(i).getProveedor());
                pr.setEmail_proveedor(arrProveedor.get(i).getEmail_proveedor());
                pr.setRut_proveeedor(arrProveedor.get(i).getRut_proveeedor());
                pr.setNombre_contacto(arrProveedor.get(i).getNombre_contacto());
                pr.setTelefono(arrProveedor.get(i).getTelefono());
            }
            
            String rutPro   = pr.getRut_proveeedor();
            String nomPro   = pr.getProveedor();
            String nomCon   = pr.getNombre_contacto();
            String emailPro = pr.getEmail_proveedor();
            String fonoCon  = pr.getTelefono();
            int idPedidoPro = p.getId_pedido();
        %>
        
        <div class="row sepBody">
            <div class="col-lg-2 col-md-1 col-sm-12"></div>
            <div class="col-lg-8 col-md-10 col-sm-12">
                <!-- datos del proveedor -->
                <div class="row">
                    <div class="col-12">                       
                        <table>
                            <tr >
                                <td class="text-black" style="width:150px;">Rut Proveedor</td>
                                <td class="text-ColBg font-weight-bold">
                                    <a class="capitalizada"><%=rutPro%></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-black"  style="width:150px;">Nombre Proveedor</td>
                                <td class="text-ColBg font-weight-bold">
                                    <a class="capitalizada"><%=nomPro%></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-black"  style="width:150px;">Nombre Contacto</td>
                                <td class="text-ColBg font-weight-bold">
                                    <a class="capitalizada"><%=nomCon%></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-black"  style="width:150px;">Email Contacto</td>
                                <td class="text-ColBg font-weight-bold ">
                                    <a class="lower"><%=emailPro%></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-black"  style="width:150px;">Teléfono Contacto</td>
                                <td class="text-ColBg font-weight-bold"><a href="tel:<%=fonoCon%>"><%=fonoCon%></a></td>
                            </tr>
                            <tr>
                                <td class="text-black"  style="width:150px;">Id pedido</td>
                                <td class="text-ColBg font-weight-bold"><a><%=idPedidoPro%></a></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- /datos del proveedor -->
                
                <!-- datos productos -->
                <div class="row sepBody">
                    <div class="col-12">
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Fecha solicitud</th>
                                    <th>Producto</th>
                                    <th>Descripción</th>
                                    <th>Cantidad</th>
                                </tr>
                            </thead>
                            <tbody  class="font-weight-bold">
                                <%
                                    for (int e = 0; e < arrPedido.size(); e++) {
                                        contador = contador+1;
                                        Date fechaSolicitudBD = arrPedido.get(e).getFecha_solicitud();
                                        String producto =   arrPedido.get(e).getProducto();
                                        String descripcion = arrPedido.get(e).getDescripcion();
                                        int cantidad    =   arrPedido.get(e).getCantidad();
                                        SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
                                        String fechaSolicitud = df.format(fechaSolicitudBD);
                                %>  
                                    <tr>
                                        <td class="text-black"><%=contador%></td>
                                        <td><%=fechaSolicitud%></td>
                                        <td><%=producto%></td>
                                        <%
                                            if(descripcion == null )
                                            {
                                        %>
                                                <td class="text-ColBg">sin descripción</td>
                                        <%
                                            }else
                                            {
                                        %>
                                            <td><%=descripcion%></td>
                                        <%
                                            }
                                        %>
                                        <td><%=cantidad%></td>
                                    </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- datos productos -->
                
                <!--    BtnSend  -->
                    <div class="row sepBody text-center">                            
                        <div class="col-3"></div>
                        <div class="col-3">
                            <div class="form-group form-check text-center">
                                <a class="btn btn-SigloVerde font-weight-bold sepBut" href="insumos.jsp" role="button">Volver</a>    
                            </div>
                        </div>                            
                        <div class="col-3">
                            <div class="form-group form-check text-center">
                                <form action="rptSendPedidoProvedor" method="POST">
                                    <input class="txtIdPedidoEnviar" name="txtIdPedidoEnviar" id="txtIdPedidoEnviar" type="text" value="<%=idPedidoPro%>" readonly>
                                    <input class="btn btn-Siglo font-weight-bold sepBut" type="submit" value="Enviar Pedido">
                                </form>
                            </div>
                        </div>                            
                        <div class="col-3"></div>
                    </div>
                <!--    /BtnSend  -->
                
            </div>
            <div class="col-lg-2 col-md-1 col-sm-12"></div>
        </div>
        
        
    </body>
</html>
