<%-- 
    Document   : addExtra
    Created on : 29-sep-2020, 11:26:45
    Author     : Dr4g0n
--%>

<%@page import="services.ProductosDAO"%>
<%@page import="domain.Productos"%>
<%@page import="services.CartaDAO"%>
<%@page import="domain.Carta"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="services.MesasDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="domain.Mesas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar Extra</title>
        <!-- menu -->
        <%@include file="header.jsp" %>
        <!-- /menu -->
        <script src="bootstrap/js/pedido.js" ></script>
    </head>
    
    <body class="backBody">
        <%
            // mesas
            LinkedList<Mesas> arrMesasOcupadas = new LinkedList<Mesas>();
            arrMesasOcupadas = MesasDAO.mesasOcupadas();
            request.setAttribute("arrMesasOcupadas", arrMesasOcupadas);
            
            // cartas
            LinkedList<Carta> arrCarta=new LinkedList<Carta>();
            arrCarta = CartaDAO.listaCarta();
            
            // productos
            LinkedList<Productos> arrProductos = new LinkedList<Productos>();
            arrProductos = ProductosDAO.listarLicoresYbebidas();
        
            //si se ingresa extra o no
            String extraIngresado = (String)request.getAttribute("extraIngresado");
            String noHayExtras = (String)request.getAttribute("noHayExtras");
            String numMesa = (String)request.getAttribute("numMesa");
            String cantidadExtras = (String)request.getAttribute("cantidadExtras");
            String infoCantidad;
            int cant =0;
            if(cantidadExtras != null)
            {
                cant = Integer.parseInt(cantidadExtras);
            }
            
            if(cant == 1)
            {
                infoCantidad = " extra de orden";
            }else
            {
                infoCantidad = " extras de ordenes";
            }
        %>
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Agregar Extra a Mesa</h4>
        </div>
        <!-- /Titulo menu -->
        <%
                
            if(noHayExtras == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBottom " role="alert">
                            <strong>
                                <h3>
                                   No ha ingresado ningun pedido extra
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
        <%
            }
                
            if(extraIngresado == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3>
                                    
                                    <strong>
                                        Se ingreso correctamente <%=cant%> <%=infoCantidad%> en la mesa <%=numMesa%>
                                    </strong>
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
        <%
            }
        %>
        
        
        <!--    FormAddExtra    -->
        <form action="agregarPedidos" method="POST" >
            <div class="row sepBody">
                <div class="col-2"></div>
                <div class="col-8">
                    
                    <!--    selectMesa  -->
                    <div class="row sepBody sepBottom">
                        <div class="col-lg-3 col-md-2"></div>
                        <div class="col-lg-1 col-md-2 col-sm-12 TextBlack">
                            Mesa
                        </div>
                        <div class="col-lg-5 col-md-6 col-sm-12">
                            <select class="browser-default custom-select cboSelAddMesa" 
                                    name="cboSelAddMesa"
                                    id="cboSelAddMesa"
                                    required>
                                <option  selected disabled>Seleccionar mesa...</option>
                                <c:forEach var="md" items="${arrMesasOcupadas}">
                                    <option value="${md.id_mesa}">Mesa ${md.id_mesa}</option>
                                </c:forEach>
                                
                            </select>
                        </div>
                        <div class="col-lg-3 col-md-2"></div>
                    </div>
                    <!--    /selectMesa  -->
                    
                    <!--    TextAdd  -->
                    <div class="row  ">
                        <div class="col-lg-2 col-md-2 col-sm-12">
                           
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <h5 class="text-black">Agregar Productos</h5>
                        </div>
                        <div class="col-lg-2 col-md-2"></div>
                    </div>
                    <!--    /TextAdd  -->
                    
                    <!--    SectionAddExtra  -->
                    <div class="row sepBody sepBottom">                        
                        <div class="col-12">
                            <!-- selectAdd -->
                            <div class="row">
                                <div class="col-lg-2 col-md-2"></div> 
                                <div class="col-lg-7 col-md-6 col-sm-8">
                                    <select class="browser-default custom-select cboExtra"
                                                    name="cboExtra"
                                                    id="cboExtra" 
                                                    required>
                                                <option value="0"  Selected disabled>Seleccionar Entrada...</option>
                                                <option class="optRed" disabled>--- Cartas ---</option>
                                                <%
                                                    for(int i=0; i<arrCarta.size(); i++)
                                                    {
                                                        int idCarta=arrCarta.get(i).getId_carta();
                                                        String nombreCarta=arrCarta.get(i).getNombre();
                                                        
                                                %>
                                                    <option value="<%=idCarta%>-C"><%=nombreCarta%></option>
                                                <%
                                                        
                                                    }
                                                %>
                                                <option class="optRed" disabled>--- Bebidas y Licores ---</option>
                                                <%
                                                    for (int j = 0; j < arrProductos.size(); j++) 
                                                    {
                                                        int idProd          = arrProductos.get(j).getId_producto();
                                                        String nombreProd   = arrProductos.get(j).getNombre();
                                                        String descripProd  = arrProductos.get(j).getDescripcion();
                                                        
                                                %>
                                                        <option value="<%=idProd%>-P"><%=nombreProd%> - <%=descripProd%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                </div>  
                                <div class="col-lg-3 col-md-4 col-sm-4 text-center">
                                    <a type="button" class="btn btn-success font-weight-bold TextWhite" onclick="addExt()" >Agregar</a> 
                                </div>  
                            </div>  
                            <!-- /selectAdd -->
                            
                            <!-- tableAdd -->
                            <div class="row sepBody">
                                <div class="col-12">
                                    <table class="table text-center">
                                        <thead>
                                            <th style="width: 10%">#</th>                                            
                                            <th style="width: 70%">Producto</th>
                                            <th style="width: 20%">Acciòn</th>
                                        </thead>
                                        <tbody id="dataExt">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /tableAdd -->
                            
                        </div>                        
                    </div>
                    <!--    /SectionAddExtra  -->
                    
                    <!-- Button send -->
                    <div class="row sepBody sepBottom">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="form-group text-center sepBottom">                          
                                <input class="btn btn-Siglo  font-weight-bold sepBut" type="submit" value="Agregar pedido">                          
                           </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!-- /Button Send -->
                    
                </div>
            <div class="col-2"></div>
        </form>
        <!--    /FormAddExtra    -->

        
    </body>
</html>
