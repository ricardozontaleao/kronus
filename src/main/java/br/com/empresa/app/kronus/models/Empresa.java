package br.com.empresa.app.kronus.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(schema = "cadastro", name = "empresa")
public class Empresa {

	public Empresa() {
		super();
	}

	public Empresa(Long cnpj, String razaoSocial) {
		super();
		this.cnpj = cnpj;
		this.razaoSocial = razaoSocial;
	}

	@Id
	@Column(name = "cnpj")
	private Long cnpj;

	@Column(name = "razao_social")
	private String razaoSocial;

	public Long getCnpj() {
		return cnpj;
	}

	public void setCnpj(Long cnpj) {
		this.cnpj = cnpj;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

}
