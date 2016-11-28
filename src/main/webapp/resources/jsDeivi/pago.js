

/*
var codcomprobante =1;
 $(document).ready(function () {
   $("#comprob").change(function () {
 	
	 var cod = document.getElementById("comprob").value;
	 codcomprobante=cod;
		// if(cod==2){
			 
			    	  
		    	   var idPersona=$("#idPersona").val();
		           var idReserva=$("#idReserva").val();
		           var idcomprobante= codcomprobante;       	
		                
		                 
		          var url = "/mvc/pago/comprobante/"+idPersona+"/"+idReserva+"/"+idcomprobante;
		                 
		          $('#central').load(url);
		                 
		      
	*/		 
			// fn_capturar_comprobante()
			 //fn_Carga_comprobante();
	        // fn_capturar_comprobante();
	        
		// }else if(cod==1){
			 
			//  var idPersona=$("#idPersona").val();
	          // var idReserva=$("#idReserva").val();
	           //var idcomprobante= 1;
	          // $("#idCelular").val(idcomprobante);          	
	                
	                 
	          //var url = "/mvc/pago/comprobante/"+idPersona+"/"+idReserva+"/"+idcomprobante;
	                 
	          //$('#central').load(url);
			 
			// fn_capturar_comprobante()
			// fn_Carga_comprobante();
	        // fn_capturar_comprobante();
	       
		 //}
		
   //  });
 //});
 
 function fn_Carga_comprobante() {
	 
	 
	 if(codcomprobante==2){
			// fn_capturar_comprobante()
		  fn_capturar_comprobante();
			 div = document.getElementById('cuadrorazonsocial');
	         div.style.display = '';
	         div = document.getElementById('cuadroraruc');
	         div.style.display = '';
	       
	        // codcomprobante=cod;
	        // fn_capturar_comprobante();
	        
		 }else if(codcomprobante==1){
			// fn_capturar_comprobante()
			  fn_capturar_comprobante();
			 div = document.getElementById('cuadrorazonsocial');
	         div.style.display = 'none';
	         div = document.getElementById('cuadroraruc');
	         div.style.display = 'none';
	         //fn_capturar_comprobante();
	        // codcomprobante=cod;
	        // fn_capturar_comprobante();
	       
		 }
	 
 }
 
 
 
/*
var codcomprobante =1;
 function fn_Load_comprobante() {
	 var cod = document.getElementById("comprob").value;
	   codcomprobante=cod;
		 if(cod==2){
			
	         
	         //alert(cod);
	        // fn_capturar_comprobante();
	         /*
	         div = document.getElementById('cuadrorazonsocial');
	         div.style.display = '';
	         div = document.getElementById('cuadroraruc');
	         div.style.display = '';
	       */
	        // cod.options[cod.selectedIndex].text('Factura');
	         
		// }else if(cod==1){
			
	         
	        // fn_capturar_comprobante();
			 /*
	         div = document.getElementById('cuadrorazonsocial');
	         div.style.display = 'none';
	         div = document.getElementById('cuadroraruc');
	         div.style.display = 'none';
	         */
	        
		// }
	  
//};
 

/*
  function fn_capturar_comprobante() {
				
      if(codcomprobante==2){
    	  
    	   var idPersona=$("#idPersona").val();
           var idReserva=$("#idReserva").val();
           var idcomprobante= 2;
           $("#idCelular").val(idcomprobante);          	
                
                 
                 var url = "/mvc/pago/comprobante/"+idPersona+"/"+idReserva+"/"+idcomprobante;
                 
                 $('#central').load(url);
                 
      }else{
    	  var idPersona=$("#idPersona").val();
          var idReserva=$("#idReserva").val();
          var idcomprobante= 1;
          
          $("#idCelular").val(idcomprobante); 
                     	
                
                
                var url = "/mvc/pago/comprobante/"+idPersona+"/"+idReserva+"/"+idcomprobante;
                
                $('#central').load(url);
    	  
      }
      
               /*
           	    $('#central').load(url, function (response, status, xhr) {
           	        if (status == "error") {
           	            var msg = "Tienes un error: ";
           	            $("#info").html(msg + xhr.status + " " + xhr.statusText);
           	        }         	  
           	        
           	    });
           	    */
           	      
 //         }
 
