<%-- 
    Document   : ListadoMesas
    Created on : 29-sep-2020, 17:58:40
    Author     : Dr4g0n
--%>

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
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Listado estado de mesas</h4>
        </div>
        <!-- /Titulo menu -->
        
        <div class="row">
            <!--    sectionReservadas -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <!--    FormReservadas -->
                <form action="" method="POST">
                    <div class="row font-weight-bold sepBottom">
                        <div class="col-1"></div>
                        <div class="col-10">
                             <div class="col-12">Reservadas</div>
                            <table class="table table-striped ">
                                <thead>
                                    <tr>
                                        <th scope="col">Mesa n°</th>
                                        <th scope="col" class="text-center">Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            Mesa 1
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="ver">
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Mesa 3
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="ver">
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Mesa 4
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="ver">
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </form>  
                <!--    /FormReservadas -->
            </div>
            <!--    /sectionReservadas -->
            
            <!--    sectionOcupadas -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <!--    FormOcupadas -->
                <form action="" method="POST">
                    <div class="row font-weight-bold sepBottom">
                        <div class="col-1"></div>
                        <div class="col-10">
                             <div class="col-12">Ocupadas</div>
                            <table class="table table-striped ">
                                <thead>
                                    <tr>
                                        <th scope="col">Mesa n°</th>
                                        <th scope="col" class="text-center">Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            Mesa 2
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="ver">
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Mesa 5
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="ver">
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Mesa 6
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="ver">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mesa 10
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="ver">
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </form>  
                <!--    /FormOcupadas -->
            </div>
            <!--    /sectionOcupadas -->
            
            <!--    sectionLibres   -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <!--    FormLibres -->
                <form action="" method="POST">
                    <div class="row font-weight-bold sepBottom ">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="col-12">Libres</div>
                            <table class="table table-striped ">
                                <thead>
                                    <tr>
                                        <th scope="col">Mesa n°</th>
                                        <th scope="col" class="text-center">Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            Mesa 7
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="Ocupar">
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Mesa 8
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="Ocupar">
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Mesa 9
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="Ocupar">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mesa 11
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="Ocupar">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mesa 12
                                        </td>
                                        <td class="text-center">
                                            <input class="btn btn-SigloTable font-weight-bold" type="submit" value="Ocupar">
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </form>  
                <!--    /FormLibres -->
            </div>
            <!--    /sectionLibres -->
            
            
           
        </div>
        
        
    </body>
</html>
