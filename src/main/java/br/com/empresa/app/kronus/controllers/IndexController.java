package br.com.empresa.app.kronus.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.empresa.app.kronus.daos.EmpresaDAO;
import br.com.empresa.app.kronus.models.Empresa;

@Controller
@RequestMapping("/")
@Transactional
public class IndexController {

	private static final Logger logger = Logger.getLogger(IndexController.class);
	
	private List<Empresa> empresas;
	
	@Autowired
	private EmpresaDAO dao;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView view = new ModelAndView("public/index");
		view.addObject("empresas", empresas);
		return view;
	}
	
	@RequestMapping(value="/cadastro" ,method=RequestMethod.GET)
	public String cadastro() {
		return "public/cadastro";
	}
	
	@RequestMapping(value="/salvar", method=RequestMethod.POST)
	public String salvarEmresa( Empresa empresa ) {
		logger.debug(empresa.getRazaoSocial());
		logger.debug(empresa.getCnpj());
		//dao.save(empresa);
		return "public/cadastro";
	}
	
	@PostConstruct
	private void initEmpresas() {
		empresas = new ArrayList<Empresa>();
		
		Empresa empresa1 = new Empresa(111111111, "Teste1");
		Empresa empresa2 = new Empresa(222222222, "Teste2");
		Empresa empresa3 = new Empresa(333333333, "Teste3");
		
		empresas.add(empresa1);
		empresas.add(empresa2);
		empresas.add(empresa3);
		
	}
	
}
