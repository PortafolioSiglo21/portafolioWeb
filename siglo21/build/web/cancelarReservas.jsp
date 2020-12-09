<%-- 
    Document   : cancelarReservas
    Created on : 09-nov-2020, 14:21:29
    Author     : Dr4g0n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancelar Reservas</title>
        
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
<%

   if(session.getAttribute("cargo") =="Chef" || session.getAttribute("cargo") =="Cocinero" || session.getAttribute("cargo") == "Bodeguero" || session.getAttribute("cargo")  == "Finanza" || session.getAttribute("cargo")  =="Administrador" || session.getAttribute("cargo")  == "Garzon") {

        response.sendRedirect("index.jsp");
    }

%>
    <body class="backBody"  style="overflow-x: hidden;">
   
        <div class="row sepBody">                
            <div class="col-12 text-center  font-weight-bold sepBody capitalizada">
                <h5>
                    Cancelar reserva Previa
                </h5>
            </div>
        </div>
        <%
            String cancelado = (String)request.getAttribute("cancelado");
            String sinDatos = (String)request.getAttribute("sinReservas");
            
            if(cancelado == "false")
            {
        %>
                 <!--    alerta de acceso    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-danger text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <br><a class="text-black capitalizada ">
                                       no cuenta con reservas previas en nuestro restaurant
                                    </a>
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de acceso    -->
        <%
            }

            if(sinDatos == "true")
            {
        %>
        
                <!--    alerta de acceso    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-danger text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <a class="text-black capitalizada ">
                                       nunca ha reservado en nuestro restaurant
                                    </a>
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de acceso    -->
        <%
            }
        %>
        
        
        <form action="controlCancelarReserva" method="POST">
            <div class="row sepBody ">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="row sepBody ">
                        <div class="col-lg-2 col-md-3 col-sm-12 centerTextName TextBlack sepBody capitalizada">
                            Ingrese rut
                        </div>
                        <div class="col-lg-6 col-md-7 col-sm-12 ">
                            <input type="text"
                                   name="txtRutCancela"
                                   id="txtRutCancela"
                                   class="form-control txtRutCancela lower"
                                   placeholder="ingrese rut de cancelación de reservas"
                            >
                        </div>
                        <div class="col-lg-3 col-md-2 col-sm-12 ">
                            <input class="btn btn-Siglo  font-weight-bold sepBottom" type="submit" value="Cancelar Reserva">
                        </div>
                    </div>
                </div>
                <div class="col-2 sepBottom"></div>
            </div>
        </form>
        
</html>
