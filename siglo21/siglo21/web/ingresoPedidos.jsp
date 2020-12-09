<%-- 
    Document   : pedidos
    Created on : 29-sep-2020, 11:18:45
    Author     : Dr4g0n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso de Pedidos</title>
         <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
       
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Pedidos</h4>
        </div>
        <!-- /Titulo menu -->
        
        <div class="row">
            <!--   sectionEntradas  --> 
            <div class="col-lg-6 col-md-12 col-sm-12">  
                <!--    titleIn -->
                <div class="row">
                    <div class="col-1 "></div>
                    <div class="col-10 ">
                        <label class="lblPedido">Entradas</label>
                    </div>
                    <div class="col-1 "></div>
                </div>
                <!--    /titleIn -->

                <!--    AddProdEntradas  -->
                <div class="row  sepBottom">
                    <div class="col-1"></div>
                    <div class="col-10">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center">Tipo Producto</th>
                                    <th scope="col" class="text-center">Cantidad</th>
                                    <th scope="col" colspan="2" class="text-center"> Acción</th>

                                </tr>
                            </thead>
                            <tr>
                                <td>
                                    <select class="browser-default custom-select ">
                                        <option selected>Seleccionar Producto</option>
                                        <option value="1">Ensalada Cesar </option>
                                        <option value="2">Empanadas 12uni</option>
                                        <option value="3">Machas parmesanas</option>
                                        <option value="3">Ensaladas Temporada</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="number"
                                           class="form-control"
                                           min="1"
                                           max="16"
                                           step="1"
                                           placeholder="cant"
                                           onkeypress="if(event.key ==='.' || event.key===','){event.preventDefault();alert('no puede usar simbolos decimales\nPor favor, ingrese valores enteros')}">
                                </td>
                                <td class="text-center">
                                    <input type=button class="btnAgregar btn btn-success TextWhite" value="+">
                                </td>
                                <td class="text-center">
                                    <input type=button class="btnAgregar btn btn-danger TextWhite" value="-">
                                </td>

                            </tr>
                        </table>
                    </div>
                    <div class="col-1"></div>
                </div>                
                <!--    /AddProdEntradas  -->
            </div>
            <!--   /sectionEntradas  --> 
            
            <!--   sectionPrincipal  --> 
            <div class="col-lg-6 col-md-12 col-sm-12">
                <!--    titleIn -->
                <div class="row">
                    <div class="col-1 "></div>
                    <div class="col-10 ">
                        <label class="lblPedido">
                            Principal
                        </label>
                    </div>
                    <div class="col-1 "></div>
                </div>
                <!--    /titleIn -->

                <!--    AddProdEntradas  -->
                <div class="row  sepBottom">
                    <div class="col-1"></div>
                    <div class="col-10">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center">Tipo Producto</th>
                                    <th scope="col" class="text-center">Cantidad</th>
                                    <th scope="col" colspan="2" class="text-center"> Acción</th>

                                </tr>
                            </thead>
                            <tr>
                                <td>
                                    <select class="browser-default custom-select ">
                                        <option selected>Seleccionar Producto</option>
                                        <option value="1">Shapsui mongoliana</option>
                                        <option value="2">Risotto </option>
                                        <option value="3">Lomo Liso Wagyiu al champiñon</option>
                                        <option value="3">Filete de Res acompañado setas del bosque </option>
                                    </select>
                                </td>
                                <td>
                                    <input type="number"
                                           class="form-control"
                                           min="1"
                                           max="16"
                                           step="1"
                                           placeholder="cant"
                                           onkeypress="if(event.key ==='.' || event.key===','){event.preventDefault();alert('no puede usar simbolos decimales\nPor favor, ingrese valores enteros')}">
                                </td>
                                <td class="text-center">
                                    <input type=button class="btnAgregar btn btn-success TextWhite" value="+">
                                </td>
                                <td class="text-center">
                                    <input type=button class="btnAgregar btn btn-danger TextWhite" value="-">
                                </td>

                            </tr>
                        </table>
                    </div>
                    <div class="col-1"></div>
                </div>                
                <!--    /AddProdEntradas  -->
            </div>
            <!--   /sectionPrincipal    --> 
            
            <!--   sectionPostres   --> 
            <div class="col-lg-6 col-md-12 col-sm-12">
                <!--    titleIn -->
                <div class="row">
                    <div class="col-1 "></div>
                    <div class="col-10 ">
                        <label class="lblPedido">
                            Postres
                        </label>
                    </div>
                    <div class="col-1 "></div>
                </div>
                <!--    /titleIn -->

                <!--    AddProdPostres  -->
                <div class="row  sepBottom">
                    <div class="col-1"></div>
                    <div class="col-10">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center">Tipo Producto</th>
                                    <th scope="col" class="text-center">Cantidad</th>
                                    <th scope="col" colspan="2" class="text-center"> Acción</th>

                                </tr>
                            </thead>
                            <tr>
                                <td>
                                    <select class="browser-default custom-select ">
                                        <option selected disabled>Seleccionar Producto</option>
                                        <option value="1">Helado</option>
                                        <option value="2">Torta </option>
                                        <option value="3">helado frutos del bosque y frutos secos</option>                                        
                                    </select>
                                </td>
                                <td>
                                    <input type="number"
                                           class="form-control"
                                           min="1"
                                           max="16"
                                           step="1"
                                           placeholder="cant"
                                           onkeypress="if(event.key ==='.' || event.key===','){event.preventDefault();alert('no puede usar simbolos decimales\nPor favor, ingrese valores enteros')}">
                                </td>
                                <td class="text-center">
                                    <input type=button class="btnAgregar btn btn-success TextWhite" value="+">
                                </td>
                                <td class="text-center">
                                    <input type=button class="btnAgregar btn btn-danger TextWhite" value="-">
                                </td>

                            </tr>
                        </table>
                    </div>
                    <div class="col-1"></div>
                </div>                
                <!--    /AddProdPostres  -->
            </div>
            <!--   /sectionPostres  --> 
            
            <!--   sectionBebestibles  --> 
             <div class="col-lg-6 col-md-12 col-sm-12">
                <!--    titleIn -->
                <div class="row">
                    <div class="col-1 "></div>
                    <div class="col-10 ">
                        <label class="lblPedido">
                            Bebestibles
                        </label>
                    </div>
                    <div class="col-1 "></div>
                </div>
                <!--    /titleIn -->

                <!--    AddProdBebestibles  -->
                <div class="row  sepBottom">
                    <div class="col-1"></div>
                    <div class="col-10">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center">Tipo Producto</th>
                                    <th scope="col" class="text-center">Cantidad</th>
                                    <th scope="col" colspan="2" class="text-center"> Acción</th>

                                </tr>
                            </thead>
                            <tr>
                                <td>
                                    <select class="browser-default custom-select ">
                                        <option selected disabled>Seleccionar Producto</option>
                                        <option value="1">Vino</option>
                                        <option value="2">ron </option>
                                        <option value="3">Jugo de Maracuya</option>                                        
                                    </select>
                                </td>
                                <td>
                                    <input type="number"
                                           class="form-control"
                                           min="1"
                                           max="16"
                                           step="1"
                                           placeholder="cant"
                                           onkeypress="if(event.key ==='.' || event.key===','){event.preventDefault();alert('no puede usar simbolos decimales\nPor favor, ingrese valores enteros')}">
                                </td>
                                <td class="text-center">
                                    <input type=button class="btnAgregar btn btn-success TextWhite" value="+">
                                </td>
                                <td class="text-center">
                                    <input type=button class="btnAgregar btn btn-danger TextWhite" value="-">
                                </td>

                            </tr>
                        </table>
                    </div>
                    <div class="col-1"></div>
                </div>                
                <!--    /AddProdBebestibles  -->
            </div>
            <!--   /sectionBebestibles  --> 

            <!--   sectionBtn  --> 
            <div class="col-12 sepBottom sepBody">
                <!-- Button send -->
                    <div class="row sepBody">
                        
                        <div class="col-12 text-center">
                            <div class="form-group">                          
                                <input class="btn btn-Siglo font-weight-bold sepBut" type="submit" value="Crear Pedido">                          
                           </div>
                        </div>
                       
                        </div>                    
                    <!-- /Button Send -->
            </div>
            <!--   /sectionBtn  --> 
            
        </div>
        
    </body>
</html>
