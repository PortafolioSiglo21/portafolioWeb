<%-- 
    Document   : Carta
    Created on : 21-sep-2020, 17:57:29
    Author     : Dr4g0n
--%>

<%@page import="java.util.ArrayList"%>
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
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
          <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-3.4.1.js" ></script>
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
        <script src="bootstrap/js/jsChef.js" ></script>
    </head>
    
    <body class="backBody"  style="overflow-x: hidden;">
        
        
        <!-- Titulo menu -->
        <div class="col-12 titlePageCarta text-center">
            <h4>Menú Disponibles</h4>
        </div>
        <!-- /Titulo menu -->
        
        <%
            LinkedList<Carta> arrCarta = new LinkedList<Carta>();
            arrCarta = CartaDAO.listaCarta();
            request.setAttribute("arrCarta", arrCarta);
            
            LinkedList<TipoCarta> arrTipoCarta = new LinkedList<TipoCarta>();
            arrTipoCarta = TipoCartaDAO.listadoTipo();
            request.setAttribute("arrTipoCarta", arrTipoCarta);
            
            int contadorCartas = 0;
            int contadorTipoCarta = 0;
            
            for (int i = 0; i < arrCarta.size(); i++) {
                int idTipoenCarta = arrCarta.get(i).getTipoCarta().getId_tipo_carta();
                contadorCartas = contadorCartas+1;
            }
            
            for (int a = 0; a < arrTipoCarta.size(); a++) {
                contadorTipoCarta = contadorTipoCarta+1;
            }
            
            if(contadorCartas == 0 )
            {
        %>
                <div class="row">
                    <div class="col-12 text-center TextBlack">
                        <h2>
                            no existe carta en el restaurant para mostrar
                        </h2>
                    </div>
                </div>
        <%
            }else{
        %>
        <!-- Celdas por tipo -->
        <div class="row ">
            <div class="col-lg-2 col-md-1"></div>
            <div class="col-lg-8 col-md-10 table-responsive-lg ">
                
                <!--    List tipo     -->
                <div class="row sepBottom">
                    <div class="col-1"></div>
                    <div class="col-10 ">
                         <%
                            for (int a = 0; a < arrTipoCarta.size(); a++) 
                            {
                                String nombreCarta = arrTipoCarta.get(a).getDescripcion();
                                int idTipoCarta = arrTipoCarta.get(a).getId_tipo_carta();
                                
                                
                                
                        %>  
                            <div class="row sepBody">
                                <div class="col-12 textPublicCarta font-weight-bold">
                                    <h4 class="sepBody">
                                        <%=nombreCarta%>
                                    </h4>
                                </div>
                            </div>
                        <%
                            for (int e = 0; e < arrCarta.size(); e++) 
                            {
                                //int idCarta = arrCarta.get(i).getId_carta();
                                int idTipo = arrCarta.get(e).getTipoCarta().getId_tipo_carta();
                                //String tipoCarta = arrCarta.get(i).getNombre();
                                String descripcionCarta = arrCarta.get(e).getDescripcion_Carta();
                                double precioMenuDB = arrCarta.get(e).getPrecio();
                                String nombreMenu = arrCarta.get(e).getNombre();

                                //Locale chile = new Locale("es","CL");
                                NumberFormat nf = NumberFormat.getInstance();
                                String precio = "$"+ nf.format(precioMenuDB);

                                if(idTipo == idTipoCarta)
                                {
                        %>   
                                <div class="row sepBody">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-9">
                                                <h4 class="TextBlack capitalizada" style="font-size: calc(1em + 1vw)">
                                                     <%=nombreMenu%>
                                                </h4> 
                                            </div>
                                            <div class="col-3">
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
                          <%
                                    } 
                                }
                            }
                        %>
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
