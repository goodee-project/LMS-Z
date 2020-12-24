package gd.fintech.lms.student.controller;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	public String listQuestion(Model model, @PathVariable(name="currentPage")int currentPage) {
		int rowPerPage = 5;
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
	@GetMapping("/student/questionTitleSearch/{questionTitle}/{currentPage}")
	public String searchTitleQuestion(Model model, 
			@PathVariable(name="questionTitle")String questionTitle, 
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage = 1;
		List<Question> questionList = studentQuestionService.getQuestionTitleSearch(questionTitle,currentPage, rowPerPage);
		int countQuestionTitle = studentQuestionService.totalSearchTitleQuestion(questionTitle);
		int lastPage = countQuestionTitle / rowPerPage;
		if(countQuestionTitle % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("questionList",questionList);
		return "/student/questionList";
	}
	
	@GetMapping("/student/questionWriterSearch/{questionWriter}/{currentPage}")
	public String searchWriterQuestion(Model model, 
			@PathVariable(name="questionWriter")String questionWriter,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage = 1;
		List<Question> questionList = studentQuestionService.getQuestionWriterSearch(questionWriter,currentPage, rowPerPage);
		int countQuestionWriter = studentQuestionService.totalSearchWriterQuestion(questionWriter);
		int lastPage = countQuestionWriter / rowPerPage;
		if(countQuestionWriter % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("questionList",questionList);
		return "/student/questionList";
	}
	
	@GetMapping("/student/questionCountUp/{questionNo}")
	public String CountUpQuestion(@PathVariable(name="questionNo")int questionNo) {
		studentQuestionService.updateQuestionCount(questionNo);
		return "redirect:/student/questionOne/{questionNo}";
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
	
	//질문 수정 폼
	@GetMapping("/student/questionModify/{questionNo}")
	public String modifyQuestion(Model model,@PathVariable(name="questionNo")int questionNo) {
		Question question = studentQuestionService.getQuestionOne(questionNo);
		List<Lecture> lectureList = studentQuestionService.getLectureList();
		model.addAttribute("lectureList", lectureList);
		model.addAttribute("question",question);
		return "/student/questionModify";
	}
	
	//질문 수정 액션
	@PostMapping("student/questionModify")
	public String modifyQuestion(QuestionAddForm questionAddForm,@RequestParam(value="questionNo")int questionNo) {
		studentQuestionService.updateQuestion(questionAddForm);
		return "redirect:/student/questionOne/"+questionNo;
	}
	// 질문 삭제 
	@GetMapping("/student/questionRemove/{questionNo}")
	public String removeQuestion(@PathVariable(name="questionNo")int questionNo) {
		studentQuestionService.deleteQuestion(questionNo);
		return "redirect:/student/questionList/1";
	}
	
	@GetMapping("/student/questionFileRemove")
	public String removeQuestionFile(@RequestParam(value="questionFileUuid")String questionFileUuid,
			@RequestParam(value="questionNo")int questionNo) {
		studentQuestionService.deleteQuestionOneFile(questionFileUuid);
		return "redirect:/student/questionModify/"+questionNo;
	}
	
	@GetMapping("/student/questionFileDownload/{questionFileUuid}")
	public ResponseEntity<byte[]> displayFile(@PathVariable(name="questionFileUuid")String fileName)throws Exception{
		String PATH ="C:\\Users\\git\\LMS-Z\\lms\\src\\main\\webapp\\uploadfile\\questionfile";
		// 파일을 다운로드 받기 위한 스트림
		InputStream in = null;
		ResponseEntity<byte[]> entity= null;
				
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(PATH + fileName);
					
			// 다운로드 파일 컨텐트 타입
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			in.close();
		}
		return entity;
	}
}
