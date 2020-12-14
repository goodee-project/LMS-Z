package gd.fintech.lms.teachercontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.teacherservice.TeacherQuestionService;
import gd.fintech.lms.vo.Question;

@Controller
public class TeacherQuestionController {
	@Autowired TeacherQuestionService questionTeacherService;
	
	@GetMapping("/teacher/questionList")
	public String questionList(Model model) {
		List<Question> questionList = questionTeacherService.getQuestionList();
		model.addAttribute("questionList", questionList);
		return "teacher/questionList";
	}
}
