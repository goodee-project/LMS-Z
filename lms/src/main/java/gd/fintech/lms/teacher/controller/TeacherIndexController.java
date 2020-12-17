package gd.fintech.lms.teacher.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.teacher.service.TeacherLectureService;
import gd.fintech.lms.vo.Lecture;

@Controller
public class TeacherIndexController {
	@Autowired TeacherLectureService teacherLectureService;
	
	// index페이지(강의목록 출력)
	// 강의목록 페이징 추가 필요
	@GetMapping(value={"/teacher" ,"/teacher/index"})
	public String index(ServletRequest request, Model model) {
		// 세션 객체 선언
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		// 세션에서 로그인한 강사의 id값 받아오기
		String accountId = (String)session.getAttribute("teacherId");
		// 강의목록을 list 객체를 선언하여 입력
		List<Lecture> list = teacherLectureService.getLectureList(accountId);
		// model에 list 입력
		model.addAttribute("list", list);
		
		return "teacher/index";
	}
}
