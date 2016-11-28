<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>Paradise Hotel | Crea tu usuario</title>
	<script src="<c:url value="/resources/js/jquery.min.js"/>" ></script>
</head>
<body>

<%@include file="masterHead.jsp" %>

<p>Pagina de creacion de perfil solo disponible si es que no hay perfil logeado</p>
<p>(podria ser la misma pagina de crear perfil validando si es que hay o no perfil logeado)</p>

<%@include file="masterFooter.jsp" %>

</body>
</html>