package gd.fintech.lms.student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentLoginService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.StudentForm;

@Controller
public class StudentLoginController {
	@Autowired StudentLoginService studentLoginService;
	
	// 로그인 폼으로 이동
	@GetMapping("/studentLogin")
	public String login() {
		return "student/login";
	}
	
	// 로그인 액션
	@PostMapping("/studentLogin")
	public String login(Account account, HttpServletRequest request) {
		if(studentLoginService.getAccountToStudentLogin(account) == null) {
			return "redirect:/studentLogin";
		}
		
		HttpSession session = request.getSession();
	    session.setAttribute("studentId", account.getAccountId());
	    
	    String studentImage = studentLoginService.getStudentImage(account.getAccountId());
	    session.setAttribute("studentImage", studentImage);
		
		return "student/index";
	}
	
	// 로그아웃
	@GetMapping("/student/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/studentLogin#";
	}
	
	// 회원가입 폼으로 이동
	@GetMapping("/studentSignup")
	public String signup() {
		return "student/signup";
	}
	
	// 회원가입 액션
	@PostMapping("/studentSignup")
	public String signup(StudentForm studentForm) {
		studentLoginService.addSignup(studentForm);
		
		return "redirect:/studentLogin";
	}
}













