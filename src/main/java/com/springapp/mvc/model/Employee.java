package com.springapp.mvc.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.springapp.mvc.util.UserType;

@Entity(name = "Employee")
public class Employee {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotEmpty
	@Size(max = 20)
	@Column(name = "firstName", length = 20)
	private String firstName;
	
	@NotEmpty
	@Size(max = 40)
	@Column(name = "lastName", length = 40)
	private String lastName;
	
	@Size(max = 20)
	@Column(name = "job", length = 20)
	private String job;
	
	@Column(name = "date")
	private String started_date;
	
	@NotNull
	@Column(name = "age")
	private Integer age;
	
	@Column(name = "type")
	private UserType userType;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getJob() {
		return job;
	}
	
	public void setJob(String job) {
		this.job = job;
	}
	
	public String getStarted_date() {
		return started_date;
	}
	
	public void setStarted_date(String started_date) {
		this.started_date = started_date;
	}
	
	public Integer getAge() {
		return age;
	}
	
	public void setAge(Integer age) {
		this.age = age;
	}
	
	public UserType getUserType() {
		return userType;
	}
	
	public void setUserType(UserType userType) {
		this.userType = userType;
	}
}
