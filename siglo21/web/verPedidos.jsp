<%-- 
    Document   : verPedidos
    Created on : 04-oct-2020, 20:43:54
    Author     : Dr4g0n
--%>

<%@page import="services.PedidosDAO"%>
<%@page import="domain.Pedidos"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Pedidos</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
        
    </head>
    
    <%
        LinkedList<Pedidos> arrDatosPedidos = new LinkedList<Pedidos>();
        arrDatosPedidos = PedidosDAO.consultarPedidosActual();
       
    
    %>
    
    <body class="backBody">
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Listado de Pedidos</h4>
        </div>
        <!-- /Titulo menu -->
        
        <!--    FormVerPedidos  -->
        
            <!--    ListPedidosActivos  -->
            <div class="row sepBody">
                <div class="col-lg-2 col-md-1"></div>
                <div class="col-lg-8 col-md-10 col-sm-12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="spacePrincipalChef">
                                    Mesa
                                </th>
                               
                                <th class="text-center">
                                    Hora LLegada
                                </th>
                                <th class="text-center">
                                    Acción
                                </th>
                            </tr>
                        </thead>
                        <tbody >
                            <%
                                for (int i = 0; i < arrDatosPedidos.size(); i++) 
                                {
                                    int numMesa = arrDatosPedidos.get(i).getMesas().getId_mesa();
                                    Date fechaPedido = arrDatosPedidos.get(i).getFecha_hora_pedido();
                                    
                                    SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
                                    String fechaPedidos = df.format(fechaPedido);
                                    String cortarFecha[] = fechaPedidos.split(" ");
                                    String soloHora = cortarFecha[1];
                               
                            
                            %>
                            
                                    <tr>
                                        <td class=" spacePrincipalChef font-weight-bold">
                                            Mesa <%=numMesa%>
                                        </td>

                                        <td class="text-center font-weight-bold"> 
                                            <%=soloHora%>
                                        </td>
                                        <td class="text-center">
                                        <form action="controlVerPedidoMesa" method="POST">
                                            <input class="ocultar" name="txtIdMesaPedidos" id="txtIdMesaPedidos" value=<%=numMesa%> >
                                            <input type="submit" 
                                                   id="btnSubVerMesa"
                                                   name="btnSubVerMesa"
                                                   class="btn btn-SigloTable font-weight-bold btnSubVerMesa"
                                                   value="Ver">
                                        </form>
                                        </td>
                                    </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-2 col-md-1 sepBottom"></div>
            </div>
            <!--    /ListPedidosActivos  -->
       
        <!--    FormVerPedidos  -->

    </body>
</html>
