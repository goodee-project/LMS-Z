package gd.fintech.lms.teacher.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherInfoService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Teacher;

@Controller
public class TeacherInfoController {
	@Autowired TeacherInfoService teacherInfoService;
	
	// 패스워드 변경사이트 이동
	@GetMapping("/teacher/myInfoPw")
	public String modifyPw() {
		return "teacher/modifyPwMyInfo";
	}
	
	// 비밀번호가 변경 된 후에 로그아웃되고 로그인 페이지로 이동
	@PostMapping("/teacher/modifyPwMyInfo")
	public String modifyAccountPw(HttpSession session, Account account) {
		teacherInfoService.modifyAccountPw(account);
		session.invalidate();
		
		return "redirect:/teacherLogin";
	}
	
	// 강사 마이페이지 출력(강사 정보를 가져오기 위해 teacherId를 받아옴)
	@GetMapping("/teacher/myInfo/{teacherId}")
	public String myInfo(Model model,
						@PathVariable(value="teacherId") String teacherId) {
		// teacher 객체 선언하여 service의 메소드 호출 및 입력
		Teacher teacherOne = teacherInfoService.getTeacherInfo(teacherId);
		model.addAttribute("teacherOne", teacherOne);
		
		return "teacher/myInfo";
	}
}
