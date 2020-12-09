<%-- 
    Document   : registroCliente
    Created on : 21-sep-2020, 20:20:41
    Author     : Dr4g0n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Cliente</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody"  style="overflow-x: hidden;">
        
               
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Registro Cliente</h4>
        </div>
        <!-- /Titulo menu -->
        
         <%
            String existeOno = (String)request.getAttribute("existeCliente");
            String AddCli = (String)request.getAttribute("clienteAgregado");
            String nomCliAdd = (String)request.getAttribute("nombreClienteAgregado");
            String nomCli = (String)request.getAttribute("nombreCliente");
            
            if(existeOno=="true")
            {
        %>
            <!--    alerta de Registro    -->
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="alert alert-warning text-center sepBottom " role="alert">
                        <strong>
                            <h3 class="capitalizada TextBlack">
                                ya cuenta con registro en nuestro sistema
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
                if(AddCli == "true")
                {
        %>
                    <!--    alerta de Registro    -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-success text-center sepBottom " role="alert">
                                <strong>
                                    <h3 class="TextBlack">Cliente <label class="text-ColBg capitalizada"><%=nomCliAdd%></label> ha sido registrado con éxito</h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Registro    -->
        <%
                }
            }
            String sinRegistro = (String)request.getAttribute("faltaRegistro");
            if(sinRegistro == "true")
            {
        %>
                 <!--    alerta de Registro    -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-warning text-center sepBottom " role="alert">
                                <strong>
                                    <h3 class="TextBlack">Cliente, antes de reservar, debe registrarse en nuestro sistema</h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Registro    -->
        <%
            }
        %>
                    
       
        
        
        <!--    FormRegCli  -->
        <form id="frmRegCli" action="controlRegCliente" method="POST" autocomplete="off">
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <!-- Rut -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                            Rut
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <input type="text" 
                                   name="txtRutCli"
                                   id="txtRutCli"
                                   class="form-control txtRutCli" 
                                   placeholder="Ingrese un rut" 
                                   aria-label="Rut" 
                                   aria-describedby="addon-wrapping"
                                   required>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                        </div>
                    </div>
                    <!-- /Rut -->

                    <!-- Nombres -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                            Nombres
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <input type="text" 
                                   name="txtNombresCli"
                                   id="txtNombresCli"
                                   class="form-control txtNombresCli" 
                                   placeholder="Ingrese Nombres"    
                                   required
                                  >
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                        </div>
                    </div>
                    <!-- /Nombres -->

                     <!-- Apellidos -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                            Apellidos
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <input type="text" 
                                   name="txtApellidosCli"
                                   id="txtApellidosCli"
                                   class="form-control txtApellidosCli" 
                                   placeholder="Ingrese Apellidos" 
                                   required
                                  >
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                        </div>
                    </div>
                    <!-- /Apellidos -->

                     <!-- Telefono -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                            Telefono
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <div class="form-group"> 
                                <input type="text" 
                                       name="txtTelefonoCli"
                                       id="txtTelefonoCli"
                                       class="form-control txtTelefonoCli" 
                                       placeholder="Ingrese Telefono de contacto"    
                                       required
                                >
                           </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                        </div>
                    </div>
                    <!-- /Telefono -->

                     <!-- Email -->
                    <div class="row sepBody">
                        <div class="col-lg-2 col-md-2 col-sm-12 centerTextName">
                            Email
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <div class="form-group"> 
                              <input type="email" 
                                     name="txtEmailCli"
                                     id="txtEmailCli"
                                     class="form-control txtEmailCli lower" 
                                     placeholder="Ingrese Email"   
                                     required
                                >
                           </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                        </div>
                    </div>
                    <!-- /Email -->


                     <!-- Button send -->
                    <div class="row sepBody sepBottom">
                        <div class="col-12 text-center">
                            <div class="form-group">                          
                                <input class="btn btn-Siglo btn-lg  font-weight-bold sepBut btnRegistrarCli" type="submit" value="Registrar">                          
                           </div>
                        </div>
                    </div>
                    <!-- /Button Send -->


                <div class="col-2"></div>
            </div>           
        </form>
        <!--    FormRegCli  -->
        
       
        
    </body>
    
    
    
</html>
