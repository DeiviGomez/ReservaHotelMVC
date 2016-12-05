package com.presentacion.springmvc;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import AccesoDatos.PagoDL;
import AccesoDatos.PersonaDL;
import AccesoDatos.ReservaDL;
import Entidades.DetalleReservaEL;
import Entidades.HabitacionEL;
import Entidades.PagoEL;
import Entidades.PersonaEL;
import Entidades.ReservaEL;

@Controller
@RequestMapping("/pago")
public class PagoController {

	@RequestMapping("/detallepago")
	public String detallepago(Locale locale, Model model) {

		return "Extranet/selecHabitacion";
	}
	
	  @RequestMapping(value = "/comprobante/{idPersona}/{idcomprobante}", method = RequestMethod.GET)
	    public ModelAndView comprobante(@PathVariable("idPersona") String idPersona, @PathVariable("idcomprobante") int idcomprobante , 
	    		ModelMap model,HttpServletRequest request,HttpSession sesion) {
	    	try {
	    		    		
	    	  PersonaEL person = PersonaDL.instancia().sp_Buscar_Cliente(Integer.parseInt(idPersona));	
	   		  HttpSession sessionpersona=request.getSession();  
	   		  sessionpersona.setAttribute("personaEnSession", person);
	   		  
	   		 ReservaEL reserva= (ReservaEL)sesion.getAttribute("reservaEnSession");
	   		  
	   		HttpSession sessiondetallereserva = request.getSession();  
			sessiondetallereserva.setAttribute("reservaEnSession", reserva);
	   		
			 List<HabitacionEL> listahabitacion= (List<HabitacionEL>)sesion.getAttribute("listahabitaciones");
			
			HttpSession sessionlista = request.getSession();  
			sessionlista.setAttribute("listahabitaciones", listahabitacion);
			model.put("reservas" ,listahabitacion);
	   
	    		PagoEL pagoel=new PagoEL();
	    		
	    		    Date ahora = new Date();
	    		    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	    		    // formateador.format(ahora);
	    		
	    		if(person !=null && listahabitacion.size()>0 ){
	    		
	    		   int desconcurrencia=PersonaDL.instancia().sp_Verificar_Cliente_recurrente_mes(Integer.parseInt(idPersona), formatter.format(ahora));			
	  			  
				  double descuentoRecurrente=  pagoel.calcularDescuentoPorRecurrenciaMes(listahabitacion,desconcurrencia,ahora,reserva);			  
				   model.put("descuentoRecurrente",descuentoRecurrente);
				 
	    		  
				  double descuentoGeneral=pagoel.calculoDescuentoGeneralFiestas(ahora,listahabitacion, reserva);
				  model.put("descuentoGeneral",descuentoGeneral);
				  
				  double totalsindescuento=pagoel.calcularPagosinDescuentos(listahabitacion, reserva);
				  model.put("totalsindescuento",totalsindescuento);
				  
				 double calculoigv=pagoel.calcularImpuestoIGV(idcomprobante, listahabitacion,ahora,desconcurrencia,reserva );
				 model.put("calculoigv",calculoigv);
								 				 
				 double descuentoPagoTotal=pagoel.pagoTotal(ahora, listahabitacion,idcomprobante, desconcurrencia, reserva);
				  model.put("descuentoPagoTotal",descuentoPagoTotal);
				  
				  model.put("bloquearTipoComprobante",idcomprobante);
				  
				  
				  String serie=pagoel.seriecomprobante(idcomprobante);
				  String numero=pagoel.numerocomprobante(idcomprobante);
				  
				  model.put("serie",serie);
				  model.put("numero",numero);
				  
			
				return new ModelAndView("pago", model);	
	        }
				
			} catch (Exception e) {
				e.getMessage();
			}
	    	
	    	return new ModelAndView("Extranet/selecHabitacion", model);
	    } 
	  
	  
	  
	  @RequestMapping(value = "/realizaPago/{nombre}/{dni}/{idApellidoPaterno}/{idApellidoMaterno}/{idCelular}/{idTelefono}"
	  		+ "/{idRUC}/{idDireccion}/{idRazonSocial}/{idSerie}/{idNumero}/{pagoVerifica}/{idBloqueo}/{idPersona}", method = RequestMethod.GET)
	    public ModelAndView realizaPago(@PathVariable("nombre") String nombre, @PathVariable("dni") String dni,
	    		         @PathVariable("idApellidoPaterno") String idApellidoPaterno ,
	    		         @PathVariable("idApellidoMaterno") String idApellidoMaterno,
	    		         @PathVariable("idCelular") String idCelular,@PathVariable("idTelefono") String idTelefono ,
	    		         @PathVariable("idRUC") String idRUC, @PathVariable("idDireccion") String idDireccion,
	    		         @PathVariable("idRazonSocial") String idRazonSocial ,@PathVariable("idSerie") String idSerie,
	    		         @PathVariable("idNumero") String idNumero, @PathVariable("pagoVerifica") String pagoVerifica,
	    		         @PathVariable("idBloqueo") String idBloqueo,
	    		         @PathVariable("idPersona") String idPersona,
	    		         ModelMap model,HttpServletRequest request,HttpSession sesion) {
		  //pagoVerifica=monto total de la resrva hecha
		  
		  ReservaEL reserva= (ReservaEL)sesion.getAttribute("reservaEnSession");
   		  
		  List<HabitacionEL> lista= (List<HabitacionEL>)sesion.getAttribute("listahabitaciones");
		  
		  
		  reserva.setListaHabitaciones(lista);
		  
		  
		  PersonaEL p=new PersonaEL();
		  p.setNombre(nombre);
		  p.setDni(dni);
		  p.setApellidomaterno(idApellidoMaterno);
		  p.setApellidopaterno(idApellidoPaterno);
		  p.setCelular(idCelular);
		  p.setTelefono(idTelefono);
		  p.setRuc(idRUC);
		  p.setDireccion(idDireccion);
		  p.setRazonSocial(idRazonSocial);
		  p.setId(Integer.parseInt(idPersona.toString()));
		  
		  PagoEL pago=new PagoEL();
		  
		  pago.setSerie(idSerie);
		  pago.setNumerocorrelativo(Integer.parseInt(idNumero));
		  pago.setPagototal(Double.parseDouble(pagoVerifica));
		  
		  
		  int pagorealizado=0;
		  try {
			
			  int idfactura=0;
			  idfactura=Integer.parseInt(idBloqueo);
			  if(idfactura==2){				  
				  idfactura=1;				  
				int resulatdo= ReservaDL.instancia().sp_RegistrarReservaXML(reserva,pago,idfactura,p);
				
				if(resulatdo==1)pagorealizado=1;

			  }else if(idfactura==1){
				  idfactura=0;
				  
				  p.setRuc("");
				  p.setRazonSocial("");
				  
				  int resulatdo= ReservaDL.instancia().sp_RegistrarReservaXML(reserva,pago,idfactura,p);
				  if(resulatdo==1)pagorealizado=1;
				 
			  }
			  
			  
			  model.put("exitopago",pagorealizado);
			  
		} catch (Exception e) {
			// TODO: handle exception
			 model.put("exitopago",0);
		}
		  
		  
		return new ModelAndView("home",model);
	  }
	  
	  
	
}
