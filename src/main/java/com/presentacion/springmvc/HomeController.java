package com.presentacion.springmvc;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import AccesoDatos.HabitacionDL;
import AccesoDatos.ReservaDL;
import AccesoDatos.UsuarioDL;
import Entidades.HabitacionEL;
import Entidades.PersonaEL;
import Entidades.ReservaEL;
import Entidades.UsuarioEL;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(ModelMap model, HttpSession sesion) {
		Integer id = (Integer) sesion.getAttribute("idUsuario");
		if(id != null)
			model.addAttribute("menu", 2);
		else
			model.addAttribute("menu", 1);
		return "home";
	}
	
	@RequestMapping(value = "/VerificarAcceso", method = RequestMethod.POST)
	@ResponseBody
	public String VerificarAcceso(ModelMap model, String nickname, String contrasena, HttpSession sesion){
		try{
			PersonaEL persona = UsuarioDL.instancia().VerificarAcessoPorPlataforma(nickname, contrasena, "1");
			UsuarioEL usuario = new UsuarioEL();
			usuario.setNickname(nickname);
			usuario.setContrasena(contrasena);
			persona.setUsuario(usuario);
			sesion.setAttribute("idUsuario", persona.getId());
			sesion.setAttribute("nombreUsuario", persona.getNombre() + " " + persona.getApellidopaterno() + " " + persona.getApellidomaterno());
			sesion.setAttribute("usuario", persona);
		} catch (Exception e) {
			return e.getMessage();
		}
		return "reservas";
	}
	
	@RequestMapping(value = "/Reservas", method = RequestMethod.GET)
	public String Reservas(ModelMap model, HttpSession sesion) {
		Integer id = (Integer) sesion.getAttribute("idUsuario");
		if(id != null){
			model.addAttribute("menu", 2);
			return "crearReserva";
		}else{
			model.addAttribute("menu", 1);
			return "home";
		}
	}
	
	@RequestMapping(value = "/Registro", method = RequestMethod.GET)
	public String Registro(ModelMap model, HttpSession sesion) {
		Integer id = (Integer) sesion.getAttribute("idUsuario");
		if(id != null){
			model.addAttribute("menu", 2);
			return "home";
		}else{
			model.addAttribute("menu", 1);
			return "crearPerfil";
		}
	}
	
	@RequestMapping(value = "/EditarPerfil", method = RequestMethod.GET)
	public String EditarPerfil(ModelMap model, HttpSession sesion) {
		Integer id = (Integer) sesion.getAttribute("idUsuario");
		if(id != null){
			model.addAttribute("menu", 2);
			return "editarPerfil";
		}else{
			model.addAttribute("menu", 1);
			return "home";
		}
	}
	
	@RequestMapping(value = "/CerrarSesion", method = RequestMethod.GET)
	public String CerrrarSesion(ModelMap model, HttpSession sesion) {
		Integer id = (Integer) sesion.getAttribute("idUsuario");
		if(id != null){
			sesion.removeAttribute("idUsuario");
			sesion.removeAttribute("usuario");
		}
		model.addAttribute("menu", 1);
		return "home";
	}
	
	@RequestMapping(value = "/ValidarBusqueda", method = RequestMethod.POST)
	public ModelAndView ValidarBusqueda(Model model, String fechaInicio, String fechaFin, HttpSession sesion){
		Integer id = (Integer) sesion.getAttribute("idUsuario");
		if(id != null){
			model.addAttribute("menu", 2);
			try{
				List<HabitacionEL> lista = HabitacionDL.instancia().sp_Buscar_Habitaciones_disponibles(fechaInicio, fechaFin);
				model.addAttribute("inicio", fechaInicio);
				model.addAttribute("fin", fechaFin);
				return new ModelAndView("crearReserva", "disponibles", lista);
			}catch(Exception e) {
				return new ModelAndView("crearReserva", "error", e.getMessage());
			}
		}else{
			model.addAttribute("menu", 1);
			model.addAttribute("mensaje", "Debes crear primero una cuenta o iniciar sesion");
			return new ModelAndView("crearPerfil", "perfil", new PersonaEL());
		}
	}
	
	@RequestMapping(value = "/HabitacionesDisponibles", method = RequestMethod.POST)
	public ModelAndView HabitacionesDisponibles(Model model, String fechaInicio, String fechaFin){
		try{
			List<HabitacionEL> lista = HabitacionDL.instancia().sp_Buscar_Habitaciones_disponibles(fechaInicio, fechaFin);
			return new ModelAndView("habitacionesDisponibles", "disponibles", lista);
		}catch(Exception e) {
			return new ModelAndView("habitacionesDisponibles", "error", e.getMessage());
		}
	}
	
	@RequestMapping(value = "/IniciarPago", method = RequestMethod.POST)
	public ModelAndView IniciarPago(Model model, String fechaInicio, String fechaFin, String[] listaHabitaciones, HttpSession sesion){
		try{
			ReservaEL reserva = new ReservaEL();
			reserva.setInicio(fechaInicio);
			reserva.setFin(fechaFin);
			Integer idUsuario = (Integer) sesion.getAttribute("idUsuario");
			PersonaEL persona = new PersonaEL();
			persona.setId(idUsuario);
			reserva.setPersona(persona);
			List<HabitacionEL> lista = new ArrayList<HabitacionEL>();
			for (String h : listaHabitaciones){
				HabitacionEL hab = HabitacionDL.instancia().sp_ObtenerDatosHabitacionParaReserva(Integer.parseInt(h));
				lista.add(hab);
			}
			reserva.setListaHabitaciones(lista);
			//puedes comentar el dl, es para probar que si inserta el xml, en este caso se hara desde el pago
			ReservaDL.instancia().sp_RegistrarReservaXML(reserva);
			model.addAttribute("menu", 2);
			return new ModelAndView("pago", "reserva", reserva);
		}catch(Exception e) {
			return new ModelAndView("crearReserva", "error", e.getMessage());
		}
	}
}
	
