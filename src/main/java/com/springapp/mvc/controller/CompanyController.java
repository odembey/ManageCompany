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

import com.springapp.mvc.model.Company;
import com.springapp.mvc.service.ManagementService;

@Controller
public class CompanyController {
	
	private final ManagementService managementService;
	
	@Autowired
	public CompanyController(ManagementService managementService) {
		this.managementService = managementService;
	}
	
	@RequestMapping(value = "/detailsCompany", method = RequestMethod.GET)
	public String findCompany(ModelMap model) {
		model.put("company", new Company());
		model.put("companies", managementService.findAllCompanies());
		return "detailsCompany";
	}
	
	@RequestMapping(value = "/addCompany", method = RequestMethod.POST)
	public String addCompany(@ModelAttribute("company") @Valid Company company, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "addCompany";
		} else {
			if (managementService.findCompaniesByName(company.getName()).size() == 0) {
				if (company.getPhone().length() == 8) {
					String phoneNumber = String.format("%s %s %s", company.getPhone().substring(0, 2), company
							.getPhone().substring(2, 5),
							company.getPhone().substring(5, 8));
					company.setPhone(phoneNumber);
					managementService.saveCompany(company);
					return "redirect:/detailsCompany";
				}
				else {
					model.put("msgPhone", "Phone number invalid");
					return "addCompany";
				}
				
			}
			else {
				model.put("msgName", "Company name exist");
				return "addCompany";
			}
		}
	}
	
	@RequestMapping(value = "/addCmpForm", method = RequestMethod.GET)
	public String addCmp(ModelMap model) {
		model.put("company", new Company());
		return "addCompany";
	}
	
	@RequestMapping(value = "/deleteCompany/{companyId}", method = RequestMethod.POST)
	public String deleteCompany(@PathVariable("companyId") Long companyId) {
		managementService.deleteCompany(companyId);
		return "redirect:/detailsCompany";
	}
	
	@RequestMapping(value = "/findCompany", method = RequestMethod.GET)
	public String findCompanyByName(Company company, BindingResult result, Map<String, Object> model) {
		if (company.getName() == null) {
			company.setName(""); // empty string signifies broadest possible search
		}
		model.put("companiess", managementService.findCompaniesByName(company.getName()));
		return "/findCompaniesForm";
	}
	
	@RequestMapping(value = "/editCompany/{companyId}", method = RequestMethod.GET)
	public String editCompany(@PathVariable("companyId") Long companyId, Map<String, Object> model) {
		Company currentCompany = managementService.findCompanyById(companyId);
		model.put("company", currentCompany);
		managementService.deleteCompany(companyId);
		return "editCompanyForm";
	}
	
	@RequestMapping(value = "/updateCompany", method = RequestMethod.PUT)
	public String updateCompany(Company company, Map<String, Object> model) {
		managementService.saveCompany(company);
		return "redirect:/detailsCompany";
	}
}
