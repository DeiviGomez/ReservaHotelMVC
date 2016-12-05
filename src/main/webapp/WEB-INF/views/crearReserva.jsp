<%@page import="Entidades.PersonaEL"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>Paradise Hotel | Creación de Reservas</title>
	<!---start-date-piker-->
	<script src="<c:url value="/resources/js/jquery.min.js"/>" ></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>" />
	<script src="<c:url value="/resources/js/jquery-ui.js"/>" ></script>
	
	<style type="text/css">
		.span2_of_1 table{ width: 96%; margin:2% 2%; }
		.span2_of_1 tr{ border-bottom: solid 1px #AAA; }
		.span2_of_1 th{ font-weight: bold; }
		.span2_of_1 td{ padding: 3px; }	
	</style>
	
	<script type="text/javascript">
	
		function cantidadDias(){
	    	var str1 = $("#datepicker").val().split('/');
	    	var str2 = $("#datepicker1").val().split('/');
	    	var inicio = new Date(str1[2], str1[1], str1[0]);
	    	var fin = new Date(str2[2], str2[1], str2[0]);
	    	var dias = Math.round((fin - inicio)/(1000*60*60*24)) + 1;
	    	if(isNaN(dias))
	    		return 0;
	    	else
	    		return dias;
	    }
		
    	function listarHabitaciones(){
		   	$("#seleccionados tbody tr").remove();
		   	$("#total").text("S/. 0");
		   	if($("#cantDias").text() > 0){
		   		$.ajax({
	               url: '${pageContext.servletContext.contextPath}/HabitacionesDisponibles',
	               data: {
	               	"fechaInicio": $('#datepicker').val(),
	               	"fechaFin": $('#datepicker1').val()
	               },
	               async: true,
	               type: 'POST',
	               success: function (resultado) {
           				$('#disponibles tbody').html(resultado);
	               }
	           })
    		}
    	}
    	
    	function agregarHabitacion(id){
    		if($("#cantDias").text() == 0)
    			$("#cantDias").text(cantidadDias());
    		if($("#cantDias").text() > 0){
    			var origen = "#tr" + id;
    			var destino = "trs" + id;
    			if ($(origen +  " input").is(':checked')) {
    				$("#seleccionados tbody").append("<tr align='center' id='" + destino + "'></tr>");
    				destino = "#" + destino;
    				$(destino).append("<td>" + $(origen + " .nroHab").text() + "</td>");
    				$(destino).append("<td>" + $(origen + " .tipoHab").text() + "</td>");
    				var importe = $("#cantDias").text() * $(origen + " .precio").text().substr(4);
    				$(destino).append("<td class='importe'>S/. " + importe + "</td>");
    				$("#total").text("S/. " + (importe + parseInt($("#total").text().substr(4))));
    			}else{
    				destino = "#" + destino;
    				var importe = $(destino + " .importe").text().substr(4);
    				$(destino).remove();
    				$("#total").text("S/. " + (parseInt($("#total").text().substr(4)) - importe));
    			}	
    		}
		}
    	
    	function validarReserva(){
    		if (cantidadDias() > 0){
    			if ($("input[name='listaHabitaciones']").is(':checked')) {
    				return true;
    			}else{
    				alert("Marca al menos una habitacion");
    				return false;
    			}
    		}else{
    			alert("El rango de fechas ingresado es incorrecto");
    			return false;
    		}
    	}
    	
		$( function() {
			var dateFormat = "dd/mm/yy";
			var from = $( "#datepicker" )
				.datepicker({
	  				minDate: "0",
	  				dateFormat: "dd/mm/yy",
				})
		        .on( "change", function() {
		        	to.datepicker( "option", "minDate", getDate( this ) );
		        	$("#cantDias").text(cantidadDias());
		        	listarHabitaciones();
		        });
			var to = $( "#datepicker1" )
				.datepicker({
					minDate: getDate(from),
					dateFormat: "dd/mm/yy"	
				})
				.on("change", function() {
					$("#cantDias").text(cantidadDias());
					listarHabitaciones();
				});
		    function getDate( element ) {
			    var date;
		    	try {
		        	date = $.datepicker.parseDate( dateFormat, element.value );
		      	} catch( error ) {
		        	date = null;
		      	}
		 	    return date;
		    };
		});
		</script>
		

	
</head>

<body>

<%@include file="masterHead.jsp" %>

<div class="main_bg">
	<div class="wrap">
		<div class="main">
			<div class="res_online">
				<h4>Reserva de Habitaciones: (<%= session.getAttribute("nombreUsuario") %>)</h4>
			</div>
			<form action = "${pageContext.servletContext.contextPath}/IniciarPago" method="POST">
				<div class="span_of_2">
					<div class="span2_of_1">
						<h4>Día de llegada:</h4>
						<div class="book_date btm">
							<input class="date" id="datepicker" type="text" value="${inicio}" name="fechaInicio" required>
						</div>	
						<h4>Habitaciones Disponibles:</h4>
						<table id="disponibles">
							<thead>
								<tr style="font-weight:bold;">
									<th align="center">Elegir</th>
									<th align="center">Nro. de Habitación</th>
									<th align="center">Tipo de Habitación</th>
									<th align="center">Precio por Día</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${disponibles}" var="hab">
									<tr id="tr'${hab.id}'">
										<td align="center">
											<div style="width:20px;">
												<input type="checkbox" name="listaHabitaciones" value="${hab.id}" 
												onchange="javascript:agregarHabitacion(${hab.id});"/>
											</div>
										</td>
										<td class="nroHab" align="center">${hab.codigo}</td>
										<td class="tipoHab" align="center">${hab.tipoHabitacion.nombre}</td>
										<td class="precio" align="center">S/. ${hab.tipoHabitacion.costoxdia}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="span2_of_1">
						<h4>Día de salida:</h4>
						<div class="book_date btm">
							<input class="date" id="datepicker1" name="fechaFin" type="text" value="${fin}" required>
						</div>
						<h4>Habitaciones Seleccionadas:</h4>
						<table id="seleccionados">
							<thead>
								<tr style="font-weight:bold;">
									<th align="center" style="width:18%">Nro. de Habitación</th>
									<th align="center" style="width:36%">Tipo de Habitación</th>
									<th align="center" style="width:18%">Importe por Habitación</th>
								</tr>
							</thead>
							<tbody>
							</tbody>	
						</table>
						<table>
							<tr align="right">
								<td>
									Cantidad de Días: <span style="font-weight: bold;" id="cantDias">0</span>
								</td>
								<td>
									Precio Total: <span style="font-weight: bold;" id="total">S/. 0</span>
								</td>
							</tr>
						</table>
						
						<div class="clear"></div>
							
					</div>
					<div class="clear"></div>
				</div>
				<div class="res_btn">
					<input type="submit" value="Reservar y Pagar" style="width: 280px;" onclick="return validarReserva();">
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="masterFooter.jsp" %>

</body>
</html>