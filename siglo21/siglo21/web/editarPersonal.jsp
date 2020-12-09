<%-- 
    Document   : editarPersonal
    Created on : 25-oct-2020, 21:53:43
    Author     : Dr4g0n
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.LinkedList"%>
<%@page import="domain.Empleados"%>
<%@page import="services.CargosDAO"%>
<%@page import="domain.Cargos"%>
<%@page import="domain.Empleos"%>
<%@page import="services.EmpleosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
              
            /*
                verificar si existe totem
            */
            boolean existeTotem = false;
            existeTotem = EmpleosDAO.existeUsuarioTotem();
              
            /*
                Carga de Cbox tipos de empleos
            */
                // array y carga de datos del tipo de empleo
                ArrayList<Empleos> arrEmpleo = new ArrayList<Empleos>();
                arrEmpleo = EmpleosDAO.listarEmpleos();
                request.setAttribute("arrEmpleo", arrEmpleo);

            /*
                Carga de Cbox tipos de Cargos
            */
                // array y carga de datps deñ tipo de cargo
                ArrayList<Cargos> arrCargo = new ArrayList<Cargos>();
                arrCargo = CargosDAO.ListarCargos(existeTotem);
                request.setAttribute("arrCargo", arrCargo);
                
                //Recepcion datos from servlet
                LinkedList<Empleados> arrEditEmpleado = (LinkedList<Empleados>)request.getAttribute("arrEditEmpleado");
                request.setAttribute("arrEditEmpleado", arrEditEmpleado);
                String editable = (String)request.getAttribute("empleadoEditado");
                
                // instanciar clases
                Empleados e = new Empleados();
                Cargos c    = new Cargos();
                Empleos em  = new Empleos();
                
                for (int i = 0; i < arrEditEmpleado.size(); i++) {
                    
                    // recorrer y entregar a variables locales
                    int idEmpleadoDBA   = arrEditEmpleado.get(i).getId_empleado();
                    String nombresDBA   = arrEditEmpleado.get(i).getNombres();
                    String apellidosDBA = arrEditEmpleado.get(i).getApellidos();
                    int idEmpleoDBA     = arrEditEmpleado.get(i).getEmpleos().getId_tipo_empleo();
                    int idCargoDBA      = arrEditEmpleado.get(i).getCargos().getId_cargo();
                    int salarioDBA      = arrEditEmpleado.get(i).getSalario();
                    Date nacimientoDBA  = arrEditEmpleado.get(i).getNacimiento();
                    String direccionDBA = arrEditEmpleado.get(i).getDireccion();
                    String telefonoDBA  = arrEditEmpleado.get(i).getTelefono();
                    String emailDBA     = arrEditEmpleado.get(i).getEmail();
                    int añosExpeDBA     = arrEditEmpleado.get(i).getAños_experiencia();
                    String usuarioDBA   = arrEditEmpleado.get(i).getUsuario();
                    String passDBA      = arrEditEmpleado.get(i).getPassword();
                    String statusDBA    = arrEditEmpleado.get(i).getStatus_empleado();
                    String rutDBA       = arrEditEmpleado.get(i).getRut();
                    
                    request.setAttribute("tipoEmpleo", idEmpleoDBA);
                    request.setAttribute("tipoCargo", idCargoDBA);
                    request.setAttribute("tipoStatus", statusDBA);
                    
                    e.setId_empleado(idEmpleadoDBA);
                    e.setNombres(nombresDBA);
                    e.setApellidos(apellidosDBA);
                    em.setId_tipo_empleo(idEmpleoDBA);
                    e.setEmpleos(em);
                    c.setId_cargo(idCargoDBA);
                    e.setCargos(c);
                    e.setSalario(salarioDBA);
                    e.setNacimiento(nacimientoDBA);
                    e.setDireccion(direccionDBA);
                    e.setTelefono(telefonoDBA);
                    e.setEmail(emailDBA);
                    e.setAños_experiencia(añosExpeDBA);
                    e.setUsuario(usuarioDBA);
                    e.setPassword(passDBA);
                    e.setStatus_empleado(statusDBA);
                    e.setRut(rutDBA);
                }
                
                // recepcion de datos para variables del jsp
                int idEmpleado   = e.getId_empleado();
                String nombres   = e.getNombres();
                String apellidos = e.getApellidos();
                int salario      = e.getSalario();
                Date nacimiento  = e.getNacimiento();
                //SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyy");
               // String nacSTR   = e.getNacimiento().toString();
               // Date nacimiento = df.parse(nacSTR);
                String direccion = e.getDireccion();
                String telefono  = e.getTelefono();
                String email     = e.getEmail();
                int añosExper    = e.getAños_experiencia();
                String usuario   = e.getUsuario();
                String password  = e.getPassword();
                String rut       = e.getRut();
                
            if(editable == "true")
            {
        %>
        
        
                <div class="row sepBody">
                    <!-- Titulo menu -->
                    <div class="col-12 titlePage text-center">
                        <h4>Mantenedor Personal</h4>
                    
                        <h5 class="text-ColBg font-weight-bold">Editar información Empleado</h5>
                    </div>
                    <!-- /Titulo menu -->
                </div>

                <!--    formEditEmpleado    -->
                <form action="controlAddEmpleados" method="POST">
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-9">

                            <!-- idEMpleado -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName ocultar">
                                    Id Empleado
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12 ocultar">
                                    <input type="text" 
                                           name="txtIdEmp"
                                           id="txtIdEmp"
                                           class="form-control txtIdEmp ocultar" 
                                           value=<%=idEmpleado%>
                                          >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /IdEmpleado -->

                            <!-- Rut -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName ocultar">
                                    Rut
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12 ocultar">
                                    <input type="text" 
                                           name="txtRutEmpEdit"
                                           id="txtRutEmpEdit"
                                           class="form-control txtRutEmpEdit" 
                                           placeholder="Ingrese Rut"   
                                           readonly
                                           value="<%=rut%>"
                                          >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /Rut -->
                            
                            <!-- Nombres -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Nombres
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <input type="text" 
                                           name="txtNombresEmpEdit"
                                           id="txtNombresEmpEdit"
                                           class="form-control txtNombresEmpEdit" 
                                           placeholder="Ingrese Nombres"   
                                           readonly
                                           value="<%=nombres%>"
                                          >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /Nombres -->

                            <!-- Apellidos -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Apellidos
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <input type="text" 
                                           name="txtApellidosEmpEdit"
                                           id="txtApellidosEmpEdit"
                                           class="form-control txtApellidosEmpEdit" 
                                           placeholder="Ingrese Apellidos"    
                                           readonly
                                           value="<%=apellidos%>"
                                          >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /Apellidos -->

                             <!-- CboTipoEmpleo-->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Tipo Empleo
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <select class="browser-default custom-select  cboTipoEmpleoEdit" 
                                            name="cboTipoEmpleoEdit" 
                                            id="cboTipoEmpleoEdit"  >
                                        <option selected disabled>Seleccionar Estado Empleo...</option>
                                        <c:forEach var="emp" items="${arrEmpleo}" >                  
                                                <option value="${emp.id_tipo_empleo}" ${ emp.id_tipo_empleo == tipoEmpleo ? 'selected' : ''}>${emp.tipo_empleo}</option>
                                        </c:forEach>      
                                        
                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /CboTipoEmpleo -->

                            <!-- cboCargo -->
                            <div class="row sepBody">
                               <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Cargo Personal
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <select class="browser-default custom-select capitalizada cboTipoCargoEdit" 
                                            name="cboTipoCargoEdit" 
                                            id="cboTipoCargoEdit">
                                            <option selected disabled>Seleccionar cargo...</option>
                                    <c:forEach var="car" items="${arrCargo}">
                                        <option value="${car.id_cargo}" ${ car.id_cargo == tipoCargo ? 'selected' : ''}>${car.cargo}</option>
                                    </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /cboCargo -->

                            <!-- Salario -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Salario
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <input type="number" 
                                           name="txtSalarioEmpEdit"
                                           id="txtSalarioEmpEdit"
                                           class="form-control txtSalarioEmpEdit" 
                                           placeholder="Ingrese Salario" 
                                           min="0"
                                           max="3500000"
                                           step="1"
                                           onkeypress="if(event.key==='.' || event.key===','){event.preventDefault(); alert('No puede usar decimales\n solo números enteros')}"
                                           value="<%=salario%>"
                                           >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /Salario -->

                             <!-- Fecha Nacimiento -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Nacimiento
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <div class="form-group"> 
                                <input type="date" 
                                       name="dateNacimientoEmpEdit" 
                                       id="dateNacimientoEmpEdit"
                                       max="2010-09-09" 
                                       min="1920-12-31" data-date-format="dd-MM-yyyy"
                                       class="form-control dateNacimientoEmpEdit lower"
                                       readonly
                                       value="<%=nacimiento%>">
                               </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /Fecha Nacimiento -->

                            <!-- Direccion -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Dirección
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <input type="text" 
                                           name="txtDireccionEmpEdit"
                                           id="txtDireccionEmpEdit"
                                           class="form-control txtDireccionEmpEdit" 
                                           placeholder="Ingrese Dirección"    
                                           value="<%=direccion%>"
                                          >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /Direccion -->

                            <!-- Telefono -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Teléfono
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <input type="text" 
                                           name="txtTelefonoEmpEdit"
                                           id="txtTelefonoEmpEdit"
                                           class="form-control txtTelefonoEmpEdit" 
                                           placeholder="Ingrese Teléfono"            
                                           value="<%=telefono%>"
                                          >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /Telefono -->

                            <!-- Email -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Email
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <input type="email" 
                                           name="txtEmailEmpEdit"
                                           id="txtEmailEmpEdit"
                                           class="form-control txtEmailEmpEdit lower" 
                                           placeholder="Ingrese Email"      
                                           value="<%=email%>"
                                          >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /Email -->

                            <!-- Experiencia -->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Experiencia
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <input type="number" 
                                           name="txtExpeEmpEdit"
                                           id="txtExpeEmpEdit"
                                           class="form-control txtExpeEmpEdit" 
                                           placeholder="Ingrese Años Experiencia" 
                                           min="0"
                                           max="60"
                                           step="1"
                                           onkeypress="if(event.key==='.' || event.key===','){event.preventDefault(); alert('No puede usar decimales\n solo números enteros')}"
                                           value="<%=añosExper%>"
                                           >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- / Experiencia -->

                            <!-- Usuario -->
                            <div class="row sepBody">
                               <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Usuario
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <input type="text" 
                                           name="txtUserEmpEdit"
                                           id="txtUserEmpEdit"
                                           class="form-control txtUserEmpEdit lower" 
                                           placeholder="Ingrese nombre Usuario" 
                                           readonly
                                           min="1"
                                           max="60"
                                           step="1"
                                           value="<%=usuario%>"
                                           onkeypress="if(event.key==='.' || event.key===','){event.preventDefault(); alert('No puede usar decimales\n solo números enteros')}"
                                           >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- / Usuario -->


                            <!-- Contraseña -->
                            <div class="row sepBody">
                               <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Contraseña
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <input type="password" 
                                           name="txtPassEmpEdit"
                                           id="txtPassEmpEdit"
                                           class="form-control txtPassEmpEdit" 
                                           placeholder="Ingrese Contraseña" 
                                           value="<%=password%>"
                                           onkeypress="if(event.key==='.' || event.key===','){event.preventDefault(); alert('No puede usar decimales\n solo números enteros')}"
                                          >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- / Contraseña -->

                            <!-- cboEstado-->
                            <div class="row sepBody">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                                    Estado
                                </div>
                                <div class="col-lg-5 col-md-6 col-sm-12">
                                    <select class="browser-default custom-select  cboStatusEmpEdit" 
                                            name="cboStatusEmpEdit" 
                                            id="cboStatusEmpEdit"  >
                                            <option selected disabled>Seleccionar Estado Empleado...</option>
                                            <option value="ACTIVO" ${tipoStatus == 'ACTIVO' ? 'selected' : ''}>Activo</option>
                                            <option value="NO_ACTI" ${tipoStatus == 'NO_ACTI' ? 'selected' : ''}>Inactivo</option>
                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            </div>
                            <!-- /cboEstado -->

                            <!-- Button send -->
                            <div class="row sepBody">
                                <div class="col-4"></div>
                                <div class="col-4">
                                    <div class="form-group">                          
                                        <input class="btn btn-Siglo btn-block font-weight-bold sepBut" type="submit" value="Guardar">                          
                                   </div>
                                </div>
                                <div class="col-4"></div>
                                </div>                    
                            <!-- /Button Send -->

                        </div>
                        <div class="col-1"></div>
                    </div>
                    <div class="sepBottom"></div>
                </form>
                <!--    /formEditEmpleado    -->

        <%
            }else
            {
                response.sendRedirect("personal.jsp");
            }
        %>
        
    </body>
</html>
