package com.springapp.mvc.jpaRepository;

import java.util.Collection;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;

import com.springapp.mvc.model.Company;

public interface CompanyRepository extends JpaRepository<Company, Long> {
	
	Collection<Company> findByNameLike(String name) throws DataAccessException;
}
