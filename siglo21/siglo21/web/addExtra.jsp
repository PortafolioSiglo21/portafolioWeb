<%-- 
    Document   : addExtra
    Created on : 29-sep-2020, 11:26:45
    Author     : Dr4g0n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar Extra</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Agregar Extra a Mesa</h4>
        </div>
        <!-- /Titulo menu -->
        
        <!--    FormAddExtra    -->
        <form action="" method="POST" >
            <div class="row sepBody">
                <div class="col-2"></div>
                <div class="col-8">
                    
                    <!--    selectMesa  -->
                    <div class="row sepBody sepBottom">
                        <div class="col-lg-2 col-md-2 col-sm-12">
                            Mesa
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <select class="browser-default custom-select cboSelAddMesa">
                                <option value="" selected disabled>Seleccionar mesa...</option>
                                <option value="1">Mesa 1</option>
                                <option value="2">Mesa 2</option>
                                <option value="3">Mesa 3</option>
                                <option value="3">Mesa 4</option>
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-2"></div>
                    </div>
                    <!--    /selectMesa  -->
                    
                    <!--    TextAdd  -->
                    <div class="row  ">
                        <div class="col-lg-2 col-md-2 col-sm-12">
                           
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <h6>Agregar Productos</h6>
                        </div>
                        <div class="col-lg-2 col-md-2"></div>
                    </div>
                    <!--    /TextAdd  -->
                    
                    <!--    AddProd  -->
                    <div class="row sepBody sepBottom">                        
                        <div class="col-12">
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
                                            <option value="1">Lomo Liso wayiu al champiñon </option>
                                            <option value="2">Mesa 2</option>
                                            <option value="3">Mesa 3</option>
                                            <option value="3">Mesa 4</option>
                                            <option value="3">Mesa 5</option>
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
                    </div>
                    <!--    /AddProd  -->
                    
                    <!-- Button send -->
                    <div class="row sepBody sepBottom">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="form-group text-center">                          
                                <input class="btn btn-Siglo  font-weight-bold sepBut" type="submit" value="Agregar pedido">                          
                           </div>
                        </div>
                        <div class="col-2"></div>
                        </div>
                    </div>
                    <!-- /Button Send -->
                    
                </div>
                <div class="col-2"></div>
            </div>
        </form>
        <!--    /FormAddExtra    -->

        
    </body>
</html>
