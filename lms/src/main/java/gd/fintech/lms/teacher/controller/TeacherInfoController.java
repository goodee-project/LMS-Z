package gd.fintech.lms.teacher.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherInfoService;
import gd.fintech.lms.vo.Teacher;

@Controller
public class TeacherInfoController {
	@Autowired TeacherInfoService teacherInfoService;
	
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
