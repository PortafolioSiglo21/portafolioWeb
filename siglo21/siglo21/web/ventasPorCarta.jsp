<%-- 
    Document   : ventasPorCarta
    Created on : 16-nov-2020, 20:22:54
    Author     : Dr4g0n
--%>

<%@page import="services.OrdenesDAO"%>
<%@page import="domain.Ordenes"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Ventas Segun Cartas</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
     <body class="backBody" style="overflow-x: hidden;">
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Reporte Ventas Segun Cartas</h4>
        </div>
        <!-- /Titulo menu -->
        
        <%
            LinkedList<Ordenes> arrDatos = new LinkedList<Ordenes>();
            arrDatos = OrdenesDAO.contarVentasPorCarta();
            int contador = 0;
            String pdfGenerado = (String)request.getAttribute("pdfVentasGenerado");
            
            if(arrDatos != null || !arrDatos.isEmpty())
            {
        %>
        
                <%
                    if(pdfGenerado == "true")
                    {
                %>
                         <!--    alerta de Registro Editado true   -->
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-8">
                                <div class="alert alert-success text-center sepBottom " role="alert">
                                    <strong>
                                        <h3 class="TextBlack let">Se generó exitosamente el reporte pdf de Ventas por Cartas</h3>
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
                <table class="table table-striped text-center">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre Carta</th>
                            <th>Cantidad Vendidas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < arrDatos.size(); i++) 
                            {
                                String nombreCarta = arrDatos.get(i).getCarta().getNombre();
                                int cantidades = arrDatos.get(i).getCarta().getId_carta();
                                contador = contador+1;    
                        %>
                                <tr>
                                    <th class="text-black"><%=contador%></th>
                                    <td>
                                        <a><%=nombreCarta%></a>
                                    </td>
                                    <td>
                                        <a><%=cantidades%></a>
                                    </td>
                                </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-2 col-md-1"></div>
        </div>
        <div class="row sepBody">
            <div class="col-4"></div>
            <div class="col-4">
                <div class="row">
                    <div class="col-12 text-center">
                        <form action="rptVentasPorCartas" method="POST">
                            <input type="submit" 
                                   class="btn btn-Siglo font-weight-bold sepBut btnGenerarRptVentasCartas" 
                                   name="btnGenerarRptVentasCartas" 
                                   id="btnGenerarRptVentasCartas" 
                                   value="Generar PDF Ventas según Cartas">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-4"></div>
        </div>
        
        <%
            }else{
        %>
                <div class="row sepBody">
                    <div class="col-12 text-center">
                        <h3 class="text-black let">no cuenta con registros de ventas</h3>
                    </div>
                </div>
        <%
            }
        %>
        
    </body>
</html>




