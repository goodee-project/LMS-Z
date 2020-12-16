package gd.fintech.lms.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudentIndexController {
	@GetMapping(value={"/student", "/student/index"})
	public String index() {
		return "student/index";
	}
}
