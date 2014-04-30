package com.springapp.mvc.util;

public enum UserType {
	
	Homme("Homme"),
	Femme("Femme");
	
	private String value;
	
	public String getValue() {
		return value;
	}
	
	public void setValue(String value) {
		this.value = value;
	}
	
	private UserType(String value) {
		this.value = value;
	}
	
}
