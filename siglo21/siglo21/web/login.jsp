<%-- 
    Document   : login
    Created on : 21-sep-2020, 20:04:06
    Author     : Dr4g0n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->  
    </head>
    
     <body class="backBody"  style="overflow-x: hidden;">
        
        <!--    FormLogin   -->
        <form action="login" method="POST" autocomplete="off">
            <div class="row ">
            <div class="col-2"></div>
            <div class="col-8">
                
                <!-- Usuario -->
                <div class="row sepBodyEspecial">                    
                    <div class="col-lg-1 "></div>
                    <div class="col-lg-2 col-md-2 col-sm-12 font-weight-bold centerTextName">
                        Usuario
                    </div>
                    <div class="col-lg-6 col-md-8 col-sm-12">
                        <input type="text" 
                               name="txtUser"
                               id="txtUser"
                               class="form-control txtUser lower" 
                               placeholder="Ingrese Usuario" 
                               aria-label="Rut" 
                               aria-describedby="addon-wrapping">
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12"></div>
                    <div class="col-lg-1 "></div>
                </div>
                <!-- /Usuario -->
                
                <!-- Contraseña -->
                <div class="row sepBody">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2 col-md-2 col-sm-12 font-weight-bold centerTextName">
                        Contraseña
                    </div>
                    <div class="col-lg-6 col-md-8 col-sm-12">
                        <input type="password" 
                               name="txtPass"
                               id="txtPass"
                               class="form-control txtPass" 
                               placeholder="Ingrese contraseña" 
                               aria-label="Contraseña" 
                               aria-describedby="addon-wrapping"
                               >
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12"></div>
                    <div class="col-lg-1 "></div>
                </div>
                <!-- /Contraseña -->
                
                 <!-- Button send -->
                <div class="row sepBody">
                    <div class="col-12 text-center">
                        <div class="form-group text-center ">                          
                            <input class="btn  btn-lg btn-Siglo font-weight-bold sepBut" 
                                   type="submit" 
                                   value="Ingresar">                          
                       </div>
                    </div>
                </div>
                <!-- /Button Send -->
                
            </div>
            <div class="col-2"></div>
        </div>
        </form>
        <!--    FormLogin   -->
        
        
        <%
             
            
            if(accesa=="false")
            {
        %>
            <!--    alerta de acceso    -->
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="alert alert-danger text-center sepBody" role="alert">
                        <strong>
                            <h3>
                               Usted No esta autorizado a acceder a este sistema
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
            
        
    </body>
</html>
