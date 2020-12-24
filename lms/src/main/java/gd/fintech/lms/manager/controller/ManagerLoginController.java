package gd.fintech.lms.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.manager.service.ManagerConnectService;
import gd.fintech.lms.manager.service.ManagerLoginService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.ManagerForm;

@Controller
public class ManagerLoginController {
	@Autowired ManagerLoginService managerLoginService;
	@Autowired ManagerConnectService managerConnectService;
	
	@GetMapping("/managerLogin")
	public String login(HttpSession session) {
		//로그인 상태일 때 로그인 창으로 접근 방지
		if(session.getAttribute("managerId") != null) {
			return "redirect:/manager/index";
		}
		return "manager/login";
	}
	
	// 로그인 액션
	@PostMapping("/managerLogin")
	public String login(Account account, HttpServletRequest request) {
		
		if(managerLoginService.getAccountToManagerLogin(account) == null) {
			return "redirect:/managerLogin";
		} else if(managerLoginService.getAccountToManagerLogin(account).equals("중복")) {
			return "redirect:/managerLogin";
		}
		
		HttpSession session = request.getSession();
	    session.setAttribute("managerId", account.getAccountId());
	    
	    String managerImage = managerLoginService.getManagerImage(account.getAccountId());
	    session.setAttribute("managerImage", managerImage);
		
		return "redirect:/manager/index";
	}
	
	// 회원가입 폼으로 이동
	@GetMapping("/managerSignup")
	public String signup() {
		return "manager/signup";
	}
	
	// 회원가입 액션
	@PostMapping("/managerSignup")
	public String signup(ManagerForm managerForm) {
		
		managerLoginService.addSignup(managerForm);
		return "redirect:/managerLogin";
	}
	
	// 로그아웃 액션
	@GetMapping("/manager/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/managerLogin";
	}
}
