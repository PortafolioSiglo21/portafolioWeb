<%-- 
    Document   : tomarReserva
    Created on : 19-nov-2020, 12:54:39
    Author     : Dr4g0n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Ingreso reservaciones</title>    
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-3.4.1.js" ></script>
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
        <script src="bootstrap/js/totem.js" ></script>
         <!-- menu -->
        <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <%

        if(session.getAttribute("cargo") !="Totem") {

            response.sendRedirect("index.jsp");
        }

    %>
    
    <body class="backBody">
       
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center capitalizada">
            <h4>ingreso reservaciones</h4>
        </div>
        <!-- /Titulo menu -->
        <%
            String faltaRut = (String)request.getAttribute("faltaRutReserva");
            
            if(faltaRut == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack let">Por favor, ingrese un rut</h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
        <%
            }
        %>
        
        <form action="tomarReserva" method="POST" autocomplete="off">
            <div class="row sepBody">
                <div class="col-2"></div>
                <div class="col-8 capitalizada text-black">
                    <div class="row text-center">
                        <div class="col-3">
                            <a class="text-black ">
                                Rut reserva 	
                            </a>
                        </div>
                            <div class="col-6">
                                <input class="form-control txtRutReserva"
                                       name="txtRutReserva"
                                       id="txtRutReserva"
                                       placeholder="Ingrese rut del reservante">
                            </div>
                            <div class="col-3 ">
                                <input class="btn btn-SigloBG font-weight-bold " type="submit" value="Buscar">
                            </div>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
        </form>
        
        
    </body>
</html>
