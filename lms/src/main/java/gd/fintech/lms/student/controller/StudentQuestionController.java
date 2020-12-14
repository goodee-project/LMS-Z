package gd.fintech.lms.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.student.service.StudentQuestionService;
import gd.fintech.lms.vo.Question;

@Controller
public class StudentQuestionController {
	@Autowired StudentQuestionService StudentQuestionService;
	
	@GetMapping("/student/questionList")
	public String questionList(Model model, @RequestParam(name="currentPage", defaultValue="1")int currentPage) {
		int rowPerPage = 10;
		List<Question> questionList = StudentQuestionService.getQuestionPage(currentPage, rowPerPage);
		int countQuestion = StudentQuestionService.totalQuestion();
		int lastPage = countQuestion / rowPerPage;
		if(countQuestion % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("questionList", questionList);
		return "/student/questionList";
	}
	
	
}
