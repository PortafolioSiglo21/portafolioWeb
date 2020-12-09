<%-- 
    Document   : StockTotal
    Created on : 25-sep-2020, 17:51:38
    Author     : Dr4g0n
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="services.ProductosDAO"%>
<%@page import="services.ProveedorDAO"%>
<%@page import="java.util.LinkedList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="domain.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock Total Restaurante</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
     <body class="backBody" style="overflow-x: hidden;">
       
         <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Stock Total</h4>
        </div>
        <!-- /Titulo menu -->
        <%
          LinkedList<Productos>  arrProductos = (LinkedList<Productos>)request.getAttribute("arrProductos");
          request.setAttribute("arrProductos", arrProductos);
            
          if(arrProductos == null || arrProductos.isEmpty())
          {
        %>
            <div class="row">
                <div class="col-12 text-center font-weight-bold">
                    <h3 class="capitalizada">no hay productos en la base de datos</h3>
                </div>
            </div>
        <%
            }else{
        %>
           <!--    Celdas por tipo     -->    
                <!--    List tipo     -->
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-10 text-center">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Producto</th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">Cantidad</th>
                                    <th scope="col">Stock Mínimo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int contador = 0;
                                    String newCantidad;
                                    String newStockMinimo;
                                    for (int i = 0; i < arrProductos.size(); i++) {
                                        contador = contador+1;
                                        String nombre   = arrProductos.get(i).getNombre();
                                        double cantidad    = arrProductos.get(i).getCantidad();
                                        double precioUni    = arrProductos.get(i).getPrecio();
                                        int stockMinimo = arrProductos.get(i).getStock_minimo();
                                        String medida   = arrProductos.get(i).getCategorias().getMedida_categoria();
                                        
                                        newCantidad     = String.valueOf(cantidad).concat(medida);
                                        newStockMinimo  = Integer.toString(stockMinimo).concat(medida);
                                         //Locale chile = new Locale("es","CL");
                                        NumberFormat nf = NumberFormat.getInstance();
                                        String precio = "$"+ nf.format(precioUni);
                                        
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
                            
                                        out.println("<th>");
                                        out.println("<a class='text-black'>"+contador+"</a>" );
                                        out.println("</th>");
                                        
                                        out.println("<td>");
                                        out.println("<a class=''>"+nombre+"</a>" );
                                        out.println("</td>");
                                        
                                        out.println("<td>");
                                        out.println("<a class=''>"+precio+"</a>" );
                                        out.println("</td>");
                                        
                                        out.println("<td>");
                                        out.println("<a class=''>"+newCantidad+"</a>" );
                                        out.println("</td>");
                                        
                                        out.println("<td>");
                                        out.println("<a class=''>"+newStockMinimo+"</a>" );
                                        out.println("</td>");
                                        
                                        out.println("</tr>");
                                    }
                                    
                                %>
                                
                                 
                            </tbody>
                        </table>
                    </div>
                    <div class="col-1"></div>
                </div>
                <!--    /List tipo     -->
        <!-- /Celdas por tipo -->
        <% } %>
    </body>
</html>
