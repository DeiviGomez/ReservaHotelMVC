<%@page import="Entidades.PersonaEL"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>




		
	<%@include file="masterHead.jsp" %>
	
	   <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<link href="<c:url value="/resources/assets/plugins/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />
	<link href="<c:url value="/resources/assets/plugins/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" />

	<link href="<c:url value="/resources/assets/css/style.min.css"/>" rel="stylesheet" />
	
	 <%
       
			HttpSession objSesion = request.getSession(false); 
            PersonaEL p = (PersonaEL)objSesion.getAttribute("personaEnSession");

	     %>
			
            <div class="profile-container">
                <!-- begin profile-section -->
                <div class="profile-section">
                
                    <!-- end profile-left -->
                    <!-- begin profile-right -->
                    <div class="profile-right">
                        <!-- begin profile-info -->
                        <div class="profile-info">
                            <!-- begin table -->
                            <div class="table-responsive">
                                                        
                            <h3>Actualizar Datos</h3>
                            
           
                                <table class="table table-profile">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>
                                                <h4><%=p.getNombre() %> <small><%=p.getApellidopaterno()%></small></h4>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>

	                                        <tr class="highlight">
	                                            <td class="field">Nombre*</td>                                           
	                                            <td><input type="text" id="nombres" value="<%=p.getNombre() %>"> </td>
	                                        </tr>
	                                        <tr class="highlight">
	                                            <td class="field">Apellido Paterno*</td>
	                                            <td><input type="text" id="apellidsoP" value="<%=p.getApellidopaterno() %>"></td>
	                                        </tr>
	                                        <tr class="highlight">
	                                            <td class="field">Apellido Materno*</td>
	                                            <td><input type="text" id="apellisoM" value="<%=p.getApellidomaterno() %>"></td>
	                                        </tr>
	                                        <tr class="divider">
	                                            <td colspan="2"></td>
	                                        </tr>
	                                         <tr>
	                                            <td class="field">DNI*</td>
	                                            <td><input type="text" id="dnis" value="<%=p.getDni() %>"></td>
	                                        </tr>
	                                        <tr>
	                                            <td class="field">Celular</td>
	                                            <td><i class="fa fa-mobile fa-lg m-r-5"></i><input type="text" id="celular" value="<%=p.getCelular() %>"></td>
	                                        </tr>
	                                         <tr>
	                                            <td class="field">Telefono</td>
	                                            <td><i class="fa fa-mobile fa-lg m-r-5"></i><input type="text" id="telefono" value="<%=p.getTelefono() %>"></td>
	                                        </tr>
	                                        <tr>
	                                            <td class="field">Dirección</td>
	                                            <td><textarea rows="2" cols="50" id="direccion"><%=p.getDireccion()%></textarea></td>
	                                        </tr>                       
	                                        <tr class="divider">
	                                            <td colspan="2"></td>
	                                        </tr>
	                                        <tr class="highlight">
	                                            <td class="field">Razón Social</td>
	                                            <td><input type="text" id="razonsocial" value="<%=p.getRazonSocial() %>"></td>
	                                        </tr>
	                                         <tr class="highlight">
	                                            <td class="field">RUC</td>
	                                            <td><input type="text" id="ruc" value="<%=p.getRuc() %>"></td>
	                                        </tr>
	                                        <tr class="divider">
	                                            <td colspan="2"></td>
	                                        </tr>                                                                        
	                                         <tr>
	                                            
	                                            <td>
	                                                  <div class="m-b-10">
	                                                  <input type="submit" value="Guardar Configuración" class="btn btn-warning btn-block btn-sm" onclick="return fn_Actualiza_Perfil();">
	                            						
	                       							 </div>
	                                            </td>
	                                        </tr>
						
                                    </tbody>
                                </table>
                            </div>
                            <!-- end table -->
                        </div>
                        <!-- end profile-info -->
                    </div>
                    <!-- end profile-right -->
                </div>
           
            </div>

		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->

<script src="<c:url value="/resources/jsDeivi/alertify.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/jsDeivi/css/alertify.core.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/jsDeivi/css/alertify.default.css"/>">

<script src="<c:url value="/resources/jsDeivi/sweetalert.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/jsDeivi/css/sweetalert.css"/>">


 <script src="<c:url value="/resources/jsDeivi/jquery-3.1.1.min.js"/>"></script>
 
 <script type="text/javascript">

 function fn_Actualiza_Perfil(){
		$(document).ready(function (){
			$.ajax({
             url: '${pageContext.servletContext.contextPath}/ActualizarCliente',
             data: {
            		"nombre": $('#nombres').val(),
                	"apellidoP": $('#apellidsoP').val(),
                	"apellidoM": $('#apellisoM').val(),
                	"dni": $('#dnis').val(),
                	"celular": $('#celular').val(),
                	"telefono": $('#telefono').val(),
                	"direccion": $('#direccion').val(),
                	"razonsocial": $('#razonsocial').val(),
                	"ruc": $('#ruc').val()
             },
             async: true,
             type: 'POST',
             success: function (resultado) {
             	if(resultado == "actualiza"){
             		alertify.success("Datos actualizados correctamente...");
             		//alertify.alert("Datos actualizados correctamente...");
             	}
             	else{
             		if(resultado == "errornombre"){	  
             			
             			alertify.error("Ingrese el Nombre");
             		}
             		else if(resultado == "errorapellidoP"){
             			alertify.error("Ingrese el Apellido Paterno");
             		}
             		else if(resultado == "errorapellidoM"){
             			alertify.error("Ingrese el Apellido Materno");
            		}
             		else if(resultado == "erroradni"){
             			alertify.error("Ingrese el DNI");
             		}
             		else if(resultado == "erroradni2"){
             			alertify.error("el DNI debe tener 8 caracteres");
             		}
             		else if(resultado == "erroradni3"){
             			alertify.error("DNI, Ingrese solo numeros");
             		}
             		else if(resultado == "errorruc"){
             			alertify.error("RUC, debe ser de 11 caracteres");
             		}
             		else if(resultado == "errorruc2"){
             			alertify.error("RUC, Ingrese solo numeros");
             		}
             		else if(resultado == "erroractualiza"){
             			alertify.error("Error al procesar los datos...");
             		}
             	}
             }
         })
		});		
	}
 
 
</script>




<%@include file="masterFooter.jsp" %>
