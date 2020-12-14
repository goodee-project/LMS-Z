package gd.fintech.lms.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.admin.service.LoginAdminService;

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
}
