<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>Bienvenido a Paradise Hotel, una experiencia única</title>
	<!---start-date-piker-->
	<script src="<c:url value="/resources/js/jquery.min.js"/>" ></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>" />
	<script src="<c:url value="/resources/js/jquery-ui.js"/>" ></script>
	<script>
		$(function(){
			var dateFormat = "dd/mm/yy";
			var from = $("#datepicker")
				.datepicker({	
		    		minDate: "0",
		    		dateFormat: "dd/mm/yy"
				})
				.on("change", function() {
					to.datepicker( "option", "minDate", getDate( this ) );
	   			});
			var	to = $( "#datepicker1" )
				.datepicker({
					defaultDate: getDate(from),
					minDate: getDate(from),
					dateFormat: "dd/mm/yy"
      			});
			function getDate( element ) {
				var date;
				try {
				    date = $.datepicker.parseDate( dateFormat, element.value );
	      		} catch( error ) {
	        		date = null;
	      		}
				return date;
	    	}
	  	});
	</script>
	<!---/End-date-piker-->
	
</head>
<body>

<%@include file="masterHead.jsp" %>

<div class="images-slider">
    <div id="fwslider"> 
        <div class="slider_container">
            <div class="slide"> 
                <img src="<c:url value="/resources/images/1.jpg"/>" alt=""/>
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">
                        	<i class="bg"></i>Bienvenido a Paradise Hotel
                        </h4>
                        <h5 class="title1">
                        	<i class="bg"></i>Aquí disfrutarás experiencias únicas</span>
                        </h5>
                        <!-- /Text title -->
                    </div>
                </div>
            </div>
            <!-- /Duplicate to create more slides -->
            <div class="slide">
                <img src="<c:url value="/resources/images/2.jpg"/>" alt=""/>
                <div class="slide_content">
                     <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">
                        	<i class="bg"></i>Tus mejores momentos
                        </h4>
                        <h5 class="title1">
                        	<i class="bg"></i>Elegancia y exclusividad de servicio</span>
                        </h5>
                        <!-- /Text title -->
                    </div>
                </div>
            </div>
        <!--/slide -->
	    </div>
        <div class="slidePrev"><span> </span></div>
        <div class="slideNext"><span> </span></div>
    </div>
</div>
<!--start main -->
<div class="main_bg">
	<div class="wrap">
		
		<div class="online_reservation">
			<div class="b_room">
				<div class="booking_room">
					<h4>Consulta disponibilidad</h4>
					<p>Ingresa tu periodo de estadía y verifica las habitaciones que se encuentran disponibles</p>
				</div>
				<div class="reservation">
					<form method="POST" action="${pageContext.servletContext.contextPath}/ValidarBusqueda">
						<ul>
							<li class="span1_of_1">
								<h5>Fecha de Llegada:</h5>
								<div class="book_date">
									<input class="date" id="datepicker" type="text" value="DD/MM/YY" onfocus="this.value = '';" 
									onblur="if (this.value == '') {this.value = 'DD/MM/YY';}" name="fechaInicio" required>
								</div>					
							</li>
							<li class="span1_of_1 left">
								<h5>Fecha de Salida:</h5>
								<div class="book_date">
									<input class="date" id="datepicker1" type="text" value="DD/MM/YY" onfocus="this.value = '';" 
									onblur="if (this.value == '') {this.value = 'DD/MM/YY';}" name="fechaFin" required>
								</div>		
							</li>
							<li class="span1_of_3 left">
								<div class="date_btn">
									<input type="submit" value="consultar" />
								</div>
							</li>
						</ul>
					</form>					
				</div>

				<div class="clear"></div>

			</div>
		</div>

		<!--start grids_of_3 -->
		<div class="grids_of_3">

			<div class="grid1_of_3">
				<div class="grid1_of_3_img">
					<a href="details.html">
						<img src="<c:url value="/resources/images/pic2.jpg"/>" alt="" />
						<span class="next"> </span>
					</a>
				</div>
				<h4><a href="#">single room<span>120$</span></a></h4>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
			</div>

			<div class="grid1_of_3">
				<div class="grid1_of_3_img">
					<a href="details.html">
						<img src="<c:url value="/resources/images/pic1.jpg"/>" alt="" />
						<span class="next"> </span>
					</a>
				</div>
				<h4><a href="#">double room<span>180$</span></a></h4>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
			</div>

			<div class="grid1_of_3">
				<div class="grid1_of_3_img">
					<a href="details.html">
						<img src="<c:url value="/resources/images/pic3.jpg"/>" alt="" />
						<span class="next"> </span>
					</a>
				</div>
				<h4><a href="#">suite room<span>210$</span></a></h4>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
			</div>

			<div class="clear"></div>

		</div>	
	</div>
</div>

<%@include file="masterFooter.jsp" %>

</body>
</html>
