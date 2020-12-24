package gd.fintech.lms.teacher.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherLoginService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.ManagerForm;
import gd.fintech.lms.vo.TeacherForm;

@Controller
public class TeacherLoginController {
	@Autowired TeacherLoginService teacherLoginService;
	
	// 회원가입 폼으로 이동
	@GetMapping("/teacherSignup")
	public String signup() {
		return "teacher/signup";
	}
	
	// 회원가입 액션
	@PostMapping("/teacherSignup")
	public String signup(TeacherForm teacherForm) {
		
		teacherLoginService.addSignup(teacherForm);
		return "redirect:/teacherLogin";
	}
	
	// 로그인 폼으로 이동
	@GetMapping("/teacherLogin")
	public String login(HttpSession session) {
		//로그인 상태일 때 로그인 창으로 접근 방지
		if(session.getAttribute("teacherId") != null) {
			return "redirect:/teacher/index";
		}
		return "teacher/login";
	}
	
	// 로그인 액션
	@PostMapping("/teacherLogin")
	public String login(Account account, HttpServletRequest request) {
		
		if(teacherLoginService.getAccountToTeacherLogin(account) == null) {
			return "redirect:/teacherLogin";
		}
		
		HttpSession session = request.getSession();
	    session.setAttribute("teacherId", account.getAccountId());
	    
	    String teacherImage = teacherLoginService.getTeacherImage(account.getAccountId());
	    session.setAttribute("teacherImage", teacherImage);
		
		return "redirect:/teacher/index";
	}
	
	// 로그아웃 액션
	@GetMapping("/teacher/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/teacherLogin";
	}
}
