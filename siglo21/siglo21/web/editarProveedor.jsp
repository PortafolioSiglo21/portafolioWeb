<%-- 
    Document   : editarProveedor
    Created on : 26-oct-2020, 19:48:00
    Author     : Dr4g0n
--%>

<%@page import="java.util.LinkedList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Proveedores"%>
<%@page import="services.ProveedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Editar Proveedor</title>
    </head>
    
    <body class="backBody">
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
        <%
            
            if(session.getAttribute("cargo") !="Administrador") {
                response.sendRedirect("index.jsp");
            }
            
            LinkedList<Proveedores> arrProveedor = (LinkedList<Proveedores>)request.getAttribute("arrProveedor");
            request.setAttribute("arrProveedor", arrProveedor);
            
            Proveedores p = new Proveedores();
            
            for (int i = 0; i < arrProveedor.size(); i++) {
                int idProveedorDBA      = arrProveedor.get(i).getId_proveedor();
                String rutProveedorDBA  = arrProveedor.get(i).getRut_proveeedor();
                String nombreproveedorDBA= arrProveedor.get(i).getProveedor();
                String nombreContactoDBA= arrProveedor.get(i).getNombre_contacto();
                String telefonoDBA      = arrProveedor.get(i).getTelefono();
                String sitioWebDBA      = arrProveedor.get(i).getSitio_web();
                String emailDBA         = arrProveedor.get(i).getEmail_proveedor();
                String estadoDBA        = arrProveedor.get(i).getEstado();
                
                request.setAttribute("estadoDBA", estadoDBA);
               
                p.setId_proveedor(idProveedorDBA);
                p.setRut_proveeedor(rutProveedorDBA);
                p.setProveedor(nombreproveedorDBA);
                p.setNombre_contacto(nombreContactoDBA);
                p.setTelefono(telefonoDBA);
                p.setSitio_web(sitioWebDBA);
                p.setEmail_proveedor(emailDBA);
                p.setEstado(estadoDBA);
                
               
            }
            
            int idProveedor         = p.getId_proveedor();
            String rutProveedor     = p.getRut_proveeedor();
            String nombreProveedor  = p.getProveedor();
            String nombreContacto   = p.getNombre_contacto();
            String telefono         = p.getTelefono();
            String web              = p.getSitio_web();
            String email            = p.getEmail_proveedor();
        %>
        
        <div class="row sepBody">
            <!-- Titulo menu -->
            <div class="col-12 titlePage text-center">
                <h4>Mantenedor Proveedores</h4>

                <h5 class="text-ColBg font-weight-bold">Editar información Proveedores</h5>
            </div>
            <!-- /Titulo menu -->
        </div>
        
         <!--    Div CampProovedores    -->
        <div class="CampPro">
            <!--    form    -->
            <form action="controlAddProveedor" method="POST" class="SectionCli" name="sectionCli">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-9">
                     
                            <!--    IdProveedor  -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 ocultar">
                                    Id Proveedor
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 ocultar">
                                    <input  type="hidden" 
                                            name="txtIdProv"
                                            id="txtIdProv"
                                            class="form-control txtIdProv" 
                                            readonly
                                            value=<%=idProveedor%>
                                    >
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                            </div>
                            <!--    /IdProveedor  -->

                            <!--    RutPro  -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12">
                                    Rut Proveedor
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <input  type="text" 
                                            name="txtRutProvEdit"
                                            id="txtRutProvEdit"
                                            class="form-control txtRutProvEdit" 
                                            accept=""placeholder="Ingrese Rut Proveedor"    
                                            readonly
                                            value="<%=rutProveedor%>"
                                    >
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                            </div>
                            <!--    /RutPro  -->

                            <!--    NamePro  -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12">
                                    Nombre
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <input  type="text" 
                                            name="txtNombreProvEdit"
                                            id="txtNombreProvEdit"
                                            class="form-control txtNombreProvEdit" 
                                            placeholder="Ingrese Nombre Empresa"     
                                            value="<%=nombreProveedor%>"
                                    >
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                            </div>
                            <!--    /NamePro  -->

                            <!--    ContactPro  -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12">
                                    Contacto
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <input  type="text" 
                                            name="txtContactoProvEdit"
                                            id="txtContactoProvEdit"
                                            class="form-control txtContactoProvEdit" 
                                            placeholder="Ingrese Nombre Contacto"   
                                            value="<%=nombreContacto%>"
                                    >
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                            </div>
                            <!--    /ContactoPro  -->

                            <!--    PhonePro  -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12">
                                    Teléfono
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <input  type="text" 
                                            name="txtTelefonoProvEdit"
                                            id="txtTelefonoProvEdit"
                                            class="form-control txtTelefonoProvEdit" 
                                            placeholder="Ingrese Teléfono Contacto"      
                                            value="<%=telefono%>"
                                    >
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                            </div>
                            <!--    /PhonePro  -->

                            <!--    EmailPro  -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12">
                                    Web
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <input  type="text"
                                            name="txtWebProvEdit"
                                            id="txtWebProvEdit"
                                            class="form-control txtWebProvEdit lower" 
                                            placeholder="Ingrese web Proveedor"             
                                            value="<%=web%>"
                                    >
                                </div>
                               <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                            </div>
                            <!--    /EmailPro  -->

                             <!--    EmailPro  -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12">
                                    Email
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 ">
                                    <input  type="email" 
                                            name="txtEmailProvEdit"
                                            id="txtEmailProvEdit"
                                            class="form-control txtEmailProvEdit lower" 
                                            placeholder="Ingrese mail Proveedor"       
                                            value="<%=email%>"
                                    >
                                </div>
                               <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                            </div>
                            <!--    /EmailPro  -->

                            <!--    EstadoPro  -->
                            <div class="row sepBody ">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 ">
                                    Estado
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 ">
                                    <select class="browser-default custom-select cboEstadoPro " name="cboEstadoPro" id="cboEstadoPro">
                                        <option value="ACTIVO"      ${estadoDBA == 'ACTIVO' ? 'selected' : ''}    >Activo    </option>
                                        <option value="NO ACTIVO"   ${estadoDBA == 'NO ACTIVO' ? 'selected': ''}>No Activo </option>
                                    </select>                                
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                            </div>
                            <!--    /EstadoPro  -->

                            <!--    EstadoPro  -->
                            <div class="row sepBody ocultar">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 ocultar">
                                    id Administrador
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-12">
                                    <input class="form-control txtIdAdmin"     
                                           name="txtIdAdmin"
                                           id="txtIdAdmin"
                                           readonly
                                           value="<%=idAdmin%>">
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-12">
                                    <input class="form-control txtUserAdmin inpNone"     
                                           name="txtUserAdmin"
                                           id="txtUserAdmin"
                                           readonly
                                           value="<%=nombreUsuario%>">
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                            </div>
                            <!--    /EstadoPro  -->

                            <!--    BtnSend  -->
                            <div class="row sepBody">                            
                                <div class="col-12">
                                    <div class="form-group form-check text-center">
                                        <input class="btn btn-Siglo font-weight-bold sepBut sepBottom" type="submit" value="Guardar">
                                    </div>
                                </div>                            
                                <div class="col-lg-2 col-md-2 col-sm-12 sepBottom"> </div> 
                            </div>
                            <!--    /BtnSend  -->
              
                    </div>
                    <div class="col-1 sepBottom"></div>
                </div>
            </form>
            <!--    /form    -->
        </div>
        <!--    /Div CampProovedores    -->
        
    </body>
</html>
