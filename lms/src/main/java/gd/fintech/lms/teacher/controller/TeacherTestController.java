package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherTestService;
import gd.fintech.lms.vo.Test;

@Controller
public class TeacherTestController {
	@Autowired TeacherTestService teacherTestService;
	
	// 시험목록 출력
	// 각 강의당 시험이 하나이므로 페이징은 추가안함
	@GetMapping("/teacher/testList/{lectureNo}")
	public String testList(Model model,
							@PathVariable(value="lectureNo") int lectureNo) {
		List<Test> test = teacherTestService.getTestList(lectureNo);
		model.addAttribute("test", test);
		
		return "teacher/testList";
	}
}
