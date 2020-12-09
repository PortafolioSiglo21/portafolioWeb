<%-- 
    Document   : editarMesas
    Created on : 19-oct-2020, 20:32:43
    Author     : Dr4g0n
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="domain.Mesas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Mesa</title>
         <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    <%

        if(session.getAttribute("cargo") !="Administrador") {

            response.sendRedirect("index.jsp");
        }
       /* if((String)request.getAttribute("editable") != "true")
        {
            request.setAttribute("noEdit", "true");
             response.sendRedirect("mesas.jsp");
        }*/
       
        // edit mesa
        LinkedList<Mesas> arrEditMesas = (LinkedList<Mesas>)request.getAttribute("arrEditMesa");
        
        if(arrEditMesas.size() == 0 || arrEditMesas == null )
        {
            response.sendRedirect("index.jsp");
        }
        
        request.setAttribute("arrEditMesas", arrEditMesas);
        Mesas m = new Mesas();
        for (int i = 0; i < arrEditMesas.size(); i++) 
        {
              int numMesa =  arrEditMesas.get(i).getId_mesa();
              int capacidad = arrEditMesas.get(i).getCapacidad();
              String estado = arrEditMesas.get(i).getStatus_mesa();
             
              m.setId_mesa(numMesa);
              m.setCapacidad(capacidad);
              request.setAttribute("statMesa", estado);
              //m.setStatus_mesa(estado);
        }
        
        int numeroMesas = m.getId_mesa();
        int capacidad = m.getCapacidad();
              
    %>
    <body class="backBody">
       
   
        
        <!--    Titulo menu     -->
        <div class="row sepBody">         
            <div class="col-12 titlePage text-center capitalizada">
                <h4>mantenedor mesas</h4>
                <h5 class="text-ColBg sepBody  font-weight-bold capitalizada">editar mesa</h5>
            </div>
        </div>
        <!--    /Titulo menu    -->   
            
            
                <!--    Form   -->
        <form action="controlAddMesa" method="POST">
            <div class="row ">
                <div class="col-2"></div>
                <div class="col-8">
                   
                        <!--    iDnumMesa   -->
                        <div class="row ocultar">                        
                            <div class="col-lg-2 col-md-2 col-sm-12 centerTextName ocultar">
                                 Id Mesa
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-12 ocultar">
                                <input type="hidden" 
                                   name="txtIdNumMesa"
                                   id="txtIdNumMesa"
                                   class="txtIdNumMesa inpNone" 
                                   value=<%=numeroMesas%> readonly
                                   onkeypress="soloNumeros();"
                                  >
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>  
                        </div>
                        <!--    /iDnumMesa   -->

                        <!--    numMesa   -->
                        <div class="row sepBody">                        
                            <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                                 Número Mesa
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-12">
                                <input type="number" 
                                       name="txtNumMesaEdit"
                                       id="txtNumMesaEdit"
                                       onkeypress="soloNumeros();"
                                       class="form-control txtNumMesaEdit" 
                                       value=<%=numeroMesas%>
                                       >
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>  
                        </div>
                        <!--    /numMesa   -->

                        <!--    Capacidad   -->
                        <div class="row sepBody">                        
                            <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                                Capacidad
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-12">
                                <input type="text" 
                                       name="txtCapMesaEdit"
                                       id="txtCapMesaEdit"
                                       class="form-control txtCapMesaEdit" 
                                       onkeypress="soloNumeros();"
                                       placeholder="Ingrese capacidad de mesa" 
                                       value=<%=capacidad%>
                                        >
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>  
                        </div>
                        <!--    /Capacidad   -->

                        <!--    EstadoMEsa   -->
                        <div class="row sepBody">                        
                            <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                                Estado 
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-12">
                                <select name="cboEstadoEdit"
                                        id="cboEstadoEdit"
                                        class="browser-default custom-select cboEstadoEdit capitalizada" value=s$('.cboEstado').val(estado)>
                                    <option disabled>Seleccionar Estado...</option>
                                    <option value="LIBRE" ${statMesa == 'LIBRE' ? 'selected' : ''}>
                                        Libre
                                    </option>
                                    <option value="OCUPADA" ${statMesa == 'OCUPADA' ? 'selected' : ''}> 
                                        Ocupada
                                        </option>
                                    <option value="RESERVADA" ${statMesa == 'RESERVADA' ? 'selected' : ''}>
                                        Reservada
                                    </option>
                                </select>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>  
                        </div>
                        <!--    /EstadoMEsa   -->

                        <!-- Button send -->
                        <div class="row sepBody">
                            <div class="col-4"></div>
                            <div class="col-4">
                                <div class="form-group">                          
                                    <input class="btn btn-Siglo btn-block font-weight-bold sepBut" type="submit" value="Guardar">                          
                               </div>
                            </div>
                            <div class="col-4"></div>
                        </div>
                        <!-- /Button Send -->
                   
                </div>
                <div class="col-2"></div>
            </div>
        </form>
        <!--    /Form   -->
        
    </body>
</html>
