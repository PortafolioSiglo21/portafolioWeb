<%-- 
    Document   : tomarMesa
    Created on : 17-nov-2020, 19:41:23
    Author     : Dr4g0n
--%>

<%@page import="services.MesasDAO"%>
<%@page import="domain.Mesas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Tomar Mesa</title>       
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
            <h4>mesas disponibles</h4>
        </div>
        <!-- /Titulo menu -->
        <%
            String tomada = (String)request.getAttribute("tomada");
            
            if(tomada == "false")
            {
        %>
                 <!--    alerta de Registro MesaEditada false   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="let">
                                    por favor, vuelva a tomar la mesa
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro MesaEditada false   -->
        <%
            }
        %>
        
        
        <form action="tomarMesa" method="POST">
            <div class="row sepBody">
                <div class="col-2"></div>
                <div class="col-8 capitalizada text-black">
                    <div class="row text-center">
                        <div class="col-3">
                            <a class="text-black ">
                                Seleccionar Mesa	
                            </a>
                        </div>
                            <div class="col-6">
                                <select name="cboMesa"
                                            id="cboMesa"
                                            class="browser-default custom-select cboMesa capitalizada">
                                        <%
                                            ArrayList<Mesas> arrMesas = new ArrayList<Mesas>();
                                            arrMesas = MesasDAO.recuperarMesas();

                                            for (int i = 0; i < arrMesas.size(); i++) 
                                            {
                                                int idMesa = arrMesas.get(i).getId_mesa();
                                                String estado = arrMesas.get(i).getStatus_mesa();

                                                if(estado.equals("LIBRE"))
                                                {
                                        %>
                                                    <option value="<%=idMesa%>">Mesa <%=idMesa%></option>
                                        <%
                                                }
                                            }
                                        %>
                                     </select>
                            </div>
                            <div class="col-3 ">
                                <input class="btn btn-SigloBG font-weight-bold " type="submit" value="Tomar Mesa">
                            </div>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
        </form>

        <br>
        <br>
        
        <div class="row sepBody">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row sepBody">
                    <div class="col-12">
                        <table class="table table-striped text-center capitalizada sepBody">
                            <thead>
                                <tr>
                                    <th>número mesa</th>
                                    <th>capacidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String capacidadStr="";
                                    for (int i = 0; i < arrMesas.size(); i++) 
                                    {
                                        String estadoMesas = arrMesas.get(i).getStatus_mesa();
                                        int idMesasTbl = arrMesas.get(i).getId_mesa();
                                        int capacidad = arrMesas.get(i).getCapacidad();
                                      
                                        
                                        if(estadoMesas.equals("LIBRE"))
                                        {
                                            if(capacidad==1){
                                                capacidadStr = Integer.toString(capacidad)+" Persona";
                                            }else{
                                                capacidadStr = Integer.toString(capacidad)+" Personas";
                                            }
                                %>
                                        <tr>
                                            <td>mesa <%=idMesasTbl%></td>
                                            <td><%=capacidadStr%></td>
                                        </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table> 
                    </div>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
        
        
    </body>
</html>
