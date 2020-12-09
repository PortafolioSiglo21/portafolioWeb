<%-- 
    Document   : crearMenu
    Created on : 04-oct-2020, 23:00:34
    Author     : Dr4g0n
--%>

<%@page import="services.CartaDAO"%>
<%@page import="domain.Carta"%>
<%@page import="services.TipoCartaDAO"%>
<%@page import="domain.TipoCarta"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="services.ProductosDAO"%>
<%@page import="domain.Productos"%>
<%@page import="java.util.LinkedList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="services.CategoriaDAO"%>
<%@page import="domain.Categorias"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <title>Crear Menú</title>
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-3.4.1.js" ></script>
        <script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
        <script src="bootstrap/js/jsCarta.js" ></script>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
       
        <%
            //  PRODUCTOS
            LinkedList<Productos> arrProd= new LinkedList<Productos>();
            arrProd = ProductosDAO.allProd();
            request.setAttribute("arrProd", arrProd);
            Productos p = new Productos();
            
            //  TIPO DE CARTA
            LinkedList<TipoCarta> arrTipoCarta = new LinkedList<TipoCarta>();
            arrTipoCarta = TipoCartaDAO.listadoTipo();
            request.setAttribute("arrTipoCarta", arrTipoCarta);
            TipoCarta tc = new TipoCarta();
            
            //  CARTA
            LinkedList<Carta> arrCarta = new LinkedList<Carta>();
            arrCarta = CartaDAO.listaCarta();
            request.setAttribute("arrCarta", arrCarta);
            Carta c = new Carta();
            
            // CATEGORIA PRODUCTOS
            LinkedList<Categorias> arrCategorias = new LinkedList<Categorias>();
            arrCategorias = CategoriaDAO.traerCategorias();
            
            
            String nameCarta = (String)request.getAttribute("nameCarta");
            String cartaCreada = (String)request.getAttribute("cartaCreada");
            
            // consulta si fue de editada la carta
            String editada = (String)request.getAttribute("editada");
            String nombreEditada = (String) request.getAttribute("nombreEditada");
         %>
         
       
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Opción Cartas</h4>
        </div>
        <!-- /Titulo menu -->
        
        <%
            if(cartaCreada == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row sepBody">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack">Carta <label class="text-ColBg capitalizada"><%=nameCarta%></label> fue creada en el sistema </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
        <%
            }

            if(editada == "true")
            {
        %>
                <!--    alerta de Registro    -->
                <div class="row sepBody">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack">Carta <label class="text-ColBg capitalizada"><%=nombreEditada%></label> fue editada en el sistema </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro    -->
        <%
            }
        %>
        
        <!--    OptionSelect    -->
        <div class="row sepBody sepBottom">
            <div class="col-2"></div>
            <div class="col-8 text-center">
                <div class="row">
                    <div class="col-4 align-items-end align-content-center text-black">
                        Opción
                    </div>
                    
                    <div class="col-6">
                        <select class="browser-default custom-select cboOptionAddEdit" 
                                id="cboOptionAddEdit" 
                                name="cboOptionAddEdit"
                               onchange="getNewVal(this);">
                            <option value="0">Seleccionar acción</option>
                            <option value="Crear">Crear Menu</option>
                            <option value="Editar">Editar Menu</option>
                        </select>
                    </div>
                    
                </div>
            </div>
            <div class="col-2 sepBottom"></div>
        </div>
        <!--    /OptionSelect    -->
        
        <!--    Div's optionable add  -->
        <div class="crearMenu sepBody sepBottom crearMenu formulario" id="crearMenu" name="crearMenu" style="display:none;" >
            <!--    titleOption -->
            <div class="row sepBody">                
                <div class="col-12 text-center text-ColBg font-weight-bold">
                    <h5>
                        Crear Menú
                    </h5>
                </div>
            </div>
            <!--    /titleOption -->   
            
            <!--    formAddCarta    -->
            <form action="controlAddCarta" method="POST" autocomplete="off">
                <div class="row sepBody">
                    <div class="col-2"></div>
                    <div class="col-9">
                        
                        <!--    idMenu     -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black ocultar">
                                Id Menu
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12 ocultar">
                                <input type="text" 
                                       class="form-control idMenu" 
                                       name="idMenu"
                                       id="idMenu"
                                       placeholder="Ingrese id menu"  
                                       value="0"
                                      >
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /idMenu    -->
                        
                         <!--    cboTipoMenuAdd -->
                        <div class="row sepBody">
                           <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                Tipo Menú
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12">
                                <select class="browser-default custom-select cboTipoMenuAdd " 
                                        name="cboTipoMenuAdd" 
                                        id="cboTipoMenuAdd">
                                    <option selected disabled>Seleccionar Tipo menú...</option>
                                   <%
                                       for (int i = 0; i < arrTipoCarta.size(); i++) {
                                           int idTipo = arrTipoCarta.get(i).getId_tipo_carta();
                                           String descripcion = arrTipoCarta.get(i).getDescripcion();
                                    %>
                                        <option value=<%=idTipo%>><%=descripcion%></option>
                                    <%
                                        }
                                   %>
                                </select>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /cboTipoMenuAdd    -->
                        
                        <!--    NameAddMenu     -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                Nombre Menú
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12">
                                <input type="text" 
                                       name="txtAddNameMenu"
                                       id="txtAddNameMenu"
                                       class="form-control txtAddNameMenu capitalizada"                                        
                                       placeholder="Ingrese Nombre Menú"    
                                       maxlength="80"
                                      >
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /NameAddMenu    -->
                        
                        <!--   DescriptionAddMenu  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                Descripción
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12">
                                <textarea class="form-control txtAddDescriptionMenu capitalizada" 
                                          name="txtAddDescriptionMenu"
                                          id="txtAddDescriptionMenu"
                                          rows="5"
                                          maxlength="250"
                                          style="resize: none;"
                                          placeholder="Ingrese descripción del menú"></textarea>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /DescriptionAddMenu    -->
                        
                        <!--    AddProd  -->
                        <div class="row sepBody sepBottom sepBody " >  
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-1"></div>
                                    <div class="col-10">
                                        <h6 class="TextBlack capitalizada">Seleccionar Producto</h6>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                            </div>
                            
                            
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-1"></div>
                                    <div class="col-10">
                                            <table class=" " id="tblProd">
                                            <tbody>
                                                <tr>
                                                    
                                                    <td>
                                                        <select class="browser-default custom-select cboCategoriaProdCarta" 
                                                                name="cboCategoriaProdCarta" 
                                                                id="cboCategoriaProdCarta" >
                                                            <option value="0">Seleccionar categoria</option>
                                                            <%
                                                                for (int e = 0; e < arrCategorias.size(); e++) 
                                                                {
                                                                    int idCate = arrCategorias.get(e).getId_categoria();
                                                                    String nombreCat = arrCategorias.get(e).getCategoria();
                                                            %>
                                                                    <option value="<%=idCate%>" ><%=nombreCat%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select class="browser-default custom-select cboProductosCatCarta"
                                                                name="cboProductosCatCarta"
                                                                id="cboProductosCatCarta">
                                                            <option value="0">Seleccionar producto</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="text" name='precio' placeholder='precio' class="form-control">
                                                    </td>
                                                    <td>
                                                        <input type="number" name='cantidad' placeholder='cantidad' class="form-control" >
                                                    </td>
                                                   
                                                    <td>
                                                        <a type="button" class="btn btn-success float-left font-weight-bold TextWhite" onclick="add();" >Agregar</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                            </div>
                            <!--    AddProd  -->
                            
                            <!--    ListAddProd  -->
                            
                            <div class="col-12">
                                <div class="row sepBody">
                                    <div class="col-1"></div>
                                    <div class="col-10">
                                        <h6 class="TextBlack capitalizada">Listado Productos Carta</h6>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="row ">
                                    <div class="col-1"></div>
                                    <div class="col-10">
                                        <div class="container">
                                            <div class="row clearfix">
                                                <div class="col-lg-12 col-md-12  column">
                                                    <table class="table table-striped table-hover" id="tab_logic">
                                                            <thead>
                                                                <tr >
                                                                    <th class="text-center">
                                                                        #
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Tipo Producto
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Producto
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Cantidad
                                                                    </th>
                                                                    <th class="text-center">
                                                                        costo
                                                                    </th>
                                                                    <th class="text-center">
                                                                        Acción
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="data" class="text-center">
                                                               
                                                            </tbody>
                                                    </table>
                                                </div>
                                            </div>                                            
                                        </div>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                            </div>
                        </div>
                        <!--    /ListAddProd  -->
                        
                      <!--   costMenu -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                Costo Menú
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12">
                                <input class="form-control font-weight-bold" name="costoMenu" value="" style="width: 250px;  border: none; background-color: transparent;" readonly>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /costMenu    -->
                        
                        <!--   PrecioMenu -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                Precio Menú
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12">
                                <input class="form-control font-weight-bold precioMenu" name="precioMenu" id="precioMenu" value=""  >
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /PrecioMenu    -->
                        
                        <!-- Button send -->
                        <div class="row sepBody sepBottom btnSendAdMenu" >
                            <div class="col-12">
                                <div class="form-group text-center">                          
                                    <input class="btn btn-Siglo btnAddMenu  font-weight-bold sepBut"
                                           name="btnAddMenu"
                                           id="btnAddMenu"
                                           type="submit" value="Guardar">                          
                               </div>
                            </div>
                        </div>                    
                        <!-- /Button Send -->
                    
                        
                    </div>
                   <div class="col-1"></div>
                </div>
            </form>
            <!--    /formAddCarta    -->
        </div>             
        <!--    /Div's optionable add  -->
        
            <!--    Div's optionable Edit  -->
            <div class="editMenu sepBody sepBottom formulario" id="editMenu" name="editMenu" style="display:none;">
                 <!--    titleOption -->
                <%
        if(arrCarta.size() != 0)
        {
    %>
                    <div class="row sepBody">                
                    <div class="col-12 text-center text-ColBg font-weight-bold">
                        <h5>
                            Seleccionar Menú a Editar
                        </h5>
                    </div>
                </div>
                <!--    /titleOption -->   

                <!--    formAddCarta    -->
                <form action="controlEditarCarta" method="POST">
                    <div class="row sepBody">
                        <div class="col-2"></div>
                        <div class="col-9">

                            <!--    cboTipoMenuEdit-->
                            <div class="row sepBody">
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                    Menú
                                </div>
                                <div class="col-lg-7 col-md-6 col-sm-8 ">
                                    <select class="browser-default custom-select cboTipoMenuEdit " 
                                            name="cboTipoMenuEdit" 
                                            id="cboTipoMenuEdit">
                                        <option selected disabled>Seleccionar Tipo menú...</option>
                                        <%
                                            for (int i = 0; i < arrCarta.size(); i++) 
                                            {
                                                int idCarta = arrCarta.get(i).getId_carta();
                                                String nombreCarta = arrCarta.get(i).getNombre();
                                        %>
                                                <option value=<%=idCarta%>> <%=nombreCarta%> </option>
                                        <%
                                            }
                                        %>

                                    </select>
                                </div>

                                <!-- Button send -->                       
                                <div class="col-lg-3 col-md-3 col-sm-4 ">
                                    <div class="form-group text-center">                          
                                        <input class="btn btn-Siglo btnEditMenu  font-weight-bold "
                                               name="btnEditMenu"
                                               id="btnEditMenu"
                                               type="submit" value="Editar">                          
                                   </div>
                                </div>                                    
                                <!-- /Button Send -->
                            </div>
                            <!--    /cboTipoMenuEdit    -->

                        </div>
                       <div class="col-1"></div>
                    </div>
                </form>
                <!--    /formAddCarta    -->
                <%
                    }else{
                %>
                    <div class="row">
                            <div class="col-12 text-center TextBlack capitalizada">
                                <h1>
                                    Debe agregar cartas primero
                                </h1>
                            </div>
                        </div>
                <%
                    }
                %>
            </div>             
            <!--    /Div's optionable Edit  -->
       
    </body>
</html>



