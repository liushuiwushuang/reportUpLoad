package com.mvc.controller;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/parameter.do")
public class ParameterMappingController {
	protected final transient Log log = LogFactory
	.getLog(ParameterMappingController.class);
	
	public ParameterMappingController(){
		
	}
	
	@RequestMapping
	public String load(ModelMap modelMap){
		return "signin";
	}
	
	@RequestMapping(params = "method=register")
	public String regPage(HttpServletRequest request, ModelMap modelMap) throws Exception{
		return "register";
	}
	
	@RequestMapping(params = "method=turnToAddPage")
	public String addReport(HttpServletRequest request, ModelMap modelMap) throws Exception{
		return "new_report";
	}
	
	@RequestMapping(params = "method=upPage")
	public String upPage(HttpServletRequest request, ModelMap modelMap) throws Exception{
		return "uploadFile";
	}
	
}
