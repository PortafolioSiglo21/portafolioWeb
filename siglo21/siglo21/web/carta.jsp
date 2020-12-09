<%-- 
    Document   : Carta
    Created on : 21-sep-2020, 17:57:29
    Author     : Dr4g0n
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="services.TipoCartaDAO"%>
<%@page import="domain.TipoCarta"%>
<%@page import="services.CartaDAO"%>
<%@page import="domain.Carta"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carta</title>
          <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-3.4.1.js" ></script>
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
        <script src="bootstrap/js/jsChef.js" ></script>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody"  style="overflow-x: hidden;">
        
        
        <!-- Titulo menu -->
        <div class="col-12 titlePageCarta text-center">
            <h4>Menú Disponibles</h4>
        </div>
        <!-- /Titulo menu -->
        
        <%
            // listar carta
            LinkedList<Carta> arrCarta = new LinkedList<Carta>();
            arrCarta = CartaDAO.listaCarta();
            
            // listar tipo de cartas
            LinkedList<TipoCarta> arrTipoCarta = new LinkedList<TipoCarta>();
            arrTipoCarta = TipoCartaDAO.listadoTipo();
            
            // tipo de carta segun cartas (cantidades)
            LinkedList<Carta> arrContTipo = new LinkedList<Carta>();
            arrContTipo = CartaDAO.contarCartasPorTipo();
            
            
            for (int i = 0; i < arrCarta.size(); i++) 
            {
                
        %>
        <!-- Celdas por tipo -->
        <div class="row ">
            <div class="col-lg-2 col-md-1"></div>
            <div class="col-lg-8 col-md-10 table-responsive-lg ">
                
                <!--    List tipo     -->
                <div class="row sepBottom">
                    <div class="col-1"></div>
                    <div class="col-10 ">
                         
                            <div class="row sepBody">
                                <div class="col-12 textPublicCarta font-weight-bold">
                                    <h4 class="sepBody">
                                        <%=nombreCarta%>
                                    </h4>
                                </div>
                            </div>
                                
                                <div class="row sepBody">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-7">
                                                <h4 class="TextBlack capitalizada">
                                                    <%=nombreMenu%>
                                                </h4> 
                                            </div>
                                            <div class="col-5">
                                                <h4 class="TextBlack capitalizada text-right">
                                                    <%=precio%>
                                                </h4> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-12">
                                                <h6 class="text-ColBg capitalizada text-justify " >
                                                    <%=descripcionCarta%>
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                    </div>
                    <div class="col-1"></div>
                </div>
                <!--    /List tipo     -->
                
            </div>
             <div class="col-lg-2 col-md-1"></div>
        </div>
        <!-- /Celdas por tipo -->
        <%
            }
        %>
    </body>
</html>
