package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherCommentService;
import gd.fintech.lms.vo.QuestionComment;

@Controller
public class TeacherCommentController {
	
	@Autowired TeacherCommentService teacherCommentService;
	
	//댓글목록 출력
	@GetMapping("/teacher/questionCommentList")
	public String questionCommentList(Model model) {
		
		List<QuestionComment> questionCommentList = teacherCommentService.getQuestionCommentList();
		model.addAttribute("questionCommentList", questionCommentList);
		
		return "redirect:/teacher/questionCommentList";
	}
	
	//댓글 입력
	@PostMapping("/teacher/addQuestionComment")
	public String addQuestionComment(QuestionComment questionComment) {
		teacherCommentService.addQuestionComment(questionComment);
		return "redirect:/teacher/questionOne/"+questionComment.getQuestionNo();
	}
	
	//댓글삭제
	@GetMapping("/teacher/removeQuestionComment/{accountId}/{questionNo}/{questionCommentNo}")
	public String removeQuestionComment(@PathVariable(value = "questionCommentNo") int questionCommentNo,
										@PathVariable(value = "questionNo") int questionNo,
										@PathVariable(value = "accountId") String accountId) {
		
		teacherCommentService.removeQuestionComment(questionCommentNo);
		
		return "redirect:/teacher/questionOne/"+questionNo;
	}
	
	//댓글상세보기
	@GetMapping("/teacher/questionCommentOne/{questionCommentNo}")
	public String questionCommentOne(Model model, @PathVariable(value = "questionCommentNo") int questionCommentNo) {
		
		QuestionComment questionComment = teacherCommentService.questionCommentOne(questionCommentNo);
		model.addAttribute("questionComment", questionComment);
		
		return "teacher/questionCommentOne";
	}
	
	//댓글수정 폼
	@GetMapping("/teacher/modifyQuestionComment/{questionCommentNo}")
	public String modifyQuestionComment(Model model, @PathVariable(value = "questionCommentNo") int questionCommentNo) {
		
		QuestionComment questionComment = teacherCommentService.questionCommentOne(questionCommentNo);
		model.addAttribute(questionComment);
		
		return "teacher/modifyQuestionComment";
	}
	
	//댓글수정 액션
	@PostMapping("/teacher/modifyQuestionComment/{questionNo}")
	public String modifyQuestionComment(QuestionComment questionComment) {
		
		teacherCommentService.modifyQuestionComment(questionComment);
		
		return "redirect:/teacher/questionOne/"+questionComment.getQuestionNo();
	}
}
