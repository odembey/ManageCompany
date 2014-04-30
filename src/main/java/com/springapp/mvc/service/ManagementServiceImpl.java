package com.springapp.mvc.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springapp.mvc.jpaRepository.CompanyRepository;
import com.springapp.mvc.jpaRepository.EmployeeRepository;
import com.springapp.mvc.model.Company;
import com.springapp.mvc.model.Employee;

/**
 * Created with IntelliJ IDEA.
 * User: mo
 * Date: 28/04/14
 * Time: 09:03
 * To change this template use File | Settings | File Templates.
 */
@Service
public class ManagementServiceImpl implements ManagementService {
	
	private CompanyRepository companyRepository;
	private EmployeeRepository employeeRepository;
	
	@Autowired
	public ManagementServiceImpl(CompanyRepository companyRepository, EmployeeRepository employeeRepository) {
		this.companyRepository = companyRepository;
		this.employeeRepository = employeeRepository;
	}
	
	@Override
	@Transactional(readOnly = true)
	public Collection<Employee> findAllEmployees() throws DataAccessException {
		return employeeRepository.findAll();
	}
	
	@Override
	@Transactional
	public void saveEmployee(Employee employee) throws DataAccessException {
		employeeRepository.save(employee);
	}
	
	@Override
	@Transactional
	public void deleteEmployee(Long employeeId) throws DataAccessException {
		employeeRepository.delete(employeeRepository.findOne(employeeId));
	}
	
	@Override
	@Transactional(readOnly = true)
	public Collection<Employee> findEmployeesByFirstName(String firstName) throws DataAccessException {
		return employeeRepository.findByFirstNameLike(firstName);
	}
	
	@Override
	@Transactional(readOnly = true)
	public Collection<Company> findAllCompanies() throws DataAccessException {
		return companyRepository.findAll();
	}
	
	@Override
	@Transactional
	public void saveCompany(Company company) throws DataAccessException {
		companyRepository.save(company);
	}
	
	@Override
	@Transactional
	public void deleteCompany(Long companyId) throws DataAccessException {
		companyRepository.delete(companyRepository.findOne(companyId));
	}
	
	@Override
	@Transactional(readOnly = true)
	public Collection<Company> findCompaniesByName(String name) throws DataAccessException {
		return companyRepository.findByNameLike(name);
	}
	
	@Override
	@Transactional(readOnly = true)
	public Company findCompanyById(Long companyId) throws DataAccessException {
		return companyRepository.findOne(companyId);
	}
	
	@Override
	@Transactional(readOnly = true)
	public Employee findEmployeeById(Long employeeId) throws DataAccessException {
		return employeeRepository.findOne(employeeId);
	}
}
