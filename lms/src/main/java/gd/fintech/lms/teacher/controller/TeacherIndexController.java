package gd.fintech.lms.teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TeacherIndexController {
	@GetMapping(value={"/teacher" ,"/teacher/index"})
	public String index() {
		return "teacher/index";
	}
}
