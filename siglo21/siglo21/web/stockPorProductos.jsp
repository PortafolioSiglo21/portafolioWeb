<%-- 
    Document   : StockPorProductos
    Created on : 25-sep-2020, 17:57:32
    Author     : Dr4g0n
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="domain.Productos"%>
<%@page import="java.util.LinkedList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="services.CategoriaDAO"%>
<%@page import="domain.Categorias"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock por Productos</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody" style="overflow-x: hidden;">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center font-weight-bold">
            <h4>Inventario Tipo Productos</h4>
        </div>
        <!-- /Titulo menu -->
        <%
            LinkedList<Categorias> arrCategorias = new LinkedList<Categorias>();
            arrCategorias = CategoriaDAO.traerCategorias();
            request.setAttribute("arrCategorias", arrCategorias);
            String existeProductos = (String)request.getAttribute("existeStockCat");
        %>
        
        <!-- CatProd -->
        <form action="controlListarStockProductos" method="POST">
            <div class="row sepBody ">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="row sepBody">
                        <div class="col-lg-3 col-md-3 col-sm-12 centerTextName ">
                            Tipo Producto
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-12 ">
                            <select class="browser-default custom-select capitalizada cboTipoProdCat" name="cboTipoProdCat" id="cboTipoProdCat">
                                <c:forEach var="listCat" items="${requestScope.arrCategorias}">
                                    <option value="${listCat.id_categoria}">${listCat.categoria}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <input class="btn btn-Siglo  font-weight-bold sepBottom" type="submit" value="Buscar">
                        </div>
                    </div>
                </div>
                <div class="col-2 sepBottom"></div>
            </div>
        </form>
        <!-- /CatProd -->
        
        <%
          
            LinkedList<Productos> arrProdCat = (LinkedList<Productos>)request.getAttribute("arrProdCat");
            request.setAttribute("arrProdCat", arrProdCat);
            
            if(existeProductos == "true")
            {
                if(arrProdCat == null || arrProdCat.isEmpty())
                {
        %>
                    <!--    alerta de Registro  false  -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-danger text-center sepBottom " role="alert">
                                <strong>
                                    <h3 class="TextBlack">No se encuentran productos asociados a la categoria consultada</h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Registro  false   -->
        <%
                }else{
        %>
                    <!--    table stockXProductos   -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-1 col-sm-12"></div>
                        <div class="col-lg-8 col-md-10 col-sm-12">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        
                                        <th scope="col" class="text-center">#</th>
                                        <th scope="col" class="text-center">Producto</th>
                                        <th scope="col" class="text-center">Precio</th>
                                        <th scope="col" class="text-center">Cantidad</th>
                                        <th scope="col" class="text-center">Stock</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int contador = 0;
                                        String newCantidad;
                                        String newStockMinimo;
                                        
                                        

                                        for (int i = 0; i < arrProdCat.size(); i++) {
                                            contador = contador +1;
                                            String nombre = arrProdCat.get(i).getNombre();
                                            int precio  = (int)arrProdCat.get(i).getPrecio();
                                            double cantidad = arrProdCat.get(i).getCantidad();
                                            int stockMinimo = arrProdCat.get(i).getStock_minimo();
                                            String medida = arrProdCat.get(i).getCategorias().getMedida_categoria();

                                            newCantidad = String.valueOf(cantidad).concat(medida);
                                            newStockMinimo = Integer.toString(stockMinimo).concat(medida);

                                            DecimalFormatSymbols simb = new DecimalFormatSymbols();
                                            simb.setDecimalSeparator(',');
                                            simb.setGroupingSeparator('.');
                                            DecimalFormat dfPrecio = new DecimalFormat("###,###");

                                            if(cantidad<stockMinimo)
                                            {
                                                out.println("<tr class=table-danger>");   
                                            }
                                            else if(cantidad == stockMinimo)
                                            {
                                                out.println("<tr class=table-warning>");
                                            }
                                            else
                                            {
                                                out.println("<tr class=table-success>");
                                            }

                                            out.println("<th class='text-center'>");
                                            out.println("<a class='text-black'>"+contador+"</a>" );
                                            out.println("</th>");

                                            out.println("<td class='text-center'>");
                                            out.println("<a > "+nombre+"</a>" );
                                            out.println("</td>");

                                            out.println("<td class='text-center'>");
                                            out.println("<a > $"+dfPrecio.format(precio)+"</a>" );
                                            out.println("</td>");


                                            out.println("<td class='text-center'>");
                                            out.println("<a > "+newCantidad+"</a>" );
                                            out.println("</td>");

                                            out.println("<td class='text-center'>");
                                            out.println("<a > "+newStockMinimo+"</a>" );
                                            out.println("</td>");

                                            out.println("</tr>");
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-lg-2 col-md-1 col-sm-12"></div>
                    </div>
                    <!--    /table stockXProductos   -->
        <% 
                }
            }
        %>
       
    </body>
</html>
