<%@page import="Entidades.HabitacionEL"%>
<%@page import="Entidades.ReservaEL"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.PersonaEL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head >
<link rel="stylesheet" href="<c:url value="/resources/fortune/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/fortune/css/style.css"/>">
<script src="<c:url value="/resources/fortune/js/jquery.min.js"/>"></script>

<script src="<c:url value="/resources/jsDeivi/alertify.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/jsDeivi/css/alertify.core.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/jsDeivi/css/alertify.default.css"/>">

<script src="<c:url value="/resources/jsDeivi/sweetalert.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/jsDeivi/css/sweetalert.css"/>">
 		
<!---strat-date-piker---->
<script src="<c:url value="/resources/css/jquery-ui.css"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>

		  <script>
				  $(function() {
				    $( "#datepicker,#datepicker1" ).datepicker();
				  });
		  </script>
<!---/End-date-piker---->


 <script src="<c:url value="/resources/jsDeivi/jquery-3.1.1.min.js"/>"></script>
 <!--  <script src="<c:url value="/resources/pago/pago.js"/>"></script>--> 
 
</head>

  <%@include file="masterHead.jsp" %>
<body id="central" >


       <%
       
			HttpSession objSesion = request.getSession(false); 
            ReservaEL reserva= (ReservaEL)objSesion.getAttribute("reservaEnSession");
            PersonaEL p = (PersonaEL)objSesion.getAttribute("personaEnSession");
            HttpSession objSesion2 = request.getSession(false);
            List<HabitacionEL> listahabitacion= (List<HabitacionEL>)objSesion.getAttribute("listahabitaciones");

	     %>

<input  type="hidden" id="idPersona" value="<%=p.getId()%>">		
	
<input   type="hidden" id="idBloqueo" value="${bloquearTipoComprobante}" >
<input   type="hidden" id="idPagoVerificaPaypal" value="${descuentoPagoTotal}" >

<div class="contact-bg2">
	 <div class="container">
		 <div class="booking">
			 <h4 style="font-weight: bold; text-align: center; font-size: 28px;" >PAGO RESERVA</h4>
			 <div class="col-md-8 booking-form">
			 <div class="rooms text-center">
			 
			 <div class="span_of_2">
				<div class="span2_of_1">
					<h2 style="text-align: left; font-weight: bold;">1. Datos de Huesped</h2> <br>
					
					<div class="book_date">
					<h2 style="text-align: left; font-weight: bold;">Nombre: </h2>
					<input type="text" id="idnombre" value="<%=p.getNombre()%>">					
					</div>	
					<div class="book_date">
					<h2 style="text-align: left; font-weight: bold;">Apellido Paterno: </h2>
					<input type="text" id="idApellidoPaterno" value="<%=p.getApellidopaterno()%>">					
					</div>	
					
					<div class="book_date">
					<h2 style="text-align: left; font-weight: bold;">Celular: </h2>
					<input type="text" id="idCelular" value="<%=p.getCelular()%>">					
					</div>	
					<br>
					<h2 style="text-align: left; font-weight: bold;">2. Datos de Facturacion</h2> <br>
											
					<div class="sel_room">
						<h4>Tipo de documento</h4>
						<select id="comprob" class="frm-field required">  
						    <option value="0">seleccione</option>
				            <option value="1">Boleta</option>
							<option value="2">Factura</option>
		        		</select>
					</div>	
					<div class="sel_room left">
						<h2 style="text-align:left; font-weight: bold;" >Serie y Numero : </h2>
						<input style="width: 70px;  float: left;" type="text" id="idSerie" value="${serie}" disabled="disabled">						
						<input style="width: 90px; float: right; "  type="text" id="idNumero" value="${numero}" disabled="disabled">
					</div>	
					<br><br><br><br>
					<div class="book_date"  id="cuadrorazonsocial">
					<h2 style="text-align: left; font-weight: bold;">Razon Social: </h2>
					<input type="text" id="idRazonSocial" value="<%=p.getRazonSocial()%>">
					</div>
									
				</div>
				<div class="span2_of_1">
					<br><br>
					<h2 style="text-align: left; font-weight: bold;">DNI: </h2>
					<div class="book_date">
						<input type="text" id="idDNI" value="<%=p.getDni()%>">
					</div>	
					<h2 style="text-align: left; font-weight: bold;">Apellido Materno: </h2>
					<div class="book_date">
						<input type="text" id="idApellidoMaterno" value="<%=p.getApellidomaterno()%>">
					</div>	
					
				    <h2 style="text-align: left; font-weight: bold;">Telefono: </h2>
					<div class="book_date">
						<input type="text" id="idTelefono" value="<%=p.getTelefono()%>">
					</div>	
					<br><br><br>
					 
					<div class="book_date" id="cuadroraruc">
					    <h2 style="text-align: left; font-weight: bold;">RUC: </h2>
						<input type="text" id="idRUC" value="<%=p.getRuc()%>">
					</div>	
					
					 
					<div class="book_date">
					    <h2 style="text-align: left; font-weight: bold;">Direccion: </h2>
						<input type="text" id="idDireccion" value="<%=p.getDireccion()%>">
					</div>	
				
		     <div class="date_btn">
							
					<input id="btnpaypalpago" type="submit" value="Pagar Ahora">
			
			  </div>
				
			</div>
				<div class="clear"></div>
			</div> 
			 <div>
			 
			 </div>
			         
		 
		 </div> 		      
	</div>
			 <div class="sidebar">
			 <div class="date_btn">
				<form  method="GET" action="${pageContext.servletContext.contextPath}/Reservas">
					<input type="submit" value="Seguir Reservando" style="width: 82px;">
				</form>
			</div>
			<h4>Detalle Reserva</h4>
			
			<%   
				  double total=0; int i=0;
			%>
			
			<ul class="s_nav">
			<h4>Fecha Inicio: <%=reserva.getInicio()%> </h4>
			<h4>Fecha Fin:  <%=reserva.getFin()%></h4>
				<c:forEach items="${reservas}" var="detreserva">
				<li><a href="#"><h2 style="font-weight: bold;">Codigo: </h2>${detreserva.codigo}</a></li>
				<li><a href="#">Nombre: ${detreserva.tipoHabitacion.nombre}</a></li>
				<li><a href="#">Costo dia: ${detreserva.tipoHabitacion.costoxdia}</a></li>
		
                </c:forEach>
				<li><a href="#"><h2 style="font-weight: bold;">Total Reserva: ${totalsindescuento}</h2> </a></li>
				<h2 style="text-align: right;">Descuentos</h2>
				<li><a href="#" style="text-align: right;">Cliente Frecuente: ${descuentoRecurrente} </a></li>
				<li><a href="#" style="text-align: right;">Por Fiestas: ${descuentoGeneral} </a></li>
					<li><a href="#"><h2 style="font-weight: bold;">IGV: ${calculoigv}</h2> </a></li>
				<li><a href="#"><h2 style="font-weight: bold;">Total Pagar: ${descuentoPagoTotal}</h2> </a></li>
			</ul>
			
		</div>
		<div class="clear"></div>
		


	 </div>
  </div>
 </div>
 
<%@include file="masterFooter.jsp" %>
</body>

<script >

function enviar_parametro(idPersona,idcomprobante){ 
	 
	location ="${pageContext.servletContext.contextPath}/pago/comprobante/"+idPersona+"/"+idcomprobante;
	} 

 window.onload = function(){
	 
	 var idPersona=$("#idPersona").val();

	 
	   document.getElementById('comprob').onchange = function(){ 
	    var idcomprobante = document.getElementById("comprob").value;
	     enviar_parametro(idPersona,idcomprobante); 
	   } 
	} 

 
 $(document).ready(function () {
	 var idBloqueo=$("#idBloqueo").val(); 
	 
	 if(idBloqueo==2){
		 
		 div = document.getElementById('cuadrorazonsocial');
			    div.style.display = '';
			     div = document.getElementById('cuadroraruc');
			     div.style.display = '';
			     document.getElementById("comprob").value='2';
	 }else if(idBloqueo==1){
		     div = document.getElementById('cuadrorazonsocial');
		     div.style.display = 'none';
		     div = document.getElementById('cuadroraruc');
		     div.style.display = 'none';
		     document.getElementById("comprob").value='1';
		      $("#idRUC").val(""); 
		      $("#idRazonSocial").val(""); 
	 }else{
		      div = document.getElementById('cuadrorazonsocial');
		      div.style.display = 'none';
		      div = document.getElementById('cuadroraruc');
		      div.style.display = 'none';
		     document.getElementById("comprob").value='0';
		     $("#idRUC").val(""); 
		     $("#idRazonSocial").val(""); 
	 }
	 
	 $("#btnpaypalpago").click(function(){
		
		 
		 swal({
			  title: "¿Quieres pagar?",
			  text: "Estas seguro de querer pagar ahora!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "Si, estoy seguro!",
			  closeOnConfirm: false
			},
			function(){
				 var pagoVerifica=$("#idPagoVerificaPaypal").val(); 		 
				 var nombre=$("#idnombre").val(); 
				 var dni=$("#idDNI").val(); 			 
				 var idApellidoPaterno=$("#idApellidoPaterno").val(); 
				 var idApellidoMaterno=$("#idApellidoMaterno").val(); 		 
				 var idCelular=$("#idCelular").val(); 
				 var idTelefono=$("#idTelefono").val(); 			 
				 var idRUC=$("#idRUC").val(); 
				 var idDireccion=$("#idDireccion").val(); 
				 var idRazonSocial=$("#idRazonSocial").val(); 
				 var idSerie=$("#idSerie").val(); 
				 var idNumero=$("#idNumero").val(); 
				 var idPersona=$("#idPersona").val();
				 
				 if(idBloqueo==2){
					 
					 
					 if(nombre=="" || dni=="" || idApellidoPaterno=="" || idApellidoMaterno=="" || idCelular=="" 
						 || idTelefono=="" || idRUC=="" || idDireccion=="" || idRazonSocial=="" || idSerie=="" || idNumero=="" )
							 {
								  //alert ('Verifique que todos lo datos esten correctos Factura');
								  //alertify.alert("This is an alert dialog");
								 // alertify.error("Verifique que todos lo datos esten correctos Factura");
						     sweetAlert("Datos Incompletos...", "Verifique que todos lo datos esten correctos Factura", "error");
							
							 }else{
								 
								 /** PRIMERA FORMA **/
								 var urlpaypal="";
								 urlpaypal+="https://www.sandbox.paypal.com/cgi-bin/webscr?";
								 
								 urlpaypal+="cmd=_cart";
								 urlpaypal+="&upload=1";
								 urlpaypal+="&business=deivi_160_libra@hotmail.com";
								 urlpaypal+="&currency_code=USD";
								 urlpaypal+="&item_name_1=Pago Reserva Habitacion ";
								 urlpaypal+="&amount_1="+pagoVerifica;
								 urlpaypal+="&quantity_1=1";

								 
								urlpaypal+="&cancel_return=http://13.68.210.51:8080/cp_presentacionMVC2/";
								 			
								 
								 urlpaypal+="&return=http://13.68.210.51:8080/cp_presentacionMVC2/pago/realizaPago/"+nombre+"/"+dni+"/"+idApellidoPaterno+
								 			"/"+idApellidoMaterno+"/"+idCelular+"/"+idTelefono+"/"+idRUC+"/"+idDireccion+"/"
								 			+idRazonSocial+"/"+idSerie+"/"+idNumero+"/"+pagoVerifica+"/"+idBloqueo+"/"+idPersona ;
								 
								 /*
								 urlpaypal+="&cancel_return=http://localhost:8080/springmvc/";
								 			
								 
								 urlpaypal+="&return=http://localhost:8080/springmvc/pago/realizaPago/"+nombre+"/"+dni+"/"+idApellidoPaterno+
								 			"/"+idApellidoMaterno+"/"+idCelular+"/"+idTelefono+"/"+idRUC+"/"+idDireccion+"/"
								 			+idRazonSocial+"/"+idSerie+"/"+idNumero+"/"+pagoVerifica+"/"+idBloqueo+"/"+idPersona ;
								 */
								 window.location=urlpaypal;
							 }
					 			 
				 }else if(idBloqueo==1){
					 
					 
					 if(nombre=="" || dni=="" || idApellidoPaterno=="" || idApellidoMaterno=="" || idCelular=="" 
						 || idTelefono==""  || idDireccion=="" || idSerie=="" || idNumero=="" )
							 {
						      sweetAlert("Datos Incompletos...", "Verifique que todos lo datos esten correctos Boleta", "error");
							
							 }else{
								 /** SEGUNDA FORMA **/
								 var urlpaypal="";
								 urlpaypal+="https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&upload=1&business=deivi_160_libra@hotmail.com&currency_code=USD&item_name_1=Pago Reserva Habitacion&amount_1="+pagoVerifica+"&quantity_1=1";
								 
								 
								 urlpaypal+="&cancel_return=http://13.68.210.51:8080/cp_presentacionMVC2/";
								 
								 urlpaypal+="&return=http://13.68.210.51:8080/cp_presentacionMVC2/pago/realizaPago/"+nombre+"/"+dni+"/"+idApellidoPaterno+
						 			"/"+idApellidoMaterno+"/"+idCelular+"/"+idTelefono+"/"+"0"+"/"+idDireccion+"/"
						 			+"0"+"/"+idSerie+"/"+idNumero+"/"+pagoVerifica+"/"+idBloqueo+"/"+idPersona ;
								 
								 
								 
								 /**
								 urlpaypal+="&cancel_return=http://localhost:8080/springmvc/";
								 
								 urlpaypal+="&return=http://localhost:8080/springmvc/pago/realizaPago/"+nombre+"/"+dni+"/"+idApellidoPaterno+
						 			"/"+idApellidoMaterno+"/"+idCelular+"/"+idTelefono+"/"+"0"+"/"+idDireccion+"/"
						 			+"0"+"/"+idSerie+"/"+idNumero+"/"+pagoVerifica+"/"+idBloqueo+"/"+idPersona ;
						           */
								 window.location=urlpaypal;
							 }
					 			 
				 }else{
					 sweetAlert("Datos Incompletos...", "Verifique que todos lo datos esten correctos", "error");
				 }	 
			
			})
		 
		 
	 }) 
	 
 })
 
 
 
</script>




</html>
 



