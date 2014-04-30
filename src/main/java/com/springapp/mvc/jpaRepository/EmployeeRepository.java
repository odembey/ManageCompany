package com.springapp.mvc.jpaRepository;

import java.util.Collection;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;

import com.springapp.mvc.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	
	Collection<Employee> findByFirstNameLike(String employeeFirstName) throws DataAccessException;
}
