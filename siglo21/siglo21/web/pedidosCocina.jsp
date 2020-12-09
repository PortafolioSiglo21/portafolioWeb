<%-- 
    Document   : pedidosCocina
    Created on : 05-oct-2020, 22:25:05
    Author     : Dr4g0n
--%>

<%@page import="services.OrdenesDAO"%>
<%@page import="domain.Ordenes"%>
<%@page import="services.PedidosDAO"%>
<%@page import="domain.Pedidos"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta charset="utf-8">
        <title>Ver Pedidos</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    <%
          String estaPreparado      = (String)request.getAttribute("estaPreparado");
          String ordenPreparada     = (String)request.getAttribute("ordenPreparada");
          String errorPedidoCocina  = (String)request.getAttribute("errorPedidoCocina");
    %>
    
    <body class="backBody">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Preparacion de Pedidos</h4>
        </div>
        <!-- /Titulo menu -->
        <%
            if(estaPreparado == "true")
            {
        %>  
                <!--    alerta de Preparado true    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <a class="TextBlack">
                                        Orden ya fue preparada
                                    </a>
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                 <!--    alerta de Preparado true    -->
        <%
            }
        
            if(ordenPreparada == "true")
            {
        %>  
                <!--    alerta de OrdenPreparado true    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <a class="TextBlack">
                                       Orden fue preparada, Notificar a Garzón
                                    </a>
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                 <!--    alerta de OrdenPreparado true    -->
        <%
            }
      
            if(errorPedidoCocina == "true")
            {
        %>  
                <!--    alerta de OrdenPreparado true    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <a class="TextBlack">
                                        Ocurrió un error, <br><h4 class="text-ColBg font-weight-bold upper">orden no existía </h4>
                                    </a>
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                 <!--    alerta de OrdenPreparado true    -->
        <%
            }
        %>
        
        
        
        <%
            // consultar si la mesa cuanta cantidad tiene
            LinkedList<Ordenes> arrCantOrd= new LinkedList<Ordenes>();
            arrCantOrd = OrdenesDAO.contarOrdenes();
            
            // consultar pedidos mesa, y hora
            LinkedList<Pedidos> arrPedidos = new LinkedList<Pedidos>();
            arrPedidos = PedidosDAO.consultarPedidosActual();
            
            // consultar ordenes segun la mesa
            LinkedList<Ordenes> arrOrdenes = new LinkedList<Ordenes>();
            arrOrdenes = OrdenesDAO.pedidosActuales();


            
                
            for (int i = 0; i < arrPedidos.size(); i++) 
            {
                SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
                int idMesaPedido = arrPedidos.get(i).getMesas().getId_mesa();
                Date fechaPedido = arrPedidos.get(i).getFecha_hora_pedido();

                String cortarFecha[] = df.format(fechaPedido).split(" ");
                String soloHora = cortarFecha[1];
                
                for (int a = 0; a < arrCantOrd.size(); a++) 
                {
                    int mesa = arrCantOrd.get(a).getMesas().getId_mesa();
                    int cantidadMesa = arrCantOrd.get(a).getMesas().getCapacidad();
                
                    if(mesa==idMesaPedido && cantidadMesa != 0)
                    {
        %>
                        <!--    ListPedidosActivos1  -->
                        <div class="row sepBody">
                            <div class="col-lg-2 col-md-1"></div>
                            <div class="col-lg-8 col-md-10 col-sm-12">
                                <!--    titleIn -->
                                <div class="row">
                                    <div class="col-12 ">
                                        <label class="lblPedido">Mesa <%=idMesaPedido%></label>
                                    </div>
                                </div>
                                <!--    /titleIn -->
                                <table class="table table-striped sepBody sepBottom">
                                    <thead>
                                        <tr>
                                            <th class="spacePrincipalChef">
                                                Producto
                                            </th>

                                            <th class="text-center">
                                                Hora Pedido
                                            </th>
                                            <th class="text-center">
                                                Acción
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <%
                                            for (int e = 0; e < arrOrdenes.size(); e++) 
                                            {
                                                int idMesaOrdenes   = arrOrdenes.get(e).getMesas().getId_mesa();
                                                String nombreCarta  = arrOrdenes.get(e).getCarta().getNombre();
                                                int idOrden         = arrOrdenes.get(e).getId_orden();

                                                if(idMesaOrdenes == idMesaPedido)
                                                {
                                        %>
                                                    <tr>
                                                        <td class=" spacePrincipalChef">
                                                           <%=nombreCarta%>
                                                        </td>

                                                        <td class="text-center"> 
                                                            <%=soloHora%>
                                                        </td>
                                                        <!--    FormVerPedidos  -->
                                                        <td class="text-center">
                                                            <form action="controlCartaPreparada" method="POST">
                                                                <input name="txtCerrarOrdenPedido" id="txtCerrarOrdenPedido" value="<%=idOrden%>">
                                                                <input type="submit" 
                                                                       id="btnSubVerMesa"
                                                                       name="btnSubVerMesa"
                                                                       class="btn btn-SigloTable font-weight-bold btnSubVerMesa"
                                                                       value="Preparado">
                                                            </form>
                                                        </td>
                                                        <!--    FormVerPedidos  -->
                                                    </tr>
                                        <%
                                                }
                                            }
                                        %>

                                    </tbody>
                                </table>
                            </div>
                            <div class="col-lg-2 col-md-1 sepBottom"></div>
                        </div>
                        <!--    /ListPedidosActivos1  -->
        <%
                    }
                }
            }
            
            if(arrCantOrd.size() == 0)
            {
        %>
                <div class="row sepBodyEspecial">
                    <div class="col-12 text-center TextBlack">
                        <h3 class="capitalizada">no hay pedidos aún</h3>
                    </div>
                </div>
        <%
            }
        %>
        


    </body>
</html>
