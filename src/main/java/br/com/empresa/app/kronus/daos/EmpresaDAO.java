package br.com.empresa.app.kronus.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.empresa.app.kronus.models.Empresa;

@Repository
public class EmpresaDAO {

	@PersistenceContext
	private EntityManager manager;

	public List<Empresa> listAll() {
		return manager.createQuery("select e from Empresa e", Empresa.class).getResultList();
	}

	public void save(Empresa empresa) {
		manager.persist(empresa);
	}

}
