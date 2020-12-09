<%-- 
    Document   : header
    Created on : 31-10-2019, 15:11:55
    Author     : Dr4g0n
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href='img/favicon.ico' rel='icon'>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type"  content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap/css/StyleRestaurant.css" >
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-3.4.1.js" ></script>
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
        <script src="bootstrap/js/scriptGeneral.js" ></script>
        <script src="bootstrap/js/jsChef.js" ></script>
        <script src="bootstrap/js/jsAdmin.js" ></script>
        <script src="bootstrap/js/popper.min.js" ></script>
        <script src="bootstrap/js/bootstrap.min.js" ></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        
    </head>
    <body>
        <% 
            if (session == null) 
            { 
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.sendRedirect("index.jsp");
            } 
            // No logged-in user found, so redirect to login page. 
            else { 
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            } 
            
            
             
            String cargo = "sinCargo";
            cargo = (String)session.getAttribute("cargo");
            String idcargo = (String)session.getAttribute("idCargo");
            String accesa = (String)session.getAttribute("Acceso");
            String nombreUsuario = (String)session.getAttribute("Nombre");
            String idAdmin  = (String)session.getAttribute("idAdmin");
            //cargo.equals(null);
                
            if(cargo=="" || cargo== null || cargo == "sinCargo" || cargo =="Bodeguero" || cargo == "Finanza")
            {
        %>

        <nav class="navbar navbar-expand-lg navbar-light backSiglo " >
            <a class="navbar-brand " href="index.jsp">
                <img src="img/LogoRestaurante Siglo 21.png"  height="50" class="d-inline-block align-middle" alt="Logo Siglo XXI">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
<!-- menu libre-->
            <!--    LeftSide    -->
            <div class="collapse navbar-collapse " id="navbarText">
                <ul class="navbar-nav mr-auto ">
                    <li class="nav-item">
                        <a class="nav-link newMenuWhite" href="index.jsp">Inicio</a>                        
                    </li>
                    <li class="nav-item">
                        <a class="nav-link newMenuWhite" href="reservas.jsp">Reservas</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link newMenuWhite" href="carta.jsp">Carta</a>
                    </li>   
                </ul> 
            <!--    /LeftSide   -->
 <!-- /menu libre    -->           
            <!--    RightSide   -->
                <ul class="navbar-nav ml-auto ">
                    <li>
                        <a class="TextBlack newMenublack" href="login.jsp">Login</a>
                    </li>
                    <li>
                         <a class="TextBlack newMenublack" href="registroCliente.jsp">Registro Cliente</a>
                    </li>   
                </ul>
            </div>            
            <!--    /RightSide  -->
        </nav>

        <%
            }

            if(cargo == "Administrador" )
            {
        %>
<!-- menu Administrador    -->
        <nav class="navbar navbar-expand-lg navbar-light backSiglo ">
            <a class="navbar-brand " href="index.jsp">
                <img src="img/LogoRestaurante Siglo 21.png"  height="50" class="d-inline-block align-middle" alt="Logo Siglo XXI">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <!-- Menus de acceso -->
            <div class="collapse navbar-collapse " id="navbarText">
                <ul class="navbar-nav mr-auto ">
                    
                    <!-- Inventario con Sub  -->
                    <li class="nav-item dropdown ">
                        <!-- first   -->
                        <a class="nav-link dropdown-toggle newMenuWhite"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Inventario
                        </a>
                        <!-- /first   -->
                        
                        <!-- /SubFirst   -->
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                            <a class="dropdown-item newDrown" href="controlListarStock">
                                Stock Total
                            </a>  
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item newDrown" href="stockPorProductos.jsp">
                                Por Productos
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item newDrown" href="insumos.jsp">
                                Insumos 
                            </a>
                        </div>
                         <!-- /SubFirst   -->
                    </li>
                    <!--    /Inventario con Sub   -->
                    
                    <!-- Mantenedor con Sub  -->
                    <li class="nav-item dropdown ">
                        <!-- Second   -->
                        <a class="nav-link dropdown-toggle newMenuWhite"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Mantenedores
                        </a>
                        <!-- /Second   -->
                        
                        <!-- /SubSecond   -->
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                            <a class="dropdown-item newDrown" href="controlListarMesas">
                                Mesas
                            </a>  
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item newDrown" href="personal.jsp">
                                Personal
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item newDrown" href="clientes.jsp">
                                Clientes
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item newDrown" href="proveedores.jsp">
                                Proveedores
                            </a>
                        </div>
                         <!-- /SubSecond   -->
                    </li>
                    <!--    /Mantenedor con Sub   -->
                    
                    <!--    Resumen local con Sub  -->
                    <li class="nav-item dropdown ">
                        <!-- thirst   -->
                        <a class="nav-link dropdown-toggle newMenuWhite"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Resumen Local
                        </a>
                        <!-- /thirst   -->
                        
                        <!-- SubThirst  -->
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                            <a class="dropdown-item newDrown" href="reservasDelDia.jsp">
                                Reporte Reservas del dia
                            </a>  
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item newDrown" href="clientesRechazo.jsp">
                                Reporte Clientes
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item newDrown" href="ventasPorCarta.jsp">
                                Reporte Ventas Carta
                            </a>
                            
                        </div>
                         <!-- /SubThirst   -->
                    </li>
                    <!--    /Resumen local con Sub    -->   
                </ul>           
                <ul class="navbar-nav ml-auto  ">                    
                        <label class="textCat">
                            <%=cargo%>
                        </label>                    
                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle newMenublack"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <label class="capitalizada" ><%=nombreUsuario%></label>
                        </a>
                        <form action="logout" method="POST">
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                                <input class="btn btn-block btnCloseSession text-center" type="submit"  value="Cerrar session"   >                      
                            </div>     
                        </form>
                    </li>
                     
                </ul>
            </div>            
            <!-- /Menus de acceso -->
        </nav>
<!-- /menu Administrador    -->

        <%
            }
            else if(cargo == "Garzon" )
            {
        %>
<!--    menu Garzon    -->
        <nav class="navbar navbar-expand-lg navbar-light backSiglo ">
            <a class="navbar-brand " href="index.jsp">
                <img src="img/LogoRestaurante Siglo 21.png"  height="50" class="d-inline-block align-middle" alt="Logo Siglo XXI">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <!-- Menus de acceso -->
            <div class="collapse navbar-collapse " id="navbarText">               
                <ul class="navbar-nav mr-auto ">
                    <li class="nav-item">
                        <a class="nav-link newMenuWhite" href="ingresoPedidos.jsp">Pedidos</a>                        
                    </li>
                    <li class="nav-item">
                        <a class="nav-link newMenuWhite" href="addExtra.jsp">Agregar Extra</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link newMenuWhite" href="listadoMesas.jsp">Estado Mesas</a>
                    </li>   
                </ul> 
            <!--    /LeftSide   -->
                    
                    <!--    /Resumen local con Sub    -->   
                </ul> 
                
                <!-- SideRight  -->
                <ul class="navbar-nav ml-auto  ">                    
                        <label class="textCat">
                            <%=cargo%>
                        </label>               
                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle newMenublack"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <label class="capitalizada"><%=nombreUsuario%></label>
                        </a>
                        <form action="logout" method="POST">
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                                <input class="btn btn-block btnCloseSession text-center" type="submit"  value="Cerrar session"   >                      
                            </div>   
                        </form>                     
                    </li>                     
                </ul>
                <!-- SideRight  -->
            </div>            
            <!-- /Menus de acceso -->
        </nav>
<!--    /menu Garzon    -->

        <%
            }
           else if(cargo=="Chef" )
            {
        %>
<!--    menu Chef    -->
        <nav class="navbar navbar-expand-lg navbar-light backSiglo ">
            <a class="navbar-brand " href="index.jsp">
                <img src="img/LogoRestaurante Siglo 21.png"  height="50" class="d-inline-block align-middle" alt="Logo Siglo XXI">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <!-- Menus de acceso -->
            <div class="collapse navbar-collapse " id="navbarText">               
                <ul class="navbar-nav mr-auto ">
                    <li class="nav-item">
                        <a class="nav-link newMenuWhite" href="verPedidos.jsp">Pedidos</a>                        
                    </li>
                    <li class="nav-item">
                        <a class="nav-link newMenuWhite" href="crearMenu.jsp">Carta</a>
                    </li>

                </ul> 
            <!--    /LeftSide   -->
                    
                    <!--    /Resumen local con Sub    -->   
                </ul>           
                <ul class="navbar-nav ml-auto  ">                    
                        <label class="textCat">
                            <%=cargo%>
                        </label>               
                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle newMenublack"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <label class="capitalizada"><%=nombreUsuario%></label>
                        </a>
                        <form action="logout" method="POST">
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                                <input class="btn btn-block btnCloseSession text-center" type="submit"  value="Cerrar session"   >                      
                            </div>   
                        </form>                         
                    </li>
                     
                </ul>
            </div>            
            <!-- /Menus de acceso -->
        </nav>
<!--    /menu Chef    -->

        <%
            }
            else if(cargo=="Cocinero" )
            {
        %>
<!--    menu Cocinero    -->
        <nav class="navbar navbar-expand-lg navbar-light backSiglo ">
            <a class="navbar-brand " href="index.jsp">
                <img src="img/LogoRestaurante Siglo 21.png"  height="50" class="d-inline-block align-middle" alt="Logo Siglo XXI">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <!-- Menus de acceso -->
            <div class="collapse navbar-collapse " id="navbarText">               
                <ul class="navbar-nav mr-auto ">
                    <li class="nav-item">
                        <a class="nav-link newMenuWhite" href="pedidosCocina.jsp">Preparación</a>                        
                    </li>   
                </ul> 
            <!--    /LeftSide   -->
                    
                    <!--    /Resumen local con Sub    -->   
                </ul>           
                <ul class="navbar-nav ml-auto  ">                    
                        <label class="textCat">
                            <%=cargo%>
                        </label>                     
                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle newMenublack"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <label class="capitalizada"><%=nombreUsuario%></label>
                        </a>
                        <form action="logout" method="POST">
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                                <input class="btn btn-block btnCloseSession text-center" type="submit"  value="Cerrar session"   >                      
                            </div>   
                        </form>                        
                    </li>
                     
                </ul>
            </div>            
            <!-- /Menus de acceso -->
        </nav>
<!--    /menu Cocinero    -->
     <%
            }
            else if(cargo=="Totem" )
            {
        %>
<!--    menu Cocinero    -->
        <nav class="navbar navbar-expand-lg navbar-light backSiglo ">
            <a class="navbar-brand " href="index.jsp">
                <img src="img/LogoRestaurante Siglo 21.png"  height="50" class="d-inline-block align-middle" alt="Logo Siglo XXI">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <!-- Menus de acceso -->
            <div class="collapse navbar-collapse " id="navbarText">               
                
            <!--    /LeftSide   -->
                    
                    <!--    /Resumen local con Sub    -->   
                </ul>           
                <ul class="navbar-nav ml-auto  ">                    
                        <label class="textCatTotem ">
                            <%=cargo%>
                        </label>                    
                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle newMenuTotem"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <label class="capitalizada"><%=nombreUsuario%></label>
                        </a>
                        <form action="logout" method="POST">
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                                <input class="btn btn-block btnCloseSession text-center" type="submit"  value="Cerrar session"   >                      
                            </div>   
                        </form>                        
                    </li>
                     
                </ul>
            </div>            
            <!-- /Menus de acceso -->
        </nav>
<!--    /menu Cocinero    -->
    <%
        }
    %>
    </body>
</html>