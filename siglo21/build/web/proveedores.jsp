<%-- 
    Document   : proveedores
    Created on : 27-sep-2020, 20:33:16
    Author     : Dr4g0n
--%>

<%@page import="domain.Proveedores"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenedor Proveedores</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Mantenedor Proveedores</h4>
        </div>
        <!-- /Titulo menu -->
        
        <!--    Div SearchAndList    -->  
        <div class="SearchAndList">

        <!--    SearchRutProveedor    -->        
            <form action="controlListarRutProv" method="POST" autocomplete="off">
                <div class="row sepBody ">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="row sepBody">
                            <div class="col-lg-3 col-md-4 col-sm-12 centerTextName ">
                                Rut Proveedor
                            </div>
                            <div class="col-lg-7 col-md-6 col-sm-12 ">
                                <input type="text"
                                       name="txtRutProSearch"
                                       id="txtRutProSearch"
                                       class="form-control txtRutProSearch"
                                       placeholder="Buscar Proveedor por RUT">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12">
                                <input class="btn btn-Siglo font-weight-bold" type="submit" value="Buscar">
                            </div>
                        </div>
                    </div>
                    <div class="col-2 "></div>
                    <div class="col-12 "></div>
                </div>
            </form>        
        <!--    SearchRutProveedor    -->  
        
        <!--    SearchNameProveedor    -->        
            <form action="controlListarNombreProv" method="POST" autocomplete="off">
                <div class="row sepBody ">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="row ">
                            <div class="col-lg-3 col-md-4 col-sm-12 centerTextName ">
                                Nombre Proveedor
                            </div>
                            <div class="col-lg-7 col-md-6 col-sm-12 ">
                                <input type="text"
                                       name="txtNombreProvSearch"
                                       id="txtNombreProvSearch"
                                       class="form-control txtNombreProvSearch"
                                       placeholder="Buscar Proveedor por Nombre">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12">
                                <input class="btn btn-Siglo font-weight-bold" type="submit" value="Buscar">
                            </div>
                        </div>
                    </div>
                    <div class="col-2 "></div>
                    <div class="col-12 sepBottom"></div>
                </div>
            </form>        
        <!--    SearchNameProveedor    -->   
        <%
            // instanciar contador
            int contador = 0;
            
            // recepcion datos de rut cliente
             String devuelveRut = (String)request.getAttribute("devuelveRutCli");
            LinkedList<Proveedores> rutProvArr = (LinkedList<Proveedores>)request.getAttribute("rutProvArr");
            request.setAttribute("rutProvArr", rutProvArr);
            
            
            
           
            if(devuelveRut == "true")
            {
                if (rutProvArr == null || rutProvArr.isEmpty() ) 
                {
        %>    
                    <!--    alerta de Registro noExisteRut   -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-warning text-center sepBottom capitalizada" role="alert">
                                <strong>
                                    <h3>
                                        no existen proveedores asociados al RUT buscado
                                    </h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Registro noExisteRut   -->
        <%
                }else
                {
        %>
        <!--    ListProveedores     -->    
            <!--    List tipo     -->
            <div class="row">                
                <div class="col-lg-1 col-md-1"></div>
                <div class="col-lg-10 col-md-10 col-sm-12 text-center">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                               <th scope="col">#</th>
                                <th scope="col">Rut</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Contacto</th>
                                <th scope="col">Teléfono</th>                            
                                <th scope="col"></th>                            
                                <th scope="col" >Web</th>
                                <th scope="col" >Email</th>
                                <th scope="col" class="">Estado</th>
                                <th scope="col" class="">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
            <%
                    
                        for (int i = 0; i < rutProvArr.size(); i++) 
                        {
                            int idProveedor         = rutProvArr.get(i).getId_proveedor();
                            String rutProveedor     = rutProvArr.get(i).getRut_proveeedor();
                            String nombreProveedor  = rutProvArr.get(i).getProveedor();
                            String contactoProveedor= rutProvArr.get(i).getNombre_contacto();
                            String telefonoProveedor= rutProvArr.get(i).getTelefono();
                            String webProveedor     = rutProvArr.get(i).getSitio_web();
                            String emaiLproveedor   = rutProvArr.get(i).getEmail_proveedor();
                            String estadoProveedor  = rutProvArr.get(i).getEstado();
                            String idAdminProveedor = rutProvArr.get(i).getAdministrador().getId_admin();
                            
                            contador = contador +1;
                            
                           out.println("<tr>");
                            
                            out.println("<td>");
                            out.println("<a class='text-black'>"+contador+"</a>" );
                            out.println("</td>");
                       
                            out.println("<td>");
                            out.println("<a name=rutCliList id=RutCliList>"        +rutProveedor+      "</a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a name=nameCliList id=nameCliList>"      +nombreProveedor+   "</a>" );
                            out.println("</td>");
                           
                            out.println("<td>");
                            out.println("<a name=apeCliList id=apeCliList>"        +contactoProveedor+ "</a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a href=tel:"+telefonoProveedor+" name=fonoCliList id=fonoCliList>"+telefonoProveedor+"</a>" );
                            out.println("</td>");
                             
                            out.println("<td>");
                            out.println("<a href='https://api.whatsapp.com/send?phone="+telefonoProveedor+"&am' name=wsp id=wsp target=_blank><img src='img/whatsapp.png' class='whatsapp'/></a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a href=https://"+webProveedor+" target=_blank class=lower>" + webProveedor+ "</a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a name=emailCliList id=emailCliList class=lower>"  +emaiLproveedor+ "</a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a name=estadoProveedor id=estadoProveedor class=lower>"  +estadoProveedor+ "</a>" );
                            out.println("</td>");
                            
                            out.println("<form action='controlEditarProveedor' method=POST>");
                            out.println("<td>");
                            out.println("<input name=IdProveList id=IdProveList class='IdProveList ' value="+idProveedor+ " readonly type=hidden >"  );
                            out.println("<input name=btnProList id=btnProList class='btn btn-edit btnEditar btnEditarEmp' type=submit value=Editar>" );
                            out.println("</td>");
                            out.println("</form>");
               
                            out.println("</tr>");
                        }
                    }
                }                    
            %>      
                            
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-1 col-md-1"></div>
                <div class="col-12 "></div>
            <!--    /List tipo     -->
            </div>
            <!-- /ListProveedores  -->
        <%
            

            // recepcion datos de nombre cliente
            String devuelveNombre = (String)request.getAttribute("devuelveNombreCli");
            LinkedList<Proveedores> nombreProvArr = (LinkedList<Proveedores>)request.getAttribute("nombreProvArr");
            request.setAttribute("nombreProvArr", nombreProvArr);
            
            int contadorName = 0;
            if( devuelveNombre == "true")
            {
                if(nombreProvArr == null || nombreProvArr.isEmpty())
                {
        %>
                     <!--    alerta de Registro noExisteNombre   -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-warning text-center sepBottom capitalizada" role="alert">
                                <strong>
                                    <h3>
                                        no existen proveedores asociados al nombre buscado
                                    </h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Registro noExisteNombre   -->
        <%
                }else
                    {
        %>        
        <!--    ListProveedores     -->    
            <!--    List tipo     -->
            <div class="row">                
                <div class="col-lg-1 col-md-1"></div>
                <div class="col-lg-10 col-md-10 col-sm-12 text-center">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                               <th scope="col">#</th>
                                <th scope="col">Rut</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Contacto</th>
                                <th scope="col">Teléfono</th>                            
                                <th scope="col"></th>                            
                                <th scope="col" >Web</th>
                                <th scope="col" >Email</th>
                                <th scope="col" class="">Estado</th>
                                <th scope="col" class="">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                <%
                        for (int i = 0; i < nombreProvArr.size(); i++) 
                        {
                            int idProveedor         = nombreProvArr.get(i).getId_proveedor();
                            String rutProveedor     = nombreProvArr.get(i).getRut_proveeedor();
                            String nombreProveedor  = nombreProvArr.get(i).getProveedor();
                            String contactoProveedor= nombreProvArr.get(i).getNombre_contacto();
                            String telefonoProveedor= nombreProvArr.get(i).getTelefono();
                            String webProveedor     = nombreProvArr.get(i).getSitio_web();
                            String emaiLproveedor   = nombreProvArr.get(i).getEmail_proveedor();
                            String estadoProveedor   = nombreProvArr.get(i).getEstado();
                            String idAdminProveedor = nombreProvArr.get(i).getAdministrador().getId_admin();

                            contadorName = contadorName +1;

                            out.println("<tr>");
                            
                            out.println("<td>");
                            out.println("<a class='text-black'>"+contadorName+"</a>" );
                            out.println("</td>");
                       
                            out.println("<td>");
                            out.println("<a name=rutCliList id=RutCliList>"        +rutProveedor+      "</a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a name=nameCliList id=nameCliList>"      +nombreProveedor+   "</a>" );
                            out.println("</td>");
                           
                            out.println("<td>");
                            out.println("<a name=apeCliList id=apeCliList>"        +contactoProveedor+ "</a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a href=tel:"+telefonoProveedor+" name=fonoCliList id=fonoCliList>"+telefonoProveedor+"</a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a href='https://api.whatsapp.com/send?phone="+telefonoProveedor+"&am' name=wsp id=wsp target=_blank><img src='img/whatsapp.png' class='whatsapp'/></a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a href=https://"+webProveedor+" target=_blank class=lower>" + webProveedor+ "</a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a name=emailCliList id=emailCliList class=lower>"  +emaiLproveedor+ "</a>" );
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println("<a name=emailCliList id=estadoProveeor class=lower>"  +estadoProveedor+ "</a>" );
                            out.println("</td>");
                            
                            out.println("<form action='controlEditarProveedor' method=POST>");
                            out.println("<td>");
                            out.println("<input type=text name=IdProveList id=IdProveList class=IdProveList value="+idProveedor+ " >"  );
                            out.println("<input name=btnProList id=btnProList class='btn btn-edit btnEditar btnEditarEmp' type=submit value=Editar>" );
                            out.println("</td>");
                            out.println("</form>");
               
                            out.println("</tr>");
                        }
                    }
                    
                %>      
                            
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-1 col-md-1"></div>
                <div class="col-12 sepBottom"></div>
            <!--    /List tipo     -->
            </div>
            <!-- /ListProveedores  -->
        <%
            }
        %>
        </div>
        <!--    Div SearchAndList    --> 
        
        
        <%
            // obtener info de servlet
            // agregado
            String nameProvAdded = (String)request.getAttribute("nameProvAdd");
            String provAdded     = (String)request.getAttribute("provAdd");
            
            // existe
            String numRutExiste     = (String)request.getAttribute("numRutExiste");
            String rutExiste        = (String)request.getAttribute("existeRut");
            
            if(rutExiste == "true")
            {
        %>
                <!--    alerta de Registro noExisteRut   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBottom capitalizada" role="alert">
                            <strong>
                                <h3>
                                    El rut <label class="text-black"><%=numRutExiste%></label> ya se encuentra registrado
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de Registro noExisteRut   -->
        <%
            }else if(provAdded == "true")
            {
        %>
                <!--    alerta de Registro noExisteRut   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack">Proveedor <label class="text-ColBg capitalizada"><%=nameProvAdded%></label> ha sido ingresado al sistema con <label class="text-ColBg">Éxito</label> </h3>
                            </strong> 
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
                <!--    /alerta de Registro noExisteRut   -->
        <%
            }
            
            String editado      = (String) request.getAttribute("provEdit");
            String nameProvEdit = (String)request.getAttribute("nameProvEdit");
            
            if(editado == "true")
            {
        %>
                <!--    alerta de Registro Editado true   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-success text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack">Proveedor <label class="text-ColBg capitalizada"><%=nameProvEdit%></label> ha sido editado con <label class="text-ColBg">Éxito</label> </h3>
                            </strong> 
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
                <!--    /alerta de Registro Editado true   -->
        <%
            }else if(editado == "false")
            {
        %>
                <!--    alerta de Registro Editado true   -->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-warning text-center sepBottom " role="alert">
                            <strong>
                                <h3 class="TextBlack">Proveedor <label class="text-ColBg capitalizada"><%=nameProvEdit%></label> no ha sido posible editar</h3>
                            </strong> 
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
                <!--    /alerta de Registro Editado true   -->
        <%
            }
        %>
        
        <!--    Div CampProovedores    -->
        <div class="CampPro" >
            <!--    form    -->
            <form action="controlAddProveedor" method="POST" class="SectionCli" name="sectionCli" autocomplete="off">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-9">
                        
                        <!--    IdProveedor  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 ocultar">
                                Id Proveedor
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <input  type="text" 
                                        name="txtIdProv"
                                        id="txtIdProv"
                                        class="form-control txtIdProv" 
                                        value=0                              
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
                                        name="txtRutProv"
                                        id="txtRutProv"
                                        class="form-control txtRutProv" 
                                        accept=""placeholder="Ingrese Rut Proveedor"                               
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
                                        name="txtNombreProv"
                                        id="txtNombreProv"
                                        class="form-control txtNombreProv" 
                                        accept=""placeholder="Ingrese Nombre Empresa"                               
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
                                        name="txtContactoProv"
                                        id="txtContactoProv"
                                        class="form-control txtContactoProv" 
                                        accept=""placeholder="Ingrese Nombre Contacto"                               
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
                                        name="txtTelefonoProv"
                                        id="txtTelefonoProv"
                                        class="form-control txtTelefonoProv" 
                                        accept=""placeholder="Ingrese Teléfono Contacto"                               
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
                                        name="txtWebProv"
                                        id="txtWebProv"
                                        class="form-control txtWebProv lower" 
                                        placeholder="Ingrese web Proveedor"                               
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
                                        name="txtEmailProv"
                                        id="txtEmailProv"
                                        class="form-control txtEmailProv lower" 
                                        accept=""placeholder="Ingrese mail Proveedor"                               
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
                                    <option value="ACTIVO" >Activo</option>
                                    <option value="NO ACTIVO">No Activo</option>
                                </select>                                
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                        </div>
                        <!--    /EstadoPro  -->
                        
                        <!--    EstadoPro  -->
                        <div class="row sepBody ">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 ">
                                id Administrador
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-12">
                                <input  type="text"
                                        class="form-control txtIdAdmin "     
                                        name="txtIdAdmin"
                                        id="txtIdAdmin"
                                        value="<%=idAdmin%>">
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-12 ">
                                <input  type="hidden"
                                        class="form-control txtUserAdmin"     
                                        name="txtUserAdmin"
                                        id="txtUserAdmin"
                                        value="<%=nombreUsuario%>">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                        </div>
                        <!--    /EstadoPro  -->
                        
                        <!--    BtnSend  -->
                        <div class="row sepBody">                            
                            <div class="col-12">
                                <div class="form-group form-check text-center">
                                    <input class="btn btn-Siglo font-weight-bold sepBut" type="submit" value="Guardar">
                                </div>
                            </div>                            
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div> 
                        </div>
                        <!--    /BtnSend  -->
                                         
                    </div>
                    <div class="col-1 "></div>
                </div>
            </form>
            <!--    /form    -->
        </div>
        <!--    /Div CampProovedores    -->
        <div class="col-12 sepBottom"></div>
    </body>
</html>
