package gd.fintech.lms.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gd.fintech.lms.admin.service.LoginAdminService;
import gd.fintech.lms.vo.Account;

@Controller
public class LoginAdminController {
	@Autowired LoginAdminService loginAdminService;
	
	@GetMapping("/")
	public String mainLogin() {
		return "mainLogin";
	}
	
	@GetMapping(value = {"/adminLogin"})
	public String login(HttpSession session) {
		if(session.getAttribute("adminId") != null) {
			return "redirect:/admin/index";
		}
		return "admin/login";
	}
	
	@PostMapping("/adminLogin")
	public String login(Account account, HttpSession session) {
		String adminId = loginAdminService.getAdminAccount(account);
		if(adminId == null) {
			return "redirect:/adminLogin";
		}
		session.setAttribute("adminId", adminId);
		return "redirect:/admin/index";
	}
	
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/adminLogin";
	}
}
