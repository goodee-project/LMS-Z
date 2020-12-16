package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherLectureService;
import gd.fintech.lms.vo.Lecture;

@Controller
public class TeacherLectureController {
	@Autowired TeacherLectureService teacherLectureService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	// 강사별 강의목록 출력(accountId를 받아와서 강사 구분)
	@GetMapping("/teacher/lectureList/{teacherId}")
	public String lectureList(Model model,
								@PathVariable(value="teacherId") String teacherId) {
		// 리스트 객체 선언 및 service 메소드 호출해서 객체에 값 입력
		List<Lecture> list = teacherLectureService.getLectureList(teacherId);
		// model에 list값 입력
		model.addAttribute("list", list);
		return "teacher/lectureList";
	}
	
	// 강의 상세보기, 강의 계획서 출력
	@GetMapping("/teacher/lectureList/{lectureNo}")
	public String lectureOne(Model model, 
							@PathVariable(value="lectureNo") int lectureNo) {
		// Lecture 객체 선언 및 service 메소드 호출해서 객체에 값 입력
		Lecture lectureOne = teacherLectureService.getLectureOne(lectureNo);
		// debug test
		logger.debug("lectureOne : " + lectureOne.toString());
		// model에 lectureOne값 입력
		model.addAttribute("lectureOne", lectureOne);
		
		return "teacher/lectureOne";
	}
}
