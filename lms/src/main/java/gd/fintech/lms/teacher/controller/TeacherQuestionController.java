package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherQuestionService;
import gd.fintech.lms.vo.Question;

@Controller
public class TeacherQuestionController {
	@Autowired TeacherQuestionService questionTeacherService;
	
	//질문게시판 목록 출력
	@GetMapping("/teacher/questionList")
	public String questionList(Model model) {
		List<Question> questionList = questionTeacherService.getQuestionList();
		model.addAttribute("questionList", questionList);
		return "teacher/questionList";
	}
	
	//질문게시판 상세보기
	@GetMapping("/teacher/questionOne/{questionNo}")
	public String questionOne(Model model, @PathVariable(value = "questionNo") int questionNo) {
		Question question = questionTeacherService.getQuestionOne(questionNo);
		model.addAttribute("question", question);
		return "teacher/questionOne";
	}
}
