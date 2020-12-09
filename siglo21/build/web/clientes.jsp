<%-- 
    Document   : clientes
    Created on : 27-sep-2020, 18:57:35
    Author     : Dr4g0n
--%>

<%@page import="java.util.LinkedList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="domain.Clientes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenedor Personal</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        
        
        <!-- Titulo menu -->
        <div class="col-12 titlePage text-center">
            <h4>Mantenedor Clientes</h4>
        </div>
        <!-- /Titulo menu -->
        
        <!--    Div SearchAndList    -->  
        
        <div class="SearchAndList">

        <!--    searchClientes    -->        
            <form action="controlListarClientes" method="POST" autocomplete="off">
                <div class="row sepBody ">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="row sepBody">
                            <div class="col-lg-3 col-md-3 col-sm-12 centerTextName  sepBody">
                                Buscar Cliente
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-12 ">
                                <input type="text"
                                       name="txtSearchCli"
                                       id="txtSearchCli"
                                       class="txtSearchCli form-control"
                                       placeholder="Ingrese rut cliente">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12">
                                <input class="btn btn-Siglo  font-weight-bold  " type="submit" value="Buscar">
                            </div>
                        </div>
                    </div>
                    <div class="col-2 "></div>
                    <div class="col-12 sepBottom"></div>
                </div>
            </form>        
        <!--    searchClientes    -->        
        
        
        <!--    Celdas Personal     -->    
        <%
            //clientesArr
            String devuelve = (String)request.getAttribute("devuelve");
            LinkedList<Clientes> clientesArr = (LinkedList<Clientes>)request.getAttribute("clientesArr");
            request.setAttribute("clientesArr", clientesArr);
           
            if(devuelve=="true")
            {
                if(clientesArr == null || clientesArr.isEmpty())
                {
        %>
                        <div class="row">
                            <div class="col-12 text-center text-black sepBottom">
                                <h3>No existen Clientes asociados al Rut ingresado</h3>
                            </div>
                        </div>
        <%
                }else{
                    int contador = 0;
        %>
            <!--    List Clientes       -->
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8 col-md-12 col-sm-12 text-center">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Rut</th>
                                <th scope="col">Nombres</th>
                                <th scope="col">Apellidos</th>
                                <th scope="col">Teléfono</th>                            
                                <th scope="col" >Email</th>
                                <th scope="col" >Estado</th>
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                LinkedList<Clientes> lista = (LinkedList<Clientes>)request.getAttribute("clientesArr");
                                for (int i = 0; i < lista.size(); i++) 
                                {
                                    int idCliente   = lista.get(i).getId_cliente();
                                    String rutCliente   = lista.get(i).getRut_cliente();
                                    String nomCliente   = lista.get(i).getNombres();
                                    String apCliente    = lista.get(i).getApellidos();
                                    String fonoCliente  = lista.get(i).getTelefono();
                                    String emailCliente = lista.get(i).getEmail();
                                    String estadoCliente= lista.get(i).getEstado();
                                    
                                    
                                    contador = contador+1;
                                    
                                    out.println("<tr>");
                                    out.println("<td>");
                                    out.println("<a class='text-black'>"+contador+"</a>" );
                                    out.println("</td>");
                                    
                                    out.println("<td>");
                                    out.println("<a name=rutCliList id=RutCliList>"        +rutCliente+    "</a>" );
                                    out.println("</td>");
                                    
                                    out.println("<td>");
                                    out.println("<a name=nameCliList id=nameCliList>"      +nomCliente+    "</a>" );
                                    out.println("</td>");
                                    
                                    out.println("<td>");
                                    out.println("<a name=apeCliList id=apeCliList>"        +apCliente+     "</a>" );
                                    out.println("</td>");
                                    
                                    out.println("<td>");
                                    out.println("<a name=fonoCliList id=fonoCliList href=tel:"+fonoCliente+">"+fonoCliente+"</a>" );
                                    out.println("</td>");
                                    
                                    if(emailCliente==null)
                                    {
                                        out.println("<td>");
                                        out.println("<a name=emailCliList id=emailCliList class='text-ColBg' >No registra Email</a>" );
                                        out.println("</td>");
                                    }else
                                    {
                                        out.println("<td>");
                                        out.println("<a name=emailCliList id=emailCliList class='lower' >"    +emailCliente+  "</a>" );
                                        out.println("</td>");
                                    }
                                    out.println("<td>");
                                    out.println("<a name=estadoCliList id=estadoCliList>"  +estadoCliente+ "</a>" );
                                    out.println("</td>");
                                   
                                    out.println("<form action=controlEditarCliente method=POST>");
                                    out.println("<td>");
                                    out.println("<input name=idClienteList id=IdClienteList class=ocultar value= "+idCliente+ ">"  );
                                    out.println("<input name=estadoCliList id=estadoCliList class='btn btn-edit btnEditar btnEditarEmp' type=submit value=Editar>" );
                                    out.println("</td>");
                                    out.println("</form>");
                                    
                                    
                                    
                                    
                                    out.println("</tr>");
                                }
                            %>
                          
                        </tbody>
                    </table>
                </div>
                <div class="col-1"></div>
                <div class="col-lg-2 col-md-1"></div>
                <div class="col-12 sepBottom"></div>
            <!--    /List tipo     -->
            </div>
            <!--    /List Clientes      -->
        </div>
        <%
                }
            }
        %>
        <!--    Div SearchAndList    -->  

        <!--    Div CampClientes    -->
        <div class="CampClientes">
            <%
                // recepcion si existe cliente
                String existeCliente    = (String)request.getAttribute("existeCliente");
                String nameExiste       = (String)request.getAttribute("nombreClienteExiste");
                
                // recepcion cliente creado o no
                String creado       = (String)request.getAttribute("clienteAgregado");
                String nameCreado   = (String)request.getAttribute("nombreClienteAdd");
                
                if(existeCliente == "true")
                {
            %>
                    <!--    alerta de Registro existeCli   -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-warning text-center sepBottom " role="alert">
                                <strong>
                                    <h3>
                                        Cliente de RUT  <label class="text-black capitalizada"><%=nameExiste%></label>, se encuentra registrado en el sistema
                                    </h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Registro existeCli   -->
            <%
                }else
                {
                    if(creado == "true")
                    {
            %>
                         <!--    alerta de Registro    -->
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-8">
                                <div class="alert alert-success text-center sepBottom " role="alert">
                                    <strong>
                                        <h3 class="TextBlack">Cliente <label class="text-ColBg capitalizada"><%=nameCreado%></label> ha sido ingresado al sistema con <label class="text-ColBg">Éxito</label> </h3>
                                    </strong> 
                                </div>
                            </div>
                            <div class="col-2"></div>
                        </div>
                        <!--    /alerta de Registro    -->
            <%
                    }
                }
            %>
            
            
            <%
                String editado = (String)request.getAttribute("clienteEditado");
                String nombreFullEdit = (String)request.getAttribute("nombreCliEdit");
                
                if(editado == "true")
                {
            %>
                    <!--    alerta de Registro    -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-success text-center sepBottom " role="alert">
                                <strong>
                                    <h3 class="TextBlack">Cliente <label class="text-ColBg capitalizada"><%=nombreFullEdit%></label> ha sido editado con <label class="text-ColBg">Éxito</label> </h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Registro    -->
            <%
                }
                if(editado == "false")
                {
            %>
                    <!--    alerta de Registro    -->
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="alert alert-danger text-center sepBottom " role="alert">
                                <strong>
                                    <h3 class="TextBlack">Cliente <label class="text-ColBg capitalizada"><%=nombreFullEdit%></label> problemas para editarlo </h3>
                                </strong> 
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <!--    /alerta de Registro    -->
            <%
                }
            %>
            
            
            
            <!--    form    -->
            <form action="controlAddCliente" method="POST" class="SectionCli" name="sectionCli" autocomplete="off">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-9">
                        
                        <!--    IdCli  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12 ocultar">
                                id Cliente
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 ocultar">
                                <input  type="text" 
                                        name="txtIdCli"
                                        id="txtIdCli"
                                        class="form-control txtIdCli ocultar" 
                                        readonly
                                        value=0
                                >
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                        </div>
                        <!--    /IdCli  -->
                        
                        <!--    RutCli  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12">
                                Rut
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <input  type="text" 
                                        name="txtRutCli"
                                        id="txtRutCli"
                                        class="form-control txtRutCli" 
                                        accept=""placeholder="Ingrese Rut"                               
                                >
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                        </div>
                        <!--    /RutCli  -->
                        
                        <!--    NameCli  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12">
                                Nombres
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <input  type="text" 
                                        name="txtNombresCli"
                                        id="txtNombresCli"
                                        class="form-control txtNombresCli" 
                                        placeholder="Ingrese Nombres Cliente"                               
                                >
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                        </div>
                        <!--    /NameCli  -->
                        
                        <!--    ApeCli  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12">
                                Apellidos
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <input  type="text" 
                                        name="txtApellidosCli"
                                        id="txtApellidosCli"
                                        class="form-control txtApellidosCli" 
                                        placeholder="Ingrese Apellidos Cliente"                               
                                >
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                        </div>
                        <!--    /ApeCli  -->
                        
                        <!--    PhoneCli  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12">
                                Teléfono
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <input  type="text" 
                                        name="txtTelefonoCli"
                                        id="txtTelefonoCli"
                                        class="form-control txtTelefonoCli" 
                                        placeholder="Ingrese Teléfono Cliente"                               
                                >
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                        </div>
                        <!--    /PhoneCli  -->
                        
                        <!--    EmailCli  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12">
                                Email
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <input  type="text" 
                                        name="txtEmailCli"
                                        id="txtEmailCli"
                                        class="form-control txtEmailCli" 
                                        placeholder="Ingrese Email Cliente"                               
                                >
                            </div>
                           <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                        </div>
                        <!--    /EmailCli  -->
                        
                        <!--    EstadoCli  -->
                        <div class="row sepBody">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-2 col-md-3 col-sm-12">
                                Estado
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <select class="browser-default custom-select cboEstadoCli" name="cboEstadoCli" id="cboEstadoCli">
                                    <option value="ACTIVO" >ACTIVO</option>
                                    <option value="RECHAZADO">RECHAZADO</option>
                                </select>
                            </div>
                           <div class="col-lg-2 col-md-2 col-sm-12"> </div>
                        </div>
                        <!--    /EstadoCli  -->
                        
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
        <!--    /Div CampClientes    -->
        <div class="col-12 sepBottom"></div>
    </body>
</html>
