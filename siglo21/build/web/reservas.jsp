<%-- 
    Document   : Reservas
    Created on : 21-sep-2020, 18:43:08
    Author     : Dr4g0n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserva Restaurante</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="bootstrap/js/valReservaciones.js" ></script>
    </head>
    
    <%

        if(session.getAttribute("cargo") =="Chef" || session.getAttribute("cargo") =="Cocinero" || session.getAttribute("cargo") == "Bodeguero" || session.getAttribute("cargo")  == "Finanza" || session.getAttribute("cargo")  =="Administrador" || session.getAttribute("cargo")  == "Garzon") {

            response.sendRedirect("index.jsp");
        }
        
    %>
    
     <body class="backBody"  style="overflow-x: hidden;">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Reservas</h4>
        </div>
        
        
        <%
            String creada = (String)request.getAttribute("reservado");
            String previaReserva = (String)request.getAttribute("reservaPrevia");
            String cancelado = (String)request.getAttribute("cancelado");
            String rechazado = (String)request.getAttribute("estadoRechazado");
            
            if(creada == "true")
            {
        %>
              <!--    alerta de acceso    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <Strong class="upper">¡¡¡muchas gracias!!!</Strong>
                                    <br><a class="TextBlack">
                                        Su reserva fue generada, y enviada a su email
                                    </a>
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de acceso    -->
        <%
            }else if(creada == "false"){
        %>
                <!--    alerta de acceso    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-danger text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <br><a class="TextBlack">
                                        Su reserva fue generada no pudo ser generada, por favor, contactese con el local
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

            if(previaReserva == "true")
            {
        %>
                <!--    alerta de acceso    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <a class="TextBlack">
                                        Ya cuenta con reserva en nuestro sistema
                                    </a>
                                    <br>para reservar, debe cancelar la anterior.... <Strong class="font-weight-bold"><a href="cancelarReservas.jsp">Cancelar Reserva</a></Strong>
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de acceso    -->
        <%
            }
            
            if(cancelado == "true")
            {
        %>
                <!--    alerta de acceso    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <Strong class="upper text-ColBgList">Su reserva fue cancelada notificando a su email</Strong>
                                    <br><a class="lower text-ColBgList">
                                        esperamos con ancias que vuelva 
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
            if(rechazado == "true")
            {
        %>
                 <!--    alerta de acceso    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-danger text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                    <a class="TextBlack">
                                        Usted no puede reservar, por favor, comuniquese con el administrador
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
        
              
        
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-sm-12">
                        
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <a class="info">
                            *para reservar, debe estar registrado previamente
                        </a>
                    </div>
                </div>
                <form action="controlReservacion" method="POST" autocomplete="off">
                    <!-- Rut -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                            Rut
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <input type="text" 
                                   name="txtRutCliRes"
                                   id="txtRutCliRes"
                                   class="form-control txtRutCliRes" 
                                   placeholder="Ingrese rut persona que reserva" 
                                   aria-label="Rut" 
                                   aria-describedby="addon-wrapping"
                                   >
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                    </div>
                    <!-- /Rut -->

                    <!-- Cantidad Personas -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                            Cantidad Personas
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <input type="number" 
                                   name="txtCantidadAsiste"
                                   id="txtCantidadAsiste"
                                   class="form-control txtCantidadAsiste" 
                                   placeholder="Ingrese Cantidad personas a reserva" 
                                   min="1"
                                   max="16"
                                   step="1"
                                  onkeypress="if(event.key==='.' || event.key===','){event.preventDefault(); alert('No puede usar decimales\n solo números enteros')}">
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                        </div>
                    </div>
                    <!-- /Cantidad Personas -->

                    
                     <!-- Fecha Reserva -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                            Fecha Reserva
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <div class="form-group"> 
                               
                            <input type="text" 
                                   name="Freserva" 
                                   id="Freserva"
                                   class="form-control Freserva lower"
                                   placeholder="dd/mm/aaaa"
                                   required>
                           </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                        </div>
                    </div>
                    <!-- /Fecha Reserva -->

                     <!-- Hora Resreva -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2 col-sm-12 centerTextName" >
                            Hora Reserva
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <div class="form-group"> 

                                <input type="time" 
                                       name="Hreserva"
                                       id="Hreserva"
                                       class="form-control Hreserva" 
                                       placeholder="Seleccione un horario"
                                       min="09:30"
                                       max="21:00"
                                       required>

                           </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                        </div>
                    </div>
                    <!-- /Hora Reserva -->

                    <!-- Button send -->
                    <div class="row sepBody">
                        <div class="col-12 text-center">
                            <div class="form-group">                          
                                <input class="btn btn-Siglo btn-lg  font-weight-bold sepBut btnRegReserva" type="submit" value="Reservar">                          
                           </div>
                        </div>
                    </div>
                    <!-- /Button Send -->
                </form>
                <!-- Button send -->
                    <div class="row sepBottom text-center">
                        <div class="col-12 text-center">
                            <div class="form-group">     
                                <strong class="font-weight-bold">
                                    <a href="cancelarReservas.jsp" class="text-ColBg capitalizada">cancelar reserva</a>
                                </strong>
                           </div>
                        </div>
                    </div>
                    <!-- /Button Send -->
            </div>
            <div class="col-2"></div>
        </div>
        
        <!-- /Titulo menu -->
    </body>
</html>
