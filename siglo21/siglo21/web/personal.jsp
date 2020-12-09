<%-- 
    Document   : personal
    Created on : 26-sep-2020, 17:39:03
    Author     : Dr4g0n
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="domain.Empleados"%>
<%@page import="services.CargosDAO"%>
<%@page import="domain.Cargos"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="services.EmpleosDAO"%>
<%@page import="domain.Empleos"%>
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
            <h4>Mantenedor Personal</h4>
        </div>
        <!-- /Titulo menu -->
        <%
            /*
                verificar si existe totem
            */
            boolean existeTotem = false;
            existeTotem = EmpleosDAO.existeUsuarioTotem();
            
            /*
                Carga de Cbox tipos de empleos
            */
                // array y carga de datos del tipo de empleo
                ArrayList<Empleos> empleosArr = new ArrayList<Empleos>();
                empleosArr = EmpleosDAO.listarEmpleos();
                request.setAttribute("empleosArr", empleosArr);

            /*
                Carga de Cbox tipos de Cargos
            */
                // array y carga de datps deñ tipo de cargo
                ArrayList<Cargos> cargosArr = new ArrayList<Cargos>();
                cargosArr = CargosDAO.ListarCargos(existeTotem);
                request.setAttribute("cargosArr", cargosArr);
                
        %>
        
    <!--    Div SearchAndList    -->  
    <div class="SearchAndList">
    <!--    ListPersonal    -->        
        <form action="controlListarEmpleados" method="POST">
            <div class="row sepBody ">
                <div class="col-2"></div>
                <div class="col-8">
                    
                    <!--    cargo   -->
                    <div class="row sepBody">                       
                        <div class="col-lg-3 col-md-3 col-sm-12 centerTextName  sepBody">
                            Buscar por Cargo
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-12 ">
                            <select class="browser-default custom-select cboTipoCargoSearch" 
                                    name="cboTipoCargoSearch" 
                                    id="cboTipoCargoSearch" >
                                <option value="0">Todos los cargos</option>
                                <c:forEach var="car" items="${cargosArr}">
                                    <option value="${car.id_cargo}" >${car.cargo}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <input class="btn btn-Siglo  font-weight-bold  " type="submit" value="Buscar">
                        </div>
                    </div>
                     <!--    /cargo   -->
                     
                </div>
                <div class="col-2 "></div>
                <div class="col-12 "></div>
            </div>
        </form>        
    <!--    ListPersonal    -->
    
    <!--    Celdas Personal     -->  
    <%
        String devuelve = (String)request.getAttribute("devuelve");
        ArrayList<Empleados> listEmpleado = (ArrayList<Empleados>)request.getAttribute("empleadosArr");
        request.setAttribute("listarEmpCargo", listEmpleado);
        

        if(devuelve == "true")
        {
            if(listEmpleado == null || listEmpleado.isEmpty())
            {
    %>
                <!--    alerta de acceso    -->
                <div class="row sepBody">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="alert alert-danger text-center sepBody" role="alert">
                            <strong>
                                <h3 class="capitalizada">
                                  no existen empleados para la categoria consultada
                                </h3>
                            </strong> 
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <!--    /alerta de acceso    -->
    <%
            }else{
                 int contador = 0;
    %>
            
            <!--    List tipo     -->
            <div class="row sepBody ">
                <div class="col-lg-2"></div>
                <div class="col-lg-8 col-md-12 col-sm-12 text-center">
                    <table class="table table-striped tblListEmpleados">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Rut</th>
                                <th scope="col">Nombres</th>
                                <th scope="col">Apellidos</th>
                                <th scope="col">Empleo</th>
                                <th scope="col">Cargo</th>
                                <th scope="col">Salario</th>                                    
                                <th scope="col" class="ocultar">Nacimiento</th>
                                <th scope="col" class="ocultar">Dirección</th>                                    
                                <th scope="col">Teléfono</th>
                                <th scope="col" class="ocultar">Email</th>
                                <th scope="col" class="ocultar">Años Experiencia</th>
                                <th scope="col" class="ocultar">Usuario</th>
                                <th scope="col" class="ocultar">Contraseña</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" items="${listarEmpCargo}">
                                <tr class="lower">  
                                    <th scope="row"><%=contador = contador+1%></th>
                                    <td>
                                        <a class="txtRutList "   value="${list.rut}"               >${list.rut}                </a>
                                    </td>
                                    <td>
                                        <a class="txtNombreList "   value="${list.nombres}"               >${list.nombres}                </a>
                                    </td>
                                    <td>
                                        <a class="txtApellidosList"value="${list.apellidos}"               >${list.apellidos}              </a>
                                    </td>
                                    <td>
                                        <a class="txtEmpleoList"   value="${list.empleos.id_tipo_empleo}"  >${list.empleos.tipo_empleo}    </a>
                                    </td>
                                    <td>
                                        <a class="txtCargoList"    value="${list.cargos.id_cargo}"         >${list.cargos.cargo}           </a>
                                    </td>
                                    <td>
                                        
                                        <a class="txtSalaryList number"   value="${list.salario}"                 >${list.salario}                </a>
                                    </td>
                                    <td class="ocultar">
                                        <a class="txtNacimientoList" value="${list.nacimiento}"            >${list.nacimiento}             </a>
                                    </td>
                                    <td class="ocultar">
                                        <a  class="txtNDireccionList" value="${list.direccion}"            >${list.direccion}              </a>
                                    </td>
                                    <td>
                                        <a  class="txtTelefonoList" value="${list.telefono}" href="tel:${list.telefono}">${list.telefono} </a>              
                                    </td>
                                    <td class="ocultar">
                                        <a  class="txtEmailList" value="${list.email}"                     >${list.email}                 </a>
                                    </td>
                                    <td class="ocultar">
                                        <a class="txtAñoExperienciaList"value="${list.años_experiencia}"   >${list.años_experiencia}       </a>
                                    </td>
                                    <td class="ocultar">
                                        <a class="txtUsuarioList" value="${list.usuario}"                  >${list.usuario}                </a>
                                    </td>
                                    <td class="ocultar">
                                        <a class="txtContraseñaList" value="${list.password}"              >${list.password}                </a>
                                    </td>
                                    <td class="">
                                        <a class="txtStatusTable"  value="${list.status_empleado}"         >${list.status_empleado}        </a>
                                    </td>
                                    <form action="controlEditEmpleados" method="POST">
                                        <td class="">
                                            <input class="txtIdEmpleadoEdit ocultar" 
                                                   name="txtIdEmpleadoEdit" 
                                                   id="txtIdEmpleadoEdit" 
                                                   value="${list.id_empleado}"  readonly>
                                            <input  class="btn btn-edit btnEditar btnEditarEmp" 
                                                    type="submit"
                                                    name="btnEditarEmp"
                                                    id="btnEditarEmp"
                                                    value="Editar">
                                        </td>
                                    </form>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>                
                <div class="col-lg-2"></div>            
            </div>
            <!--    /List tipo     -->
    <%
            }
        }
    %>
            <!--    /Separador final     -->
            <div class="col-12 sepBottom"></div>
            <!--    /Separador Final     -->
        <!-- /Celdas Pesonal  -->
    </div> 
    <!--    Div SearchAndList    -->   
    
    
    <%
           
            /*
                Creacion de empleados
            */
            String empCreado = (String)request.getAttribute("empleadoAdd");
            String fullNameEmp = (String)request.getAttribute("nombreEmpAdd");
            
        if(empCreado=="true")
        {
    %>
            <!--    alerta de Registro true    -->
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="alert alert-success text-center sepBottom " role="alert">
                        <strong>
                            <h3 class="TextBlack">Empleado <label class="text-ColBg capitalizada"><%=fullNameEmp%></label> fue creado con <label class="text-ColBg">ÉXITO</label></h3>
                        </strong> 
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
            <!--    /alerta de Registro true    -->
    <%
        }else if(empCreado=="false")
        {            
    %>
   
         <!--    alerta de Registro false   -->
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="alert alert-warning text-center sepBottom " role="alert">
                        <strong>
                             <h3 class="TextBlack">Empleado <label class="text-ColBg"> no pudo ser creado con ÉXITO</label></h3>
                        </strong> 
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
            <!--    /alerta de Registro false   -->
    <%
            
        }

        // edicion de empleado
        String editadoEmpleado  = (String)request.getAttribute("empleadoEditado");
        String nombreEditado    = (String)request.getAttribute("nombreEmpEdit");

        if(editadoEmpleado == "true")
        {
    %>
            <!--    alerta de edicion true   -->
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="alert alert-success text-center sepBottom " role="alert">
                        <strong>
                            <h3 class="TextBlack">Empleado <label class="text-ColBg capitalizada"> <%=nombreEditado%></label> ha sido editado con <label class="text-ColBg upper font-weight-bold">éxito</label></h3>
                        </strong> 
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
            <!--    /alerta de edicion true   -->
    <%
        }
    %>
     <!--   Div CampPersonal    -->
    <div class="CampPersonal">
        <!--    Form    -->
        <form action="controlAddEmpleados" method="POST" class="sectionPersonal" name="sectionPersonal" autocomplete="off">
            <div class="row">
                <div class="col-2"></div>
                <div class="col-9">
                    
                    <!-- idEMpleado -->
                    <div class="row ">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-2 col-md-3 col-sm-12 centerTextName ocultar">
                            Id Empleado
                        </div>
                        <div class="col-lg-5 col-md-6 col-sm-12 ocultar">
                            <input type="hidden" 
                                   name="txtIdEmp"
                                   id="txtIdEmp"
                                   class="form-control txtIdEmp" 
                                   readonly
                                   value=0
                                  >
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12"></div>
                    </div>
                    <!-- /IdEmpleado -->
                    
                    <!-- rut -->
                    <div class="row ">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                            Rut
                        </div>
                        <div class="col-lg-5 col-md-6 col-sm-12">
                            <input type="text" 
                                   name="txtRutEmp"
                                   id="txtRutEmp"
                                   class="form-control txtRutEmp" 
                                   placeholder="Ingrese Rut"                               
                                  >
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12"></div>
                    </div>
                    <!-- /rut -->
                    
                    <!-- Nombres -->
                    <div class="row sepBody">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-2 col-md-3 col-sm-12 centerTextName">
                            Nombres
                        </div>
                        <div class="col-lg-5 col-md-6 col-sm-12">
                            <input type="text" 
                                   name="txtNombresEmp"
                                   id="txtNombresEmp"
                                   class="form-control txtNombresEmp" 
                                   placeholder="Ingrese Nombres"                               
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
                                   name="txtApellidosEmp"
                                   id="txtApellidosEmp"
                                   class="form-control txtApellidosEmp" 
                                   placeholder="Ingrese Apellidos"                               
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
                            <select class="browser-default custom-select  cboTipoEmpleo" 
                                    name="cboTipoEmpleo" 
                                    id="cboTipoEmpleo"  >
                                <option selected disabled>Seleccionar Estado Empleo...</option>
                                <c:forEach var="item" items="${empleosArr}">                                    
                                    <option value="${item.id_tipo_empleo}">${item.tipo_empleo}</option>
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
                            <select class="browser-default custom-select capitalizada cboTipoCargo" 
                                    name="cboTipoCargo" 
                                    id="cboTipoCargo">
                                <option selected disabled>Seleccionar cargo...</option>
                                <c:forEach var="cargo" items="${cargosArr}">
                                    <option value="${cargo.id_cargo}" class="lower">${cargo.cargo}</option>
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
                            <input type="text" 
                                   name="txtSalarioEmp"
                                   id="txtSalarioEmp"
                                   class="form-control txtSalarioEmp" 
                                   placeholder="Ingrese Salario" 
                                   min="1"
                                   max="3500000"
                                   step="1"
                                   onkeypress="if(event.key==='.' || event.key===','){event.preventDefault(); alert('No puede usar decimales\n solo números enteros')}"
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
                               name="dateNacimientoEmp" 
                               id="dateNacimientoEmp"
                               max="2010-09-09" 
                               min="1920-12-31" data-date-format="dd-MM-yyyy"
                               class="form-control dateNacimientoEmp lower">
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
                                   name="txtDireccionEmp"
                                   id="txtDireccionEmp"
                                   class="form-control txtDireccionEmp" 
                                   placeholder="Ingrese Dirección"                               
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
                                   name="txtTelefonoEmp"
                                   id="txtTelefonoEmp"
                                   class="form-control txtTelefonoEmp" 
                                   placeholder="Ingrese Teléfono"   
                                   minlength="11"
                                   maxlength="12"
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
                                   name="txtEmailEmp"
                                   id="txtEmailEmp"
                                   class="form-control txtEmailEmp lower" 
                                   placeholder="Ingrese Email"                               
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
                                   name="txtExpeEmp"
                                   id="txtExpeEmp"
                                   class="form-control txtExpeEmp" 
                                   placeholder="Ingrese Años Experiencia" 
                                   min="0"
                                   max="60"
                                   step="1"
                                   onkeypress="if(event.key==='.' || event.key===','){event.preventDefault(); alert('No puede usar decimales\n solo números enteros')}"
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
                                   name="txtUserEmp"
                                   id="txtUserEmp"
                                   class="form-control txtUserEmp lower" 
                                   placeholder="Ingrese nombre Usuario" 
                                   min="1"
                                   max="60"
                                   step="1"
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
                                   name="txtPassEmp"
                                   id="txtPassEmp"
                                   class="form-control txtPassEmp" 
                                   placeholder="Ingrese Contraseña" 
                                   min="1"
                                   max="60"
                                   step="1"
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
                            <select class="browser-default custom-select  cboStatusEmp" 
                                    name="cboStatusEmp" 
                                    id="cboStatusEmp"  >
                                <option selected disabled>Seleccionar Estado Empleado...</option>
                                <option value="ACTIVO">Activo</option>
                                <option value="INACTIVO">Inactivo</option>
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
        <!--    /Form    -->
    </div>
    <!--    /Div CampPersonal    -->
    

        
    </body>
</html>
