package gd.fintech.lms.admincontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.adminservice.LoginAdminService;

@Controller
public class LoginAdminController {
	@Autowired LoginAdminService loginAdminService;
	
	@GetMapping("/")
	public String mainLogin() {
		return "mainLogin";
	}
	
	@GetMapping(value = {"/adminLogin"})
	public String login() {
		return "admin/login";
	}
	
	@GetMapping(value = {"/admin/index"})
	public String index() {
		return "admin/index";
	}

}
