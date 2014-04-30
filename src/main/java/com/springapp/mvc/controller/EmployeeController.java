package com.springapp.mvc.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springapp.mvc.model.Employee;
import com.springapp.mvc.service.ManagementService;

@Controller
public class EmployeeController {
	
	private final ManagementService managementService;
	
	@Autowired
	public EmployeeController(ManagementService managementService) {
		this.managementService = managementService;
	}
	
	@RequestMapping(value = "/detailsEmployee", method = RequestMethod.GET)
	public String findEmployee(ModelMap model) {
		model.addAttribute("employee", new Employee());
		model.addAttribute("employees", managementService.findAllEmployees());
		return "detailsEmployee";
	}
	
	@RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	public String addEmployee(@ModelAttribute("employee") @Valid Employee employee, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "addEmployee";
		} else {
			if ((Integer) employee.getAge() < 18) {
				model.put("msg", "Age minimale 18 ans");
				return "addEmployee";
			}
			else {
				managementService.saveEmployee(employee);
				return "redirect:/detailsEmployee";
			}
		}
	}
	
	@RequestMapping(value = "/addEmpForm", method = RequestMethod.GET)
	public String addEmployeeForm(ModelMap model) {
		model.put("employee", new Employee());
		return "addEmployee";
	}
	
	@RequestMapping(value = "/deleteEmployee/{employeeId}", method = RequestMethod.POST)
	public String deleteEmployee(@PathVariable("employeeId") Long employeeId) {
		managementService.deleteEmployee(employeeId);
		return "redirect:/detailsEmployee";
	}
	
	@RequestMapping(value = "/findEmployee", method = RequestMethod.GET)
	public String findEmployee(Employee employee, BindingResult result, Map<String, Object> model) {
		if (employee.getFirstName() == null) {
			employee.setFirstName(""); // empty string signifies broadest possible search
		}
		model.put("employeess", managementService.findEmployeesByFirstName(employee.getFirstName()));
		return "/findEmployeeForm";
	}
	
	@RequestMapping(value = "/editEmployee/{employeeId}", method = RequestMethod.GET)
	public String editEmployee(@PathVariable("employeeId") Long employeeId, Map<String, Object> model) {
		Employee currentEmployee = managementService.findEmployeeById(employeeId);
		model.put("employee", currentEmployee);
		managementService.deleteEmployee(employeeId);
		return "editEmployeeForm";
	}
	
	@RequestMapping(value = "/updateEmployee", method = RequestMethod.PUT)
	public String updateEmployee(Employee employee, Map<String, Object> model) {
		managementService.saveEmployee(employee);
		return "redirect:/detailsEmployee";
	}
}
