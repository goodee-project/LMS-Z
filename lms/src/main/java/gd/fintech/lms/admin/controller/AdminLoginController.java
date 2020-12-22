package gd.fintech.lms.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gd.fintech.lms.admin.service.AdminLoginService;
import gd.fintech.lms.vo.Account;

@Controller
public class AdminLoginController {
	@Autowired AdminLoginService adminLoginService;
	
	@GetMapping("/")
	public String mainLogin() {
		return "mainLogin";
	}
	
	@GetMapping(value = {"/adminLogin"})
	public String login(HttpSession session) {
		//세션에 adminId로 로그인이 되지 않았다면
		System.out.println("adminLogin컨트롤러 진입");
		if(session.getAttribute("adminId") != null) {
			System.out.println("세션값 있음");
			return "redirect:/admin/index";
		}
		System.out.println("세션에 값 없음");
		return "admin/login";
	}
	
	@PostMapping("/adminLogin")
	public String login(Account account, HttpSession session) {
		String adminId = adminLoginService.getAdminAccount(account);
		if(adminId == null) {
			return "redirect:/adminLogin";
		}
		//session에 adminId 저장 
		session.setAttribute("adminId", adminId);
		// -> listener로 이동
		return "redirect:/admin/index";
	}
	
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("세션삭제");
		return "redirect:/adminLogin";
	}
}
