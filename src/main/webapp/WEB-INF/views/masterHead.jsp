<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE HTML>
<html>
<head>
  <title>Paradise Hotel</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
	<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
	<link href="<c:url value="/resources/jeegoopopup/skins/round/style.css"/>" rel="Stylesheet" type="text/css" />
    <script type="text/javascript" src="<c:url value="/resources/jeegoopopup/jquery.jeegoopopup.1.0.0.js"/>" ></script>

	<!--start slider -->
	<link rel="stylesheet" href="<c:url value="/resources/css/fwslider.css"/>" media="all">
	<script src="<c:url value="/resources/js/jquery-ui.min.js"/>" ></script>
	<script src="<c:url value="/resources/js/css3-mediaqueries.js"/>" ></script>
	<script src="<c:url value="/resources/js/fwslider.js"/>" ></script>
	<!--end slider -->

	<script type="text/javascript" src="<c:url value="/resources/js/JFCore.js"/>" ></script>
	<script type="text/javascript" src="<c:url value="/resources/js/JFForms.js"/>" ></script>
	
	<!--nav-->
	<script>
		$(function() {
			var pull 		= $('#pull');
				menu 		= $('nav ul');
				menuHeight	= menu.height();

			$(pull).on('click', function(e) {
				e.preventDefault();
				menu.slideToggle();
			});

			$(window).resize(function(){
        		var w = $(window).width();
        		if(w > 320 && menu.is(':hidden')) {
        			menu.removeAttr('style');
        		}
    		});
		});
	</script>

	<script type="text/javascript">
		$(function() {
			$('#btnLogin, #btnLogin2').click(function(){
				var html = $("#login").html(); 
				var options = {
					html: html,
					width: 450,
                    height: 300,
                    center: true,
                    skinClass: 'jg_popup_round', 
                    resizable: false,
                    scrolling: 'no',
				};
				$.jeegoopopup.open(options);
			});
		});
	</script>
	
		<script type="text/javascript">
		$(function() {
			$('#btnRegistroUsuario, #btnRegistroUsuario2, #btnRegistroUsuario3').click(function(){
				var html = $("#RegistroUsuario").html(); 
				var options = {
					html: html,
					width: 450,
                    height: 600,
                    center: true,
                    skinClass: 'jg_popup_round', 
                    resizable: false,
                    scrolling: 'no',
				};
				$.jeegoopopup.open(options);
			});
		});
	</script>

	<script>
		function verificarAcceso(){
			$(document).ready(function (){
				$.ajax({
	                url: '${pageContext.servletContext.contextPath}/VerificarAcceso',
	                data: {
	                	"nickname": $('#jg_popup_content #nickname').val(),
	                	"contrasena": $('#jg_popup_content #contrasena').val()
	                },
	                async: true,
	                type: 'POST',
	                success: function (resultado) {
	                	if(resultado == "reservas")
	                		window.location.href = "${pageContext.servletContext.contextPath}/Reservas";
	                	else
	                		$('#jg_popup_content #error').text(resultado);
	                }
	            })
			});		
		}
		
	</script>
	
		<script>
		function Fn_Registro(){
			$(document).ready(function (){
				$.ajax({
	                url: '${pageContext.servletContext.contextPath}/RegistroUsuario',
	                data: {
	                	"nombre": $('#jg_popup_content #nombre').val(),
	                	"apellidoP": $('#jg_popup_content #apellidoP').val(),
	                	"apellidoM": $('#jg_popup_content #apellidoM').val(),
	                	"dni": $('#jg_popup_content #dni').val(),
	                	"nickname": $('#jg_popup_content #nickname').val(),
	                	"contrasena": $('#jg_popup_content #contrasena').val()
	                },
	                async: true,
	                type: 'POST',
	                success: function (resultado) {
	                	if(resultado == "reservas")
	                		window.location.href = "${pageContext.servletContext.contextPath}/Reservas";
	                	else{
	                		if(resultado == "errornombre"){	          
	                		     $('#jg_popup_content #error1').text("Ingrese el Nombre");
	                		     $('#jg_popup_content #error2').text("");
	                		     $('#jg_popup_content #error3').text("");
	                		     $('#jg_popup_content #error4').text("");
	                		     $('#jg_popup_content #error5').text("");
	                		     $('#jg_popup_content #error6').text("");
	                		     $('#jg_popup_content #error7').text("");
	                		     $('#jg_popup_content #error8').text("");
	                		}
	                		else if(resultado == "errorapellidoP"){
	                		      $('#jg_popup_content #error2').text("Ingrese el Apellido Paterno");
	                		         $('#jg_popup_content #error1').text("");
		                		     $('#jg_popup_content #error3').text("");
		                		     $('#jg_popup_content #error4').text("");
		                		     $('#jg_popup_content #error5').text("");
		                		     $('#jg_popup_content #error6').text("");
		                		     $('#jg_popup_content #error7').text("");
		                		     $('#jg_popup_content #error8').text("");
	                		}
	                		else if(resultado == "errorapellidoM"){
	                		      $('#jg_popup_content #error3').text("Ingrese el Apellido Materno");
	                		        $('#jg_popup_content #error1').text("");
	                		        $('#jg_popup_content #error2').text("");
		                		     $('#jg_popup_content #error4').text("");
		                		     $('#jg_popup_content #error5').text("");
		                		     $('#jg_popup_content #error6').text("");
		                		     $('#jg_popup_content #error7').text("");
		                		     $('#jg_popup_content #error8').text("");
	                		}
	                		else if(resultado == "erroradni"){
	                		      $('#jg_popup_content #error4').text("Ingrese el DNI");	
	                		         $('#jg_popup_content #error1').text("");
	                		         $('#jg_popup_content #error2').text("");
		                		     $('#jg_popup_content #error3').text("");
		                		     $('#jg_popup_content #error5').text("");
		                		     $('#jg_popup_content #error6').text("");
		                		     $('#jg_popup_content #error7').text("");
		                		     $('#jg_popup_content #error8').text("");
	                		}
	                		else if(resultado == "errorusuario"){
	                		      $('#jg_popup_content #error5').text("Ingrese un Usuario");
	                		         $('#jg_popup_content #error1').text("");
	                		         $('#jg_popup_content #error2').text("");
		                		     $('#jg_popup_content #error3').text("");
		                		     $('#jg_popup_content #error4').text("");
		                		     $('#jg_popup_content #error6').text("");
		                		     $('#jg_popup_content #error7').text("");
		                		     $('#jg_popup_content #error8').text("");
	                		}
	                		else if(resultado == "errorpassword"){
	                		      $('#jg_popup_content #error6').text("se nesecita una contraseña");
	                		         $('#jg_popup_content #error1').text("");
	                		         $('#jg_popup_content #error2').text("");
		                		     $('#jg_popup_content #error3').text("");
		                		     $('#jg_popup_content #error4').text("");
		                		     $('#jg_popup_content #error5').text("");
		                		     $('#jg_popup_content #error7').text("");
		                		     $('#jg_popup_content #error8').text("");
	                		}
	                		else if(resultado == "erroradni2"){
	                		      $('#jg_popup_content #error7').text("el DNI debe tener 8 caracteres");
	                		         $('#jg_popup_content #error1').text("");
	                		         $('#jg_popup_content #error2').text("");
		                		     $('#jg_popup_content #error3').text("");
		                		     $('#jg_popup_content #error4').text("");
		                		     $('#jg_popup_content #error5').text("");
		                		     $('#jg_popup_content #error6').text("");
		                		     $('#jg_popup_content #error8').text("");
	                		}
	                		else if(resultado == "erroradni3"){
	                		      $('#jg_popup_content #error8').text("Ingrese solo numeros");
	                		      $('#jg_popup_content #error1').text("");
	                		         $('#jg_popup_content #error2').text("");
		                		     $('#jg_popup_content #error3').text("");
		                		     $('#jg_popup_content #error4').text("");
		                		     $('#jg_popup_content #error5').text("");
		                		     $('#jg_popup_content #error6').text("");
		                		     $('#jg_popup_content #error7').text("");
	                		}
	                		
	                		else if(resultado == "errorusuarioexistente"){
	                		         $('#jg_popup_content #error9').text("*El Usuario ya Existe. Usa otro");
	                		         $('#jg_popup_content #error8').text("");
	                		         $('#jg_popup_content #error10').text("");
	                		         $('#jg_popup_content #error4').text("");
	                		         $('#jg_popup_content #error7').text("");
	                		}
	                		
	                		else if(resultado == "errorDNIexistente"){
               		         $('#jg_popup_content #error10').text("*El DNI ya Existe. Ingrese Otro");
               		         $('#jg_popup_content #error8').text("");
               		         $('#jg_popup_content #error9').text("");
               		         $('#jg_popup_content #error4').text("");
          		             $('#jg_popup_content #error7').text("");
               		       }
	                	}
	                }
	            })
			});		
		}
		
	</script>
	

	<style type="text/css">
        #login{ visibility: hidden; display: none;}
        #RegistroUsuario{ visibility: hidden; display: none;}
    </style>

</head>
<body>

<div class="modal" id="login">
	<div class="contact-form">
		<h3>Inicio de Sesión</h3>
		<div class="clear"></div>
		<form id="frmInicioSesion" action="javascript:verificarAcceso();">
			<div>
				<span><label>Usuario:</label></span>
				<span><input id="nickname" type="text" required class="textbox"></span>
			</div>
			<div>
				<span><label>Contraseña:</label></span>
				<span><input id="contrasena" type="password" required class="textbox"></span>
			</div>
			<div>
		   		<span><input type="submit" value="Iniciar Sesión"></span>
		  	</div>
		  	<div id="error" style="display:block; color:#f44; font-weight:bold; font-size:10px;"></div>
	  	</form>
	</div>
</div>


<div class="modal" id="RegistroUsuario">
	<div class="contact-form">
		<h3 style="color: blue;">Registro Usuario</h3>
		<div class="clear"></div>
		<form id="frmRegistro" action="javascript:Fn_Registro();">
		
			<div>
			   <span><label>Nombre:</label> 
				<label style="color: red;"  id="error1"></label> 
				<input id="nombre" type="text"  class="textbox"></span>
		   </div>
			<div>
				<span><label>Apellido Paterno:</label><label style="color: red;"  id="error2"></label></span>
				<span><input id="apellidoP" type="text"  class="textbox"></span>
			</div>
		
		     <div>
				<span><label>Apellido Materno:</label><label style="color: red;"  id="error3"></label></span>
				<span><input id="apellidoM" type="text"  class="textbox"></span>
			</div>
			
			<div>
				<span><label>DNI:</label>
				<label style="color: red;"  id="error4"></label>
				<label style="color: red;"  id="error7"></label>
				<label style="color: red;"  id="error8"></label></span>
				<span><input id="dni" type="text"  class="textbox"></span>
			</div>
			
			<div>
				<span><label>Usuario:</label><label style="color: red;"  id="error5"></label></span>
				<span><input id="nickname" type="text"  class="textbox"></span>
			</div>
			<div>
				<span><label>Contraseña:</label><label style="color: red;"  id="error6"></label></span>
				<span><input id="contrasena" type="password"  class="textbox"></span>
			</div>
			<div>
		   		<span><input type="submit" value="Registrarse"></span>
		  	</div>
		  	<label id="error9" style="color:#f44; font-weight:bold; font-size:12px;"></label>
		  	<label id="error10" style="color:#f44; font-weight:bold; font-size:12px;"></label>
	  	</form>
	</div>
</div>


<!-- start header -->
<div class="header_bg">
	<div class="wrap">
		<div class="header">
			<div class="logo">
				<a href="${pageContext.servletContext.contextPath}/"><img src="<c:url value="/resources/images/logo.png"/>" alt=""></a>
			</div>
			<div class="h_right">
				<!--start menu -->
				<ul class="menu" style="float:right;">
					<c:choose>
    					<c:when test = "${menu == 1}">
        					<li><a href="#" id="btnLogin">inicia sesión</a></li> |
							<li><a href="#" id="btnRegistroUsuario">regístrate</a></li>
    					</c:when>
					    <c:when test = "${menu == 2}">
					        <li><a href="${pageContext.servletContext.contextPath}/">habitaciones</a></li> |
							<li><a href="${pageContext.servletContext.contextPath}/Reservas">reservas</a></li> |
							<li><a href="${pageContext.servletContext.contextPath}/EditarPerfil">modificar perfil</a></li> |
							<li><a href="${pageContext.servletContext.contextPath}/CerrarSesion">cerrar sesion</a></li>
					    </c:when>
					</c:choose>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="top-nav">
				<nav class="clearfix">
					<ul>
						<c:choose>
    						<c:when test = "${menu == 1}">
								<li><a href="#" id="btnLogin2">inicia sesión</a></li>
								<li><a href="${pageContext.servletContext.contextPath}/Registro">regístrate</a></li>
							</c:when>
							<c:when test = "${menu == 2}">
								<li><a href="${pageContext.servletContext.contextPath}/">habitaciones</a></li>
								<li><a href="${pageContext.servletContext.contextPath}/Reservas">reservas</a></li>
								<li><a href="${pageContext.servletContext.contextPath}/EditarPerfil">modificar perfil</a></li>
								<li><a href="${pageContext.servletContext.contextPath}/CerrarSesion">cerrar sesion</a></li>
							</c:when>
						</c:choose>
					</ul>
					<a href="#" id="pull">Seleccione una opción</a>
				</nav>
			</div>
		</div>
	</div>
</div>

</body>
</html>