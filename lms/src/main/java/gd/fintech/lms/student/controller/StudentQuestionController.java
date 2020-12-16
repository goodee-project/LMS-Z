package gd.fintech.lms.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.student.service.StudentLoginService;
import gd.fintech.lms.student.service.StudentQuestionService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Question;
import gd.fintech.lms.vo.QuestionAddForm;

@Controller
public class StudentQuestionController {
	@Autowired StudentQuestionService studentQuestionService;
	// 질문 목록 리스트
	@GetMapping("/student/questionList/{currentPage}")
	public String listQuestion(Model model, @PathVariable(name="currentPage",required=true)int currentPage) {
		int rowPerPage = 10;
		List<Question> questionList = studentQuestionService.getQuestionPage(currentPage, rowPerPage);
		int countQuestion = studentQuestionService.totalQuestion();
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
	
	// 질문 상세히 보기
	@GetMapping("/student/questionOne/{questionNo}")
	public String oneQuestion(Model model, @PathVariable(name="questionNo")int questionNo) {
		Question question = studentQuestionService.getQuestionOne(questionNo);
		model.addAttribute("question",question);
		return "/student/questionOne";
	}
	
	// 질문 등록 폼
	@GetMapping("/student/questionAdd")
	public String addQuestion(Model model) {
		List<Lecture> lectureList = studentQuestionService.getLectureList();
		model.addAttribute("lectureList", lectureList);
		return "/student/questionAdd";
	}
	
	// 질문 등록 액션
	@PostMapping("/student/questionAdd")
	public String addQuestion(QuestionAddForm questionAddForm) {
		studentQuestionService.addQuestion(questionAddForm);
		return "redirect:/student/questionList/1";
	}
	
	// 질문 삭제 
	@GetMapping("/student/removeQuestion/{questionNo}")
	public String removeQuestion(@PathVariable(name="questionNo")int questionNo) {
		studentQuestionService.deleteQuestion(questionNo);
		return "redirect:/student/questionList/1";
	}
	
	
}
