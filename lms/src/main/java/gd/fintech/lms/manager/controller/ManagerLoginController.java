package gd.fintech.lms.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerLoginService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.ManagerForm;

@Controller
public class ManagerLoginController {
	@Autowired ManagerLoginService managerLoginService;
	
	
	@GetMapping(value={"/manager", "/manager/index"})
	public String index() {
		return "manager/index";
	}
	
	@GetMapping("/managerLogin")
	public String login() {
		return "manager/login";
	}
	
	@PostMapping("/managerLogin")
	public String login(Account account, HttpServletRequest request) {
		
		if(managerLoginService.getAccountToManagerLogin(account) == null) {
			return "redirect:/managerLogin";
		}
		
		HttpSession session = request.getSession();
	    session.setAttribute("managerId", account.getAccountId());
		
		return "redirect:/manager/index";
	}
	
	@GetMapping("/managerSignup")
	public String signup() {
		return "manager/signup";
	}
	
	@PostMapping("/managerSignup")
	public String signup(ManagerForm managerForm) {
		
		managerLoginService.addSignup(managerForm);
		return "redirect:/managerLogin";
	}
	
	@GetMapping("/manager/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/managerLogin#";
	}
}
