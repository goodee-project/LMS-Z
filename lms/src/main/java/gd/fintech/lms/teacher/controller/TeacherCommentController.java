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
	@GetMapping("/teacher/questionCommentList/{teacherId}/{questionNo}/{currentPage}")
	public String questionCommentList(Model model, @PathVariable(value = "teacherId") String teacherId, @PathVariable(value = "currentPage") int currentPage, @PathVariable(value = "questionNo") int questionNo) {
		
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
		
		List<QuestionComment> questionCommentList = teacherCommentService.getQuestionCommentList(beginRow, rowPerPage);
		model.addAttribute("questionCommentList", questionCommentList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "redirect:/teacher/questionCommentList/" + questionNo + "/" + currentPage;
	}
	
	//댓글 입력
	@PostMapping("/teacher/addQuestionComment/{teacherId}")
	public String addQuestionComment(QuestionComment questionComment, @PathVariable(value = "teacherId") String teacherId) {
		teacherCommentService.addQuestionComment(questionComment);
		return "redirect:/teacher/questionOne/" + teacherId + "/" +questionComment.getQuestionNo() + "/1";
	}
	
	//댓글삭제
	@GetMapping("/teacher/removeQuestionComment/{accountId}/{questionNo}/{questionCommentNo}/{currentPage}")
	public String removeQuestionComment(@PathVariable(value = "questionCommentNo") int questionCommentNo,
										@PathVariable(value = "questionNo") int questionNo,
										@PathVariable(value = "accountId") String accountId,
										@PathVariable(value = "currentPage") int currentPage) {
		
		teacherCommentService.removeQuestionComment(questionCommentNo);
		
		return "redirect:/teacher/questionOne/" + accountId + "/" + questionNo + "/" + currentPage;
	}
	
	//댓글수정 폼
	@GetMapping("/teacher/modifyQuestionComment/{teacherId}/{questionCommentNo}/{currentPage}")
	public String modifyQuestionComment(Model model, @PathVariable(value = "teacherId") String teacherId, @PathVariable(value = "questionCommentNo") int questionCommentNo, @PathVariable(value = "currentPage") int currentPage) {
		
		QuestionComment questionComment = teacherCommentService.questionCommentOne(questionCommentNo);
		model.addAttribute(questionComment);
		
		return "teacher/modifyQuestionComment";
	}
	
	//댓글수정 액션
	@PostMapping("/teacher/modifyQuestionComment/{teacherId}/{questionNo}/{currentPage}")
	public String modifyQuestionComment(QuestionComment questionComment, @PathVariable(value = "teacherId") String teacherId, @PathVariable(value = "questionNo") int questionNo, @PathVariable(value = "currentPage") int currentPage) {
		
		teacherCommentService.modifyQuestionComment(questionComment);
		
		return "redirect:/teacher/questionOne/" + teacherId + "/" + questionComment.getQuestionNo() + "/" + currentPage;
	}
}
