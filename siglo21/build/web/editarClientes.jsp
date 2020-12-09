<%-- 
    Document   : editarClientes
    Created on : 26-oct-2020, 17:55:18
    Author     : Dr4g0n
--%>

<%@page import="domain.Clientes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Personal</title>
        <!-- menu -->
            <%@include file="header.jsp" %>
        <!-- /menu -->
    </head>
    
    <body class="backBody">
        <%
            if(session.getAttribute("cargo") !="Administrador") {
                response.sendRedirect("index.jsp");
            }
            
            
            // recepcion ddatos from servlet
            ArrayList<Clientes> arrCliente = (ArrayList<Clientes>)request.getAttribute("arrCliente");
            request.setAttribute("arrCliente", arrCliente);
            String editable = (String)request.getAttribute("clienteEditable");
            
            Clientes c = new Clientes();
            
            for (int i = 0; i < arrCliente.size(); i++) {
                int idClienteDBA    = arrCliente.get(i).getId_cliente();
                String rutDBA       = arrCliente.get(i).getRut_cliente();
                String nombresDBA   = arrCliente.get(i).getNombres();
                String apellidosDBA = arrCliente.get(i).getApellidos();
                String telefonoDBA  = arrCliente.get(i).getTelefono();
                String emailDBA     = arrCliente.get(i).getEmail();
                String estadoDBA    = arrCliente.get(i).getEstado();
                
                request.setAttribute("estadoCli", estadoDBA);
                
                c.setId_cliente(idClienteDBA);
                c.setRut_cliente(rutDBA);
                c.setNombres(nombresDBA);
                c.setApellidos(apellidosDBA);
                c.setTelefono(telefonoDBA);
                c.setEmail(emailDBA);
            }
            
            int idCliente   = c.getId_cliente();
            String rut      = c.getRut_cliente();
            String nombres  = c.getNombres();
            String apellidos= c.getApellidos();
            String telefono = c.getTelefono();
            String email    = c.getEmail();
            
            if(editable == "true")
            {
        %>
        <!-- Titulo menu -->
        <div class="row sepBody">
            <div class="col-12 titlePage text-center">
                <h4>Mantenedor Clientes</h4>

                <h5 class="text-ColBg font-weight-bold">Editar información Clientes</h5>
            </div>
        </div>
        <!-- /Titulo menu -->
        
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
                                        class="form-control txtIdCli " 
                                        readonly
                                        value=<%=idCliente%>
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
                                        name="txtRutCliEdit"
                                        id="txtRutCliEdit"
                                        class="form-control txtRutCliEdit" 
                                        accept=""placeholder="Ingrese Rut"   
                                        value="<%=rut%>"
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
                                        name="txtNombresCliEdit"
                                        id="txtNombresCliEdit"
                                        class="form-control txtNombresCliEdit" 
                                        placeholder="Ingrese Nombres Cliente"      
                                        value="<%=nombres%>"
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
                                        name="txtApellidosCliEdit"
                                        id="txtApellidosCliEdit"
                                        class="form-control txtApellidosCliEdit" 
                                        placeholder="Ingrese Apellidos Cliente"  
                                        value="<%=apellidos%>"
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
                                        name="txtTelefonoCliEdit"
                                        id="txtTelefonoCliEdit"
                                        class="form-control txtTelefonoCliEdit" 
                                        placeholder="Ingrese Teléfono Cliente" 
                                        value="<%=telefono%>"
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
                                        name="txtEmailCliEdit"
                                        id="txtEmailCliEdit"
                                        class="form-control txtEmailCliEdit" 
                                        placeholder="Ingrese Email Cliente"  
                                        value="<%=email%>"
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
                                <select class="browser-default custom-select cboEstadoCliEdit" name="cboEstadoCliEdit" id="cboEstadoCliEdit">
                                    <option value="ACTIVO"   ${estadoCli == 'ACTIVO' ? 'selected' : ''} >ACTIVO</option>
                                    <option value="RECHAZADO" ${estadoCli == 'RECHAZADO' ? 'selected' : '' } >RECHAZADO</option>
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
                            <div class="col-lg-2 col-md-2 col-sm-12 sepBottom"> </div> 
                        </div>
                        <!--    /BtnSend  -->
                                         
                    </div>
                    <div class="col-1 sepBottom"></div>
                </div>
            </form>
            <!--    /form    -->
        
        <%
            }else
            {
                response.sendRedirect("clientes.jsp");
            }
        %>
    </body>
</html>
