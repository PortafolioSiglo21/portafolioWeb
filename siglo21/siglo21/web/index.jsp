<%-- 
    Document   : index
    Created on : 24-10-2019, 15:30:20
    Author     : Dr4g0n
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="services.MesasDAO"%>
<%@page import="domain.Mesas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="services.ReservacionesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Restaurante Siglo XXI</title>  
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-3.4.1.js" ></script>
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
        <script src="bootstrap/js/totem.js" ></script>
        
        <!-- menu -->
        <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        
        
        
        <div class="container">
        <% 
                           
            if(cargo=="" || cargo== null )
            {
        %>
        
                <div id="carouselExampleSlidesOnly" class="carousel slide img-fluid  " data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100 imgIndex" src="img/Portada.jpg" alt="Portada Principal">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 imgIndex" src="img/portada2.jpg" alt="Portada plato preparado">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 imgIndex" src="img/portada3.jpg" alt="Portada especial">
                        </div>
                    </div>
                </div>
        
            
        <% 
            }else
            {
                if(cargo =="Administrador")
                {
                    int contadorReserva = ReservacionesDAO.cantidadReservasDelDia();
                
        %>
                    <div class="row sepBody">
                        <div class="col-12 text-center sepBody">
                            <h3 class="sepBody">
                                Bienvenido al sistema </h3>
                                <br>
                            <h2 class="text-ColBg capitalizada"><%=nombreUsuario%></h2>
                                <br>

                                <h3>
                                Que tenga un buen día
                            </h3>
                        </div>
                    </div>

                    <div class="row sepBody text-center">
                        <div class="col-12 text-center">
                            <h3 class="text-black">
                                <a href="reservasDelDia.jsp" class="text-black">Reservas de hoy: </a>
                                <h3 class="text-red">
                                    <%=contadorReserva%>
                                </h3> 
                            </h3> 
                        </div>
                    </div>
        <% 
                }
                if(cargo =="Cocinero")
                {
        %>
                    <div class="row sepBody">
                        <div class="col-12 text-center sepBody">
                            <h3 class="sepBody">
                                Bienvenido al sistema </h3>
                                <br>
                            <h2 class="text-ColBg capitalizada"><%=nombreUsuario%></h2>
                                <br>

                                <h3>
                                Que tenga un buen día
                            </h3>
                        </div>
                    </div>
        <% 
                }
                if(cargo =="Chef")
                {
        %>
                    <div class="row sepBody">
                        <div class="col-12 text-center sepBody">
                            <h3 class="sepBody">
                                Bienvenido al sistema </h3>
                                <br>
                            <h2 class="text-ColBg capitalizada"><%=nombreUsuario%></h2>
                                <br>

                                <h3>
                                Que tenga un buen día
                            </h3>
                        </div>
                    </div>
        <% 
                }
                if(cargo=="Totem")
                {
                    String tomada = (String)request.getAttribute("tomada");
                    String numMesaTomada = (String)request.getAttribute("numMesaTomada");
                    String sinReserva = (String)request.getAttribute("noHayReservas");
                    
                    // reserva
                    String ingresoRes = (String) request.getAttribute("ingresoRes");
                    String nombreRes = (String) request.getAttribute("nombreIngreso");
                    String numMesaRes = (String)request.getAttribute("mesaTomadaRes");
                    
                    if(tomada=="true")
                    {
        %>
                        <!--    alerta de Registro    -->
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-8">
                                <div class="alert alert-success text-center sepBottom " role="alert">
                                    <strong>
                                        <h3 class="TextBlack">Por favor, dirijase a la mesa número <%=numMesaTomada%></h3>
                                    </strong> 
                                </div>
                            </div>
                            <div class="col-2"></div>
                        </div>
                        <!--    /alerta de Registro    -->
                <%
                    }

                    if(sinReserva == "true")
                    {
                %>
                         <!--    alerta de Registro    -->
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-8">
                                <div class="alert alert-warning text-center sepBottom " role="alert">
                                    <strong>
                                        <h3 class="TextBlack">Rut ingresado, no cuenta con reservaciones<br>Por favor, seleccione tomar mesa</h3>
                                    </strong> 
                                </div>
                            </div>
                            <div class="col-2"></div>
                        </div>
                        <!--    /alerta de Registro    -->
                <%
                    }

                    if(ingresoRes == "true")
                    {
                %>
                        <!--    alerta de Registro    -->
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-8">
                                <div class="alert alert-success text-center sepBottom " role="alert">
                                    <strong>
                                        <h3 class="TextBlack capitalizada"><%=nombreRes%> </h3><br><h3 class="TextBlack">Por favor, dirijase a la mesa número <label class="text-ColBg font-weight-bold"><%=numMesaRes%></label></h3> 
                                    </strong> 
                                </div>
                            </div>
                            <div class="col-2"></div>
                        </div>
                        <!--    /alerta de Registro    -->
                <%
                    }
                %>
        
                    <div class="row sepBody">
                        <div class="col-12 text-center sepBody">
                            <h3 class="text-black upper sepBody">bienvenidos a restaurant SIGLOXXI</h3>
                            <h4 class="text-black let sepBody">Seleccione una opción</h4>
                        </div>
                    </div>
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2"></div>
                        <div class="col-lg-8 col-md-8 col-sm-12 text-center">
                            <div class="row sepBody">
                                <div class="col-6 text-center">
                                    <a href="tomarReserva.jsp" class="btn btn-SigloBG btn-lg  font-weight-bold" role="button" aria-pressed="true">Reservadas</a>       
                                </div>
                                <div class="col-6 text-center">
                                    <a href="tomarMesa.jsp" class="btn btn-SigloBG btn-lg  font-weight-bold" role="button" aria-pressed="true">Tomar Mesa</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2"></div>
                    </div>
                    <br>
                    <br>
                    <%
                        ArrayList<Mesas> arrMesas = new ArrayList<Mesas>();
                        arrMesas = MesasDAO.recuperarMesas();
                        int contadorDispo   = 0;
                        int contadorRese    = 0;
                        int contadorOcu     = 0;
                    
                        for (int i = 0; i < arrMesas.size(); i++) 
                        {
                                String estadoMesas = arrMesas.get(i).getStatus_mesa();
                                
                                if(estadoMesas.equals("LIBRE"))
                                {
                                    contadorDispo = contadorDispo+1;
                                }else if(estadoMesas.equals("RESERVADA"))
                                {
                                    contadorRese = contadorRese+1;
                                }else
                                {
                                    contadorOcu = contadorOcu +1;
                                }
                        }
                    
                    %>
                    <div class="row  sepBody text-center">
                        <div class="col-lg-3 col-md-3"></div>
                        <div class="col-lg-4 col-md-4 mdis">
                            <h2>
                                Mesas Disponible
                            </h2>
                        </div>
                        <div class="col-lg-2 col-md-2 mdis">
                            <h2>
                                <%=contadorDispo%>
                            </h2>
                        </div>
                        <div class="col-lg-3 col-md-3"></div>
                    </div>
                    <div class="row sepBody text-center">
                        <div class="col-lg-3 col-md-3"></div>
                        <div class="col-lg-4 col-md-4 mres">
                            <h2>
                                Mesas Reservadas
                            </h2>
                        </div>
                        <div class="col-lg-2 col-md-2 mres">
                            <h2>
                                <%=contadorRese%>
                            </h2>
                        </div>
                        <div class="col-lg-3 col-md-3"></div>
                    </div>
                    <div class="row sepBody  sepBottom text-center">
                        <div class="col-lg-3 col-md-3"></div>
                        <div class="col-lg-4 col-md-4 ">
                            <h2>
                                Mesas Ocupadas
                            </h2>
                        </div>
                        <div class="col-lg-2 col-md-2 ">
                            <h2>
                                <%=contadorOcu%>
                            </h2>
                        </div>
                        <div class="col-lg-3 col-md-3"></div>
                    </div>
        <% 
                }
            }
        %>
            
            
        </div>
    </body>
</html>

