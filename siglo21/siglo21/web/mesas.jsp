<%-- 
    Document   : mesas
    Created on : 26-sep-2020, 14:58:42
    Author     : Dr4g0n
--%>

<%@page import="services.MesasDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="domain.Mesas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenedor Mesas</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody"style="overflow-x: hidden;">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Mantenedor Mesas</h4>
        </div>
        <!-- /Titulo menu -->
        
        <%
            // recuperar Mesas
            //ArrayList<Mesas> arrMesas = (ArrayList<Mesas>)request.getAttribute("arregloMesas");
            ArrayList<Mesas> arrMesas = new ArrayList<Mesas>();
            arrMesas = MesasDAO.recuperarMesas();
            request.setAttribute("arrMesas", arrMesas);
            
            // confirmaciones de datos
            String addMesa          = (String)request.getAttribute("mesaAgregada");
            String existeMesa       = (String)request.getAttribute("existeMesa");
            
            //datos de la mesa
            String numeroMesa       = (String)request.getAttribute("numeroMesaAdd");
            String capacidadMesa    = (String)request.getAttribute("capacidadMesaAdd");
            String numMesaExiste    = (String)request.getAttribute("numExisteMesa");
            
           
            
            if(existeMesa=="true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBottom " role="alert">
                            <strong>
                                <h3>
                                    Mesa <label class="text-black"><%=numMesaExiste%></label> ya cuenta con registro en nuestro sistema
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
        
        <% 
            }else
            {
                if(addMesa=="true")
                {
        %>
                    <!--    alerta de Registro    -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-success text-center sepBottom " role="alert">
                                <strong>
                                    <h3 class="TextBlack">Mesa <label class="text-ColBg"><%=numeroMesa%></label> con capacidad de <label class="text-ColBg"><%=capacidadMesa%></label> personas
                                        ha sido registrado con éxito</h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Registro    -->
        <% 
                }
            }
        %>
        
        <%
            // editar mesa
            String mesaEditada          = (String)request.getAttribute("editMesa");
            String numeroMesaEditada    = (String)request.getAttribute("numMesaEdit");
            String capacidadEditada     = (String)request.getAttribute("capacidadMesaEdit");
            String estadoEditado        = (String)request.getAttribute("estadoMesaEdit");
            
            if(mesaEditada=="false")
            {
        %>
                <!--    alerta de Registro MesaEditada false   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBottom " role="alert">
                            <strong>
                                <h3>
                                    Mesa <label class="text-black"><%=numeroMesaEditada%></label> no ha sido posible editarla
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro MesaEditada false   -->
        
        <%
            }
            if(mesaEditada=="true")
            {
        %>
                <!--    alerta de Registro mesaEditada true  -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack">Mesa <label class="text-ColBg"><%=numeroMesaEditada%></label> se ha editado a una capacidad de <label class="text-ColBg"><%=capacidadEditada%></label> personas
                                    y a estado <label class="text-ColBg"><%=estadoEditado%></label>, las modificaciones fueron exitosas</h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro mesaEditada true  -->
         <%
            }
        %>
        
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
                                   value=0 readonly
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
                                   name="txtNumMesa"
                                   id="txtNumMesa"
                                   class="form-control txtNumMesa" 
                                   placeholder="Ingrese número de mesa" 
                                   aria-describedby="addon-wrapping"
                                   min="1"
                                   max="300"
                                   step="1"
                                   value=""
                                   onkeypress="soloNumeros();"
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
                            <input type="number" 
                                   name="txtCapMesa"
                                   id="txtCapMesa"
                                   class="form-control txtCapMesa" 
                                   placeholder="Ingrese capacidad de mesa" 
                                   aria-describedby="addon-wrapping"
                                   min="1"
                                   max="50"
                                   step="1"
                                   onkeypress="soloNumeros();"
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
                            <select name="cboEstado"
                                    id="cboEstado"
                                    class="browser-default custom-select cboEstado capitalizada">
                                <option selected disabled>Seleccionar Estado...</option>
                                <option value="LIBRE">Libre</option>
                                <option value="OCUPADA">Ocupada</option>
                                <option value="RESERVADA">Reservada</option>
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
        
             
        <!--    List tipo     -->
        <div class="row sepBody">
            <div class="col-2"></div>
            <div class="col-8 text-center sepBody">
                <table class="table table-striped tblListado sepBottom">
                    <thead>
                        <tr>
                            <th scope="col">Número de Mesa</th>
                            <th scope="col">Capacidad</th>                            
                            <th scope="col">Estado</th>                            
                            <th scope="col">Acción</th>
                        </tr>
                    </thead>
                        <tbody>
                            <c:forEach var="item" items="${arrMesas}">
                                    <tr >
                                        <td >
                                            <a  class="txtIdMesaTable"
                                                id="txtIdMesaTable"
                                                name="txtIdMesaTable"
                                                value="${item.id_mesa}">
                                                    ${item.id_mesa}
                                            </a>
                                        </td>
                                        <td >
                                            <a  class="txtCapacidadTable"
                                                id="txtCapacidadTable"
                                                name="txtCapacidadTable"
                                                value="${item.capacidad}">
                                                    ${item.capacidad}
                                            </a>
                                        </td>                            
                                        <td>
                                            <a  class="txtStatusTable"
                                                id="txtStatusTable"
                                                name="txtStatusTable"
                                                value="${item.status_mesa}">
                                                    ${item.status_mesa}
                                            </a>
                                        </td>                            
                                <form action="controlEditMesas" method="POST">
                                        <td>
                                            <input  class="txtIdMesaEdit"
                                                    type="hidden"
                                                    id="txtIdMesaEdit"
                                                    name="txtIdMesaEdit"
                                                    value="${item.id_mesa}" readonly>
                                            <input class="btn btn-edit btnEditar" 
                                                   type="submit" 
                                                   name="btnEditar"
                                                   id="btnEditar"
                                                   value="Editar">
                                        </td>
                                </form>
                                    </tr>
                            </c:forEach>
                        </tbody>
                </table>
            </div>
            <div class="col-2 "></div>
        </div>
        <!--    /List mesas     -->
     
        
        
    </body>
</html>
