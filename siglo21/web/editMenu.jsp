<%-- 
    Document   : editMenu
    Created on : 05-oct-2020, 22:07:58
    Author     : Dr4g0n
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="domain.Carta"%>
<%@page import="services.TipoCartaDAO"%>
<%@page import="domain.TipoCarta"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/jsp; charset=UTF-8" />
        <title>Editar Menu</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
<%
    
    if(session.getAttribute("cargo") !="Chef") {

        response.sendRedirect("index.jsp");
    }
    
    // evita acceso directo sin datos
    String editarCarta = (String)request.getAttribute("editarCarta");
    
    // consulta si tuvo problemas de editar
    String editada = (String)request.getAttribute("editada");
    
    if(editarCarta !="true")
    {
        response.sendRedirect("crearMenu.jsp");
    }
    
    LinkedList<TipoCarta> arrTipoCarta = new LinkedList<TipoCarta>();
    arrTipoCarta = TipoCartaDAO.listadoTipo();
    request.setAttribute("arrTipoCarta", arrTipoCarta);
    
    Carta carta = new Carta();
    TipoCarta tipoC = new TipoCarta();
    
    LinkedList<Carta> arrCarta = new LinkedList<Carta>();
    arrCarta = (LinkedList<Carta>)request.getAttribute("arrCarta");
    
    for (Carta c : arrCarta) 
    {
        int idCartaEditDBA       = c.getId_carta();
        int idTipoCartaEditDBA   = c.getTipoCarta().getId_tipo_carta();
        String descripcionEditBDA= c.getDescripcion_Carta();
        int precioEditDBA        = (int)c.getPrecio();
        String nombreEditDBA     = c.getNombre();
        
        carta.setId_carta(idCartaEditDBA);
        carta.setDescripcion_Carta(descripcionEditBDA);
        carta.setPrecio(precioEditDBA);
        carta.setNombre(nombreEditDBA);
        tipoC.setId_tipo_carta(idTipoCartaEditDBA);
        carta.setTipoCarta(tipoC);
        
    }
    
        int idCartaEdit         = carta.getId_carta();
        int idTipoCartaEdit     = carta.getTipoCarta().getId_tipo_carta();
        request.setAttribute("idTipoCartaEdit", idTipoCartaEdit);
        String descripcionEdit  = carta.getDescripcion_Carta();
        int precioEdit          = (int)carta.getPrecio();
        String nombreEdit       = carta.getNombre();

        
%>
    <body class="backBody">
        
        <div class="row sepBody">                
                <div class="col-12 text-center text-ColBg font-weight-bold">
                    <h5>
                        Editar Menú
                    </h5>
                </div>
            </div>
            <!--    /titleOption -->   
            <%
                if(editada == "false")
                {
            %>
                    <!--    alerta de Edicion    -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-danger text-center sepBody" role="alert">
                                <strong>
                                    <h3 class="capitalizada">
                                        <a class="TextBlack">
                                            Problemas al editar la carta
                                        </a>
                                    </h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Edicion    -->
            <%
                }
            %>
            
            <!--    formEditCarta    -->
            <form action="controlAddCarta" method="POST">
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
                                       value="<%=idCartaEdit%>"
                                      >
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /idMenu    -->
                        
                        
                        <!--    NameEditMenu     -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                Nombre Menú
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12">
                                <input type="text" 
                                       class="form-control EditNameMenu" 
                                       name="EditNameMenu"
                                       id="EditNameMenu"
                                       placeholder="Ingrese Nombre Menú"  
                                       value="<%=nombreEdit%>"
                                      >
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /NameEditMenu    -->
                        
                        <!--   DescriptionEditMenu  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                Descripción
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12">
                                <textarea class="form-control EditDescriptionMenu"
                                          name="EditDescriptionMenu"
                                          id="EditDescriptionMenu"
                                          rows="5" 
                                          style="resize: none;"
                                          placeholder="Ingrese descripci�n del men�"><%=descripcionEdit%></textarea>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /DescriptionEditMenu    -->
                        
                        <!--    cboTipoMenuEdit -->
                        <div class="row sepBody">
                           <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                Tipo Menú
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12">
                                <select class="browser-default custom-select cboTipoMenuEdit" 
                                        name="cboTipoMenuEdit" 
                                        id="cboTipoMenuEdit" >
                                    
                                    <c:forEach var="tipo" items="${arrTipoCarta}">
                                        <option value="${tipo.id_tipo_carta}" ${ tipo.id_tipo_carta == idTipoCartaEdit ? 'selected' : ''} >${tipo.descripcion}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /cboTipoMenuEdit    -->

                        
                        <!--    EditPrecioMenu   -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 centerTextName text-black">
                                Precio Menú
                            </div>
                            <div class="col-lg-5 col-md-6 col-sm-12">
                                <input type="number" 
                                       class="form-control EditPrecio" 
                                       name="EditPrecio"
                                       id="EditPrecio"
                                       placeholder="Ingrese Precio de Menú" 
                                       min="2500"
                                       max="50000"
                                       step="1"
                                       value="<%=precioEdit%>"
                                      >
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                        </div>
                        <!--    /EditPrecioMenu     -->
                        
                         <!-- Button send -->
                        <div class="row sepBody sepBottom">
                            <div class="col-12">
                                <div class="form-group text-center">                          
                                    <input class="btn btn-Siglo btnEditMenu  font-weight-bold sepBut" 
                                           name="btnEditMenu"
                                           id="btnEditMenu"
                                           type="submit" 
                                           value="Guardar">                          
                               </div>
                            </div>
                        </div>                    
                        <!-- /Button Send -->                    
                        
                    </div>
                   <div class="col-1"></div>
                </div>
            </form>
            <!--    /formEditCarta    -->
      
            
    </body>
</html>
