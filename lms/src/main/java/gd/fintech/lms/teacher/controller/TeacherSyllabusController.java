package gd.fintech.lms.teacher.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherSyllabusService;
import gd.fintech.lms.vo.Syllabus;

@Controller
public class TeacherSyllabusController {
	@Autowired TeacherSyllabusService teacherSyllabusService;
	
	// 강의계획서 추가 폼
	@GetMapping("/teacher/addSyllabus")
	public String addSyllabus() {
		return "teacher/addSyllabus";
	}
	
	// 강의계획서 추가 액션
	@PostMapping("/teacher/addSyllabus")
	public String addSyllabus(Syllabus syllabus) {
		teacherSyllabusService.addSyllabus(syllabus);
		return "redirect:/teacher/index";
	}
}
