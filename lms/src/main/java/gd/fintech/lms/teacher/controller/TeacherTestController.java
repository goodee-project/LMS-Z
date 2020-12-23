package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherTestService;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.Test;

@Controller
public class TeacherTestController {
	@Autowired TeacherTestService teacherTestService;
	
	// 시험목록 출력
	// 각 강의당 시험이 하나이므로 페이징은 추가안함
	@GetMapping("/teacher/testList/{lectureNo}")
	public String testList(Model model,
							@PathVariable(value="lectureNo") int lectureNo) {
		Test test = teacherTestService.getTestList(lectureNo);
		model.addAttribute("test", test);
		
		return "teacher/testList";
	}
	
	// 시험문제, 답 상세보기
	@GetMapping("/teacher/testOne/{lectureNo}")
	public String testOne(Model model,
							@PathVariable(value="lectureNo") int lectureNo) {
		List<Multiplechoice> testOne = teacherTestService.getTestOne(lectureNo);
		model.addAttribute("testOne", testOne);
		
		return "teacher/testOne";
	}
	
	// 시험정보(일정) 추가 폼
	@GetMapping("/teacher/addTest/{lectureNo}")
	public String addTest(@PathVariable(value="lectureNo") int lectureNo) {
		return "teacher/addTest";
	}
	
	// 시험정보(일정) 추가 액션
	@PostMapping("/teacher/addTest/{lectureNo}")
	public String addTest(Test test,
							@PathVariable(value="lectureNo") int lectureNo) {
		teacherTestService.addTest(test);
		return "redirect:/teacher/testList/"+lectureNo;
	}
	
	// 시험정보(일정) 수정 폼
	@GetMapping("/teacher/modifyTest/{lectureNo}")
	public String modifyTest(Model model,
							@PathVariable(value="lectureNo") int lectureNo) {
		Test test = teacherTestService.getTestList(lectureNo);
		model.addAttribute("test", test);
		
		return "teacher/modifyTest";
	}
	
	// 시험정보(일정) 수정 액션
	@PostMapping("/teacher/modifyTest/{lectureNo}")
	public String modifyTest(Test test,
							@PathVariable(value="lectureNo") int lectureNo) {
		teacherTestService.modifyTest(test);
		return "redirect:/teacher/testList/"+lectureNo;
	}
}
