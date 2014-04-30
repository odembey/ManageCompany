package com.springapp.mvc.model;

import javax.persistence.*;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity(name = "COMPANY")
public class Company {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotEmpty
	@Size(max = 20)
	@Column(name = "name", length = 20)
	private String name;
	
	@NotEmpty
	@Size(max = 40)
	@Column(name = "adresse", length = 40)
	private String adresse;
	
	@Size(max = 100)
	@Column(name = "phone", length = 100)
	private String phone;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getAdresse() {
		return adresse;
	}
	
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
}
