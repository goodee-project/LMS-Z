package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherCommentService;
import gd.fintech.lms.teacher.service.TeacherQuestionService;
import gd.fintech.lms.vo.Question;

@Controller
public class TeacherQuestionController {
	@Autowired TeacherQuestionService teacherQuestionService;
	@Autowired TeacherCommentService teacherCommentService;
	
	//질문게시판 목록 출력
	@GetMapping("/teacher/questionList/{teacherId}/{currentPage}")
	public String questionList(Model model,
									@PathVariable(value = "teacherId") String teacherId,
									@PathVariable(value = "currentPage") int currentPage) {
		
		//페이징에 필요한 변수선언
		int rowPerPage = 5;
		int beginRow = (currentPage - 1) * rowPerPage;
		int lastPage = 0;
		int totalCount = teacherQuestionService.getQuestionCount(teacherId);
		
		//마지막 페이지
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		}else {
			lastPage = totalCount / rowPerPage + 1;
		}
		
		List<Question> questionList = teacherQuestionService.getQuestionList(teacherId, beginRow, rowPerPage);
		model.addAttribute("questionList", questionList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "teacher/questionList";
	}
	
	//질문게시판 상세보기
	@GetMapping("/teacher/questionOne/{questionNo}/{currentPage}")
	public String questionOne(Model model, @PathVariable(value = "questionNo") int questionNo, @PathVariable(value = "currentPage") int currentPage) {
		
		int rowPerPage = 5;
		int beginRow = (currentPage - 1) * rowPerPage;
		int lastPage = 0;
		int totalCount = teacherCommentService.getQuestionCommentCount(questionNo);
		
		//마지막 페이지
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		}else {
			lastPage = totalCount / rowPerPage + 1;
		}
		
		Question question = teacherQuestionService.getQuestionOne(questionNo, beginRow, rowPerPage);
		model.addAttribute("question", question);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		
		return "teacher/questionOne";
	}
}
