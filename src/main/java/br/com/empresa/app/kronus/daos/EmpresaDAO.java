package br.com.empresa.app.kronus.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.empresa.app.kronus.models.Empresa;

@Repository
public class EmpresaDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void save( Empresa empresa ) {
		manager.persist(empresa);
	}
	
	
}
