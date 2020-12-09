<%-- 
    Document   : estadoPedidos
    Created on : 04-oct-2020, 22:18:35
    Author     : Dr4g0n
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="domain.Ordenes"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estado Pedidos</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Estado de Pedidos</h4>
        </div>
        <!-- /Titulo menu -->
        
        <%
            String numMesa = (String)request.getAttribute("numMesa");
        %>
        
        <!--    ListEstadoPedidos   -->
        <div class="row sepBody">
            <div class="col-lg-2 col-md-1"></div>
            <div class="col-lg-8 col-md-10 col-sm-12">
                <div class="col-12 font-weight-bold">
                    <h5 class="font-weight-bold text-black"> Mesa <%=numMesa%> </h5>
                </div>
                <table class="table table-striped sepBody">
                    <thead>
                        <tr>
                            <th class="spaceVerStatuChef">
                                Producto
                            </th>
                            <th class="text-center">
                                Estado Preparacion
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            LinkedList<Ordenes> arrDatosOrdenes = new LinkedList<Ordenes>();
                            arrDatosOrdenes =(LinkedList<Ordenes>)request.getAttribute("arrDatosOrdenes");
                            
                            for (int i = 0; i < arrDatosOrdenes.size(); i++)
                            {
                                String nombreCarta = arrDatosOrdenes.get(i).getCarta().getNombre();
                                String statusDBA = arrDatosOrdenes.get(i).getStatus();
                                String status;
                                if(statusDBA.equals("ATENDIDA"))
                                {
                                    status = "Sin Preparación";
                                }else{
                                    status = "Preparado";
                                }
                        %>
                                <tr>
                                    <td class="spaceVerStatuChef TextBlack font-weight-bold">
                                        <%=nombreCarta%>
                                    </td>
                            <%
                                if(statusDBA.equals("ATENDIDA"))
                                {
                                    status = "Sin Preparación";

                            %>
                                    <td class="text-center text-ColBgList font-weight-bold">
                                        <%=status%>
                                    </td>
                            <%
                                }else{
                                    status = "Preparado";
                               
                            %>
                                    <td class="text-center text-black font-weight-bold">
                                        <%=status%>
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
            <div class="col-lg-2 col-md-1 sepBottom"></div>
        </div>
        <!--    /ListEstadoPedidos   -->
        
        <!--    btnVolver   -->
        <div class="row sepBody sepBottom">
            <div class="col-12 text-center">
                <input type="button" 
                       class="btn btn-Siglo font-weight-bold"
                       onclick="window.location.href='verPedidos.jsp'"
                       value="volver">
            </div>
        </div>
        <!--    /btnVolver   -->
        
        
        
    </body>
</html>
