<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>

<!--start main -->
<div class="footer_bg">
	<div class="wrap">
		<div class="footer">
			<div class="copy">
				<p class="link"><span>© Todos los derechos reservados | UPN | Ing. de Sist. Computacionales</span></p>
			</div>
			<div class="f_nav">
				<ul>
					<c:choose>
  						<c:when test = "${menu == 1}">
							<li><a href="#" id="btnLogin2">inicia sesión</a></li>
							<li><a href="#" id="btnRegistroUsuario2">regístrate</a></li>
						</c:when>
						<c:when test = "${menu == 2}">
							<li><a href="${pageContext.servletContext.contextPath}/">habitaciones</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/Reservas">reservas</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/EditarPerfil">modificar perfil</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/CerrarSesion">cerrar sesion</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>	