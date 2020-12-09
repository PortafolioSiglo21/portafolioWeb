<%-- 
    Document   : pedidos
    Created on : 29-sep-2020, 11:18:45
    Author     : Dr4g0n
--%>

<%@page import="services.ProductosDAO"%>
<%@page import="domain.Productos"%>
<%@page import="services.MesasDAO"%>
<%@page import="domain.Mesas"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="services.CartaDAO"%>
<%@page import="domain.Carta"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso de Pedidos</title>
        <link rel="stylesheet" href="bootstrap/css/StyleRestaurant.css" >
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-3.4.1.js" ></script>
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
        <script src="bootstrap/js/scriptGeneral.js" ></script>
        <script src="bootstrap/js/pedido.js" ></script>
        <script src="bootstrap/js/jsAdmin.js" ></script>
        <script src="bootstrap/js/popper.min.js" ></script>
        <script src="bootstrap/js/bootstrap.min.js" ></script>
         <!-- menu -->
        <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        <%
            // cartas
            LinkedList<Carta> arrCarta=new LinkedList<Carta>();
            arrCarta=CartaDAO.listaCarta();
            
            // mesas
            LinkedList<Mesas> arrMesasOcupadas = new LinkedList<Mesas>();
            arrMesasOcupadas = MesasDAO.mesasOcupadas();
            request.setAttribute("arrMesasOcupadas", arrMesasOcupadas);
            
            // productos
            LinkedList<Productos> arrProductos = new LinkedList<Productos>();
            arrProductos = ProductosDAO.listarLicoresYbebidas();
            
            // si se tomo mesa o no
            String tomada = (String) request.getAttribute("tomada");
            String numMesaTomada = (String)request.getAttribute("numMesaTomada");
            request.setAttribute("numMesaTomada", numMesaTomada);
            
            // si se ingresa orden o no
            String ordenIngresada = (String)request.getAttribute("ordenIngresada");
            String noIngresoDatos = (String)request.getAttribute("noHayIngresos");
            String numMesa = (String)request.getAttribute("numMesa");
        %>
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Pedidos</h4>
        </div>
        <!-- /Titulo menu -->
        <%
                
            if(tomada == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBottom " role="alert">
                            <strong>
                                <h3>
                                   La mesa <%=numMesaTomada%> fue ingresada, por favor, atenderla
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
        <%
            }
                
            if(ordenIngresada == "true")
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
                                        Se ingreso correctamente la orden para la mesa <%=numMesa%>
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
                
            if(noIngresoDatos == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBottom " role="alert">
                            <strong>
                                <h3>
                                    Debe seleccionar para poder ingresar una orden.
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
        
        
        <form action="ingresarPedidos" method="POST">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <!--    selectMesa  -->
                    <div class="row sepBody sepBottom">
                        <div class="col-lg-4 col-md-2 col-sm-12"></div>
                        <div class="col-lg-1 col-md-2 col-sm-12 TextBlack">
                            Mesa
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <select class="browser-default custom-select cboSelAddMesa"
                                    name="cboSelAddMesa"
                                    id="cboSelAddMesa"
                                    required>
                                <option value="" selected disabled>Seleccionar mesa...</option>
                                <c:forEach var="it" items="${arrMesasOcupadas}">
                                    <option value="${it.id_mesa}">Mesa ${it.id_mesa}</option>
                                </c:forEach>

                            </select>
                        </div>
                        <div class="col-lg-4 col-md-2 col-sm-12"></div>
                    </div>
                    <!--    /selectMesa  -->
                </div>

                <!--   sectionEntradas  --> 
                <div class="col-lg-6 col-md-12 col-sm-12">  
                    <!--    titleIn -->
                    <div class="row">
                        <div class="col-1 "></div>
                        <div class="col-10 ">
                            <label class="lblPedido">Entradas</label>
                        </div>
                        <div class="col-1 "></div>
                    </div>
                    <!--    /titleIn -->

                    <!--    AddProdEntradas  -->
                    <div class="row  sepBottom">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-8">
                                            <select class="browser-default custom-select cboEntrada"
                                                            name="cboEntrada"
                                                            id="cboEntrada">
                                                        <option value="0" selected disabled>Seleccionar Entrada...</option>
                                                        <%
                                                            for(int i=0; i<arrCarta.size(); i++)
                                                            {
                                                                int idCarta=arrCarta.get(i).getId_carta();
                                                                String nombreCarta=arrCarta.get(i).getNombre();
                                                                if(idCarta==1||idCarta==2){
                                                        %>
                                                        <option value="<%=idCarta%>"> <%=nombreCarta%></option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                        </div>  
                                        <div class="col-4 text-center">
                                            <a type="button" class="btn btn-success font-weight-bold TextWhite" onclick="addEnt();" >Agregar</a> 
                                        </div>  
                                    </div>  
                                </div>
                            </div>
                            <div class="row sepBody">
                                <div class="col-12">
                                    <table class="table text-center">
                                        <thead>
                                            <th style="width: 10%">#</th>
                                            <th style="width: 70%">Producto</th>
                                            <th style="width: 20%">Acciòn</th>
                                        </thead>
                                        <tbody id="dataEnt">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div>     
                    <!--    /AddProdEntradas  -->
                </div>
                <!--   /sectionEntradas  --> 

                <!--   sectionPrincipal  --> 
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <!--    titleIn -->
                    <div class="row">
                        <div class="col-1 "></div>
                        <div class="col-10 ">
                            <label class="lblPedido">
                                Principal
                            </label>
                        </div>
                        <div class="col-1 "></div>
                    </div>
                    <!--    /titleIn -->

                    <!--    AddProdPrincipal  -->
                    <div class="row  sepBottom">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-8">
                                            <select class="browser-default custom-select cboPrincipal"
                                                    name="cboPrincipal"
                                                    id="cboPrincipal">
                                                <option value="0" selected disabled>Seleccionar Principal...</option>
                                                <%
                                                    for(int i=0; i<arrCarta.size(); i++){
                                                        int idCarta=arrCarta.get(i).getId_carta();
                                                        String nombreCarta=arrCarta.get(i).getNombre();
                                                        if(idCarta>2 && idCarta<7 ){
                                                %>
                                                <option value="<%=idCarta%>"> <%=nombreCarta%></option>
                                                <%
                                                }}
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-4 text-center">
                                            <a type="button" class="btn btn-success  font-weight-bold TextWhite" onclick="addPrin();" >Agregar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row sepBody">
                                <div class="col-12">
                                    <table class="table text-center">
                                        <thead>
                                            <thead>
                                                <th style="width: 10%">#</th>
                                                <th style="width: 70%">Producto</th>
                                                <th style="width: 20%">Acciòn</th>
                                            </thead>
                                        </thead>
                                        <tbody id="dataPrin">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div>  
                    <!--    /AddProdPrincipal  -->
                </div>  
                <!--   /sectionPrincipal    --> 

                <!--   sectionPostres   --> 
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <!--    titleIn -->
                    <div class="row">
                        <div class="col-1 "></div>
                        <div class="col-10 ">
                            <label class="lblPedido">
                                Postres
                            </label>
                        </div>
                        <div class="col-1 "></div>
                    </div>
                    <!--    /titleIn -->

                    <!--    AddProdPostres  -->
                    <div class="row  sepBottom">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-8">
                                            <select class="browser-default custom-select cboPostre"
                                                    name="cboPostre"
                                                    id="cboPostre">
                                                <option value="0" selected disabled>Seleccionar Postre...</option>
                                                <%
                                                    for(int i=0; i<arrCarta.size(); i++){
                                                        int idCarta=arrCarta.get(i).getId_carta();
                                                        String nombreCarta=arrCarta.get(i).getNombre();
                                                        if(idCarta==7){
                                                %>
                                                <option value="<%=idCarta%>"> <%=nombreCarta%></option>
                                                <%
                                                }}
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-4 text-center">
                                            <a type="button" class="btn btn-success  font-weight-bold TextWhite" onclick="addPos();" >Agregar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row sepBody">
                                <div class="col-12">
                                    <table class="table text-center">
                                        <thead>
                                            <thead>
                                                <th style="width: 10%">#</th>
                                                <th style="width: 70%">Producto</th>
                                                <th style="width: 20%">Acciòn</th>
                                            </thead>
                                        </thead>
                                        <tbody id="dataPos">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div> 
                    <!--    /AddProdPostres  -->
                </div>
                <!--   /sectionPostres  --> 

                <!--   sectionBebestibles  --> 
                 <div class="col-lg-6 col-md-12 col-sm-12">
                    <!--    titleIn -->
                    <div class="row">
                        <div class="col-1 "></div>
                        <div class="col-10 ">
                            <label class="lblPedido">
                                Bebestibles
                            </label>
                        </div>
                        <div class="col-1 "></div>
                    </div>
                    <!--    /titleIn -->

                    <!--    AddProdBebestibles  -->
                    <div class="row  sepBottom">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-8">
                                            <select class="browser-default custom-select cboBebestible"
                                                    name="cboBebestible"
                                                    id="cboBebestible">
                                                <option value="0" selected disabled>Seleccionar Bebestible...</option>
                                                <%
                                                    for(int i=0; i<arrProductos.size(); i++)
                                                    {
                                                        int idProd          = arrProductos.get(i).getId_producto();
                                                        String nombreProd   = arrProductos.get(i).getNombre();
                                                        String descripProd  = arrProductos.get(i).getDescripcion();
                                                %>
                                                <option value="<%=idProd%>"> <%=nombreProd%> - <%=descripProd%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-4 text-center">
                                            <a type="button" class="btn btn-success font-weight-bold TextWhite" onclick="addBeb();" >Agregar</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row sepBody">
                                <div class="col-12">
                                    <table class="table text-center">
                                        <thead>
                                            <thead>
                                                <th style="width: 10%">#</th>
                                                <th style="width: 70%">Producto</th>
                                                <th style="width: 20%">Acciòn</th>
                                            </thead>
                                        </thead>
                                        <tbody id="dataBeb">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div>                 
                    <!--    /AddProdBebestibles  -->
                </div>
                <!--   /sectionBebestibles  --> 

                <!--   sectionBtn  --> 
                <div class="col-12 sepBottom sepBody">
                    <!-- Button send -->
                        <div class="row sepBody">

                            <div class="col-12 text-center">
                                <div class="form-group">                          
                                    <input class="btn btn-Siglo font-weight-bold sepBut" type="submit" value="Crear Pedido">                          
                               </div>
                            </div>

                            </div>                    
                        <!-- /Button Send -->
                </div>
                <!--   /sectionBtn  --> 
            </div>
        </form>
    </body>
</html>
