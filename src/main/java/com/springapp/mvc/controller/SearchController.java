package com.springapp.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * Employee: mo
 * Date: 21/04/14
 * Time: 17:03
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/")
public class SearchController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String find(ModelMap model) {
		model.addAttribute("message", "Welcome");
		return "find";
	}
}
