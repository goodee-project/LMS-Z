package gd.fintech.lms.teacher.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import gd.fintech.lms.teacher.service.TeacherCommentService;
import gd.fintech.lms.teacher.service.TeacherQuestionService;
import gd.fintech.lms.vo.Question;

@Controller
public class TeacherQuestionController {
	@Autowired TeacherQuestionService teacherQuestionService;
	@Autowired TeacherCommentService teacherCommentService;
	
	//질문게시판 목록 출력
	@GetMapping("/teacher/questionList/{lectureNo}/{currentPage}")
	public String questionList(Model model,
									@PathVariable(value = "lectureNo") int lectureNo,
									@PathVariable(value = "currentPage") int currentPage) {
		
		//페이징에 필요한 변수선언
		int rowPerPage = 5;
		int beginRow = (currentPage - 1) * rowPerPage;
		int lastPage = 0;
		int totalCount = teacherQuestionService.getQuestionCount(lectureNo);
		
		//마지막 페이지
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		}else {
			lastPage = totalCount / rowPerPage + 1;
		}
		
		List<Question> questionList = teacherQuestionService.getQuestionList(lectureNo, beginRow, rowPerPage);
		model.addAttribute("questionList", questionList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		System.out.println("List ==>>>" + questionList);
		
		return "teacher/questionList";
	}
	
	//질문게시판 상세보기
	@GetMapping("/teacher/questionOne/{teacherId}/{questionNo}/{currentPage}")
	public String questionOne(Model model, @PathVariable(value = "teacherId") String teacherId, @PathVariable(value = "questionNo") int questionNo, @PathVariable(value = "currentPage") int currentPage) {
		
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
	
	//질문상세보기 조회수 증가
	@GetMapping("/teacher/modifyQuestionOneCount/{teacherId}/{questionNo}/{currentPage}")
	public String modifyQuestionOneCount(@PathVariable(value = "teacherId") String teacherId, 
										@PathVariable(value = "questionNo") int questionNo, 
										@PathVariable(value = "currentPage") int currentPage) {
		
		teacherQuestionService.modifyQuestionOneCount(questionNo);
		
		return "redirect:/teacher/questionOne/" + teacherId + "/" + questionNo + "/" + currentPage;
	}
	
	//파일다운로드
	@GetMapping("/teacher/questionFileDownload/{questionFileUuid}")
	public ResponseEntity<byte[]> displayFile(@PathVariable(name="questionFileUuid")String fileName,HttpServletResponse response)throws Exception{
		
		// 파일을 다운로드 받기 위한 스트림
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		String attachPath = "uploadfile\\questionfile\\";
		
		File f = new File(rootPath + attachPath + fileName);
		
		InputStream in = null;
		ResponseEntity<byte[]> entity= null;
				
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(f);
							
			// 다운로드 파일 컨텐트 타입
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			in.close();
		}
		return entity;
	}
	
}
