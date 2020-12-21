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
import gd.fintech.lms.vo.Student;

@Controller
public class TeacherLectureController {
	@Autowired TeacherLectureService teacherLectureService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	// 강사별 강의목록 출력(accountId를 받아와서 강사 구분)
	@GetMapping("/teacher/lectureList/{teacherId}/{currentPage}")
	public String lectureList(Model model,
								@PathVariable(value="teacherId") String teacherId,
								@PathVariable(value="currentPage") int currentPage) {
		// 페이징에 필요한 변수 선언 및 초기화
		int rowPerPage = 5;
		int beginRow = (currentPage - 1) * rowPerPage;
		int lastPage = 0;
		int totalCount = teacherLectureService.getLectureCount(teacherId);
		// 마지막 페이지 구하기
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		}else {
			lastPage = totalCount / rowPerPage + 1;
		}
		
		// 리스트 객체 선언 및 service 메소드 호출해서 객체에 값 입력
		List<Lecture> list = teacherLectureService.getLectureList(teacherId, beginRow, rowPerPage);
		// model에 페이징값, list값 입력
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		return "teacher/lectureList";
	}
	
	// 강의 상세보기
	@GetMapping("/teacher/lectureOne/{lectureNo}")
	public String lectureOne(@PathVariable(value="lectureNo") int lectureNo) {
		return "teacher/lectureOne";
	}
	
	// 강의 상세보기->강의 계획서 출력
	@GetMapping("/teacher/lecturePlan/{lectureNo}")
	public String lecturePlan(Model model, 
							@PathVariable(value="lectureNo") int lectureNo) {
		// Lecture 객체 선언 및 service 메소드 호출해서 객체에 값 입력
		Lecture plan = teacherLectureService.getLectureOne(lectureNo);
		// debug test
		logger.debug("plan : " + plan.toString());
		// model에 lectureOne값 입력
		model.addAttribute("plan", plan);
		
		return "teacher/lecturePlan";
	}
}
