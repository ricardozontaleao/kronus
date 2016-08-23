package br.com.empresa.app.kronus.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.empresa.app.kronus.daos.EmpresaDAO;
import br.com.empresa.app.kronus.models.Empresa;

@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	private EmpresaDAO dao;
	
	@RequestMapping(method=RequestMethod.GET)
	public String index() {
		return "public/index";
	}
	
	@RequestMapping(value="/cadastro" ,method=RequestMethod.GET)
	public String cadastro() {
		return "public/cadastro";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String salvarEmresa( Empresa empresa ) {
		System.out.println(empresa.getRazaoSocial());
		System.out.println(empresa.getCnpj());
		//dao.save(empresa);
		return "public/cadastro";
	}
	
}
