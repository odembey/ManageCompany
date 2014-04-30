/*
 * Copyright 2002-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.springapp.mvc.service;

import java.util.Collection;

import org.springframework.dao.DataAccessException;

import com.springapp.mvc.model.Company;
import com.springapp.mvc.model.Employee;

public interface ManagementService {
	
	Collection<Employee> findAllEmployees() throws DataAccessException;
	
	void saveEmployee(Employee employee) throws DataAccessException;
	
	void deleteEmployee(Long employeeId) throws DataAccessException;
	
	Collection<Employee> findEmployeesByFirstName(String firstName) throws DataAccessException;
	
	Collection<Company> findAllCompanies() throws DataAccessException;
	
	void saveCompany(Company company) throws DataAccessException;
	
	void deleteCompany(Long companyId) throws DataAccessException;
	
	Collection<Company> findCompaniesByName(String name) throws DataAccessException;
	
	Company findCompanyById(Long companyId) throws DataAccessException;
	
	Employee findEmployeeById(Long employeeId) throws DataAccessException;
	
}
