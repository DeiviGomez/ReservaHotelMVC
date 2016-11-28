<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<c:forEach items="${disponibles}" var="hab">
	<tr id="tr${hab.id}">
		<td align="center">
			<div style="width:20px;">
				<input type="checkbox" name="listaHabitaciones" value = "${hab.id}" 
				onchange="javascript:agregarHabitacion(${hab.id});"/>
			</div>
		</td>
		<td class="nroHab" align="center">${hab.codigo}</td>
		<td class="tipoHab" align="center">${hab.tipoHabitacion.nombre}</td>
		<td class="precio" align="center">S/. ${hab.tipoHabitacion.costoxdia}</td>
	</tr>
</c:forEach>
							