package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.teacher.service.TeacherCommentService;
import gd.fintech.lms.vo.QuestionComment;

@Controller
public class TeacherCommentController {
	
	@Autowired TeacherCommentService teacherCommentService;
	
	@GetMapping("/teacher/questionCommentList")
	public String questionCommentList(Model model) {
		
		List<QuestionComment> questionCommentList = teacherCommentService.getQuestionCommentList();
		model.addAttribute("questionCommentList", questionCommentList);
		
		return "teacher/questionCommentList";
	}
}
