<%-- 
    Document   : ListadoMesas
    Created on : 29-sep-2020, 17:58:40
    Author     : Dr4g0n
--%>

<%@page import="services.MesasDAO"%>
<%@page import="domain.Mesas"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Extra</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        <%
            // recibir datos de la mesa
            String cerrarMesa = (String)request.getAttribute("mesaAPago");
            String numMesa    = (String)request.getAttribute("numMesa");
            String errorPago  = (String)request.getAttribute("errorPago");
        
        %>
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Listado estado de mesas</h4>
        </div>
        <!-- /Titulo menu -->
        <%
                
            if(cerrarMesa == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3>
                                   La mesa <%=numMesa%> fue enviada a caja
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
        <%
            }
                
            if(errorPago == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3>
                                   hubo un problema con enviar a caja la mesa <%=numMesa%>
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
        
        <div class="row">
           
            
            <!--    sectionOcupadas -->
            <div class="col-lg-6 col-md-6 col-sm-12">
                <!--    FormOcupadas -->
                
                <div class="row font-weight-bold sepBottom">
                    <div class="col-1"></div>
                    <div class="col-10">
                        <div class="col-12">Ocupadas</div>
                        <%
                            LinkedList<Mesas> arrMesasOcupadas = new LinkedList<Mesas>();
                            arrMesasOcupadas = MesasDAO.mesasOcupadas();
                            if(arrMesasOcupadas.size() != 0)
                            {
                        %>
                            <table class="table table-striped ">
                            <thead>
                                <tr>
                                    <th scope="col">Mesa n°</th>
                                    <th scope="col" class="text-center">Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                for (int mo = 0; mo < arrMesasOcupadas.size(); mo++) 
                                {
                                   int idMesasOcupadas = arrMesasOcupadas.get(mo).getId_mesa();

                            %>
                                        <tr>
                                            <td>
                                                Mesa <%=idMesasOcupadas%>
                                            </td>
                                            <td class="text-center">
                                                <form action="verMesa" method="POST" >
                                                    <input class="txtidMesaCalcular ocultar" name="txtidMesaCalcular" id="txtidMesaCalcular" value="<%=idMesasOcupadas%>">
                                                    <input class="btn btn-SigloTable font-weight-bold" type="submit" value="ver">
                                                </form>
                                            </td>
                                        </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        <%

                            }else{
                        %>       
                        <tr>
                            <td>
                                <h5 class="text-black sepBody let">
                                    No hay mesas ocupadas
                                </h5>
                            </td>
                        </tr>
                        <%
                            }
                        %>                                 
                    </div>
                    <div class="col-1"></div>
                </div>
                <!--    /FormOcupadas -->
            </div>
            <!--    /sectionOcupadas -->
            
            <!--    sectionLibres   -->
            
            <div class="col-lg-6 col-md-6 col-sm-12">
                <!--    FormLibres -->
                
                    <div class="row font-weight-bold sepBottom ">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="col-12">Libres</div>
                            <%
                                LinkedList<Mesas> arrMesasLibres = new LinkedList<Mesas>();
                                arrMesasLibres = MesasDAO.mesasLibres();

                                if(arrMesasLibres.size() != 0)
                                {
                            %>
                            <table class="table table-striped ">
                                <thead>
                                    <tr>
                                        <th scope="col">Mesa n°</th>
                                        <th scope="col" class="text-center">Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (int ml = 0; ml < arrMesasLibres.size(); ml++) 
                                        {
                                            int idMesaLibre = arrMesasLibres.get(ml).getId_mesa();
                                    %>
                                            <tr>
                                                <td>
                                                    Mesa <%=idMesaLibre%>
                                                </td>
                                                <td class="text-center">
                                                    <form action="controlOcuparMesas" method="POST">
                                                        <input class="ocultar" value="<%=idMesaLibre%>" name="txtIdMesaLibre" readonly>
                                                        <input class="ocultar" value="<%=idcargo%>" name="txtIdCargo" readonly>
                                                        <input class="btn btn-SigloTable font-weight-bold" type="submit" value="Ocupar">
                                                    </form>
                                                </td>
                                            </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                            <%
                                }else{
                            %>
                                    <tr>
                                        <td>
                                            <h5 class="text-black let">
                                                no hay mesas libres
                                            </h5>
                                        </td>
                                    </tr>
                            <%
                                }
                            %>
                        </div>
                        <div class="col-1"></div>
                    </div>
                
                <!--    /FormLibres -->
            </div>
            <!--    /sectionLibres -->
            
            
           
        </div>
        
        
    </body>
</html>
