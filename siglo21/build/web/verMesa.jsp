<%-- 
    Document   : verMesa
    Created on : 08-dic-2020, 0:31:00
    Author     : Dr4g0n
--%>

<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="domain.Ordenes"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Mesa</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        <%
            // obtener datos de las cartas
            LinkedList<Ordenes> arrCartaVer = new LinkedList<Ordenes>();
            arrCartaVer = (LinkedList<Ordenes>)request.getAttribute("arrOrdCarta");
            
            // obtener datos de los productos;
            LinkedList<Ordenes> arrProdVer = new LinkedList<Ordenes>();
            arrProdVer = (LinkedList<Ordenes>)request.getAttribute("arrOrdProd");
            
            // numMesa
            String numMesa = (String)request.getAttribute("numMesa");
            
            int contadorCarta = 0;
            int sumarConsumo = 0;
            
            // format numbers
            DecimalFormat df = new DecimalFormat("$###,###");
        %>
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Listado Consumo Mesa <%=numMesa%></h4>
        </div>
        <!-- /Titulo menu -->
        
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <table class="table table-striped text-center">
                    <thead>
                        <tr>
                            <th scope="col">
                                #
                            </th>
                            <th scope="col">
                                Productos Consumidos
                            </th>
                            <th scope="col">
                                Precio
                            </th>
                        </tr>
                    </thead>
                    <tbody >
                        <%
                            for (int i = 0; i < arrCartaVer.size(); i++) 
                            {
                                contadorCarta = contadorCarta+1;
                                String nombreCarta = arrCartaVer.get(i).getCarta().getNombre();
                                double DprecioCarta = arrCartaVer.get(i).getCarta().getPrecio();
                                int precioCarta = (int)Math.round(DprecioCarta);
                                sumarConsumo = sumarConsumo + precioCarta;
                        %>
                                <tr>
                                    <td class="text-black"><%=contadorCarta%></td>
                                    <td class="TextBlack">
                                        <%=nombreCarta%>
                                    </td>
                                    <td>
                                        <input class="form-control txtPrecioConsumo tblViewGarzon"
                                               readonly
                                               name="txtPrecioConsumo[]"
                                               id="txtPrecioConsumo"
                                               value=<%=df.format(precioCarta)%>
                                               >
                                    </td>
                                </tr>
                        <%
                            }
                       
                            for (int j = 0; j < arrProdVer.size(); j++) 
                            {
                                contadorCarta = contadorCarta+1;
                                String nombreProd   = arrProdVer.get(j).getProductos().getNombre();
                                String descriProd   = arrProdVer.get(j).getProductos().getDescripcion();
                                double DprecioProd  = arrProdVer.get(j).getProductos().getPrecio();
                                
                                int precioProd  = (int)Math.round(DprecioProd);
                                sumarConsumo = sumarConsumo + precioProd;
                        %>
                                <tr>
                                    <td class="text-black"><%=contadorCarta%></td>
                                    <td class="TextBlack">
                                        <%=nombreProd%> <%=descriProd%>
                                    </td>
                                    <td>
                                        <input class="form-control txtPrecioConsumo tblViewGarzon"
                                               readonly
                                               name="txtPrecioConsumo[]"
                                               id="txtPrecioConsumo"
                                               value=<%=df.format(precioProd)%>
                                               >
                                    </td>
                                </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="col-2"></div>
        </div>
        
        <!-- campos de valores -->
        <div class="row sepBody">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="row sepBody">
                    <div class="col-4">
                        <h4 class="text-black">Total consumo</h4>
                    </div>
                    <div class="col-7">
                        <h4 class="text-black"><%=df.format(sumarConsumo)%></h4>
                    </div>
                </div>
                <div class="row sepBody">
                    <div class="col-12 text-center">
                        <form action="pagarMesa" method="POST">
                            <input class="ocultar txtIdMesaPagar" name="txtIdMesaPagar" id="txtIdMesaPagar" value="<%=numMesa%>">
                            <input class="ocultar txtValorPago" name="txtValorPago" id="txtValorPago" value="<%=sumarConsumo%>">
                            <input type="submit" 
                                id="btnPagarCuenta"
                                name="btnPagarCuenta"
                                class="btn btn-SigloTable font-weight-bold btnPagarCuenta"
                                value="Pagar Cuenta">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-3"></div>
        </div>
        <!-- /campos de valores -->
        
    </body>
</html>
