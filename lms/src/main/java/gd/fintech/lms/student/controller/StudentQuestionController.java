package gd.fintech.lms.student.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import gd.fintech.lms.student.service.StudentLoginService;
import gd.fintech.lms.student.service.StudentQuestionService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Question;
import gd.fintech.lms.vo.QuestionAddForm;
import gd.fintech.lms.vo.QuestionComment;
import gd.fintech.lms.vo.Student;

@Controller
public class StudentQuestionController {
	@Autowired StudentQuestionService studentQuestionService;
	private static String OS = System.getProperty("os.name").toLowerCase();
	// 질문 목록 리스트
	@GetMapping("/student/questionList/{accountId}/{currentPage}")
	public String listQuestion(Model model, 
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage = 5;
		List<Lecture> lectureList = studentQuestionService.getLectureList(accountId);
		List<Question> questionList = studentQuestionService.getQuestionPage(accountId,currentPage, rowPerPage);
		int countQuestion = studentQuestionService.totalQuestion(accountId);
		int lastPage = countQuestion / rowPerPage;
		
		int listUnderPerPage = 10;	
		int listUnderFirstPage = currentPage - (currentPage % listUnderPerPage) + 1;
		int listUnderLastPage = listUnderFirstPage + listUnderPerPage - 1;
		
		if (currentPage % listUnderPerPage == 0 && currentPage != 0) {
			listUnderFirstPage = listUnderFirstPage - listUnderPerPage;
			listUnderLastPage = listUnderLastPage - listUnderPerPage;
		}
		
		if(countQuestion % rowPerPage !=0) {
			lastPage +=1;
		}
	
		model.addAttribute("listUnderPerPage",listUnderPerPage);
		model.addAttribute("listUnderFirstPage",listUnderFirstPage);
		model.addAttribute("listUnderLastPage",listUnderLastPage);
		model.addAttribute("listCurrentPage",currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("questionList", questionList);
		model.addAttribute("lectureList", lectureList);
		return "/student/questionList";
	}
	
	// 페이징 변경해
	@GetMapping("/student/questionLectureSearch/{accountId}/{lectureNo}/{currentPage}")
	public String searchLectureQuestion(Model model, 
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="lectureNo")int lectureNo,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage = 5;
		List<Lecture> lectureList = studentQuestionService.getLectureList(accountId);
		List<Question> questionList = studentQuestionService.getQuestionLetureSearch(accountId, lectureNo, currentPage, rowPerPage);
		int countQuestionLecture = studentQuestionService.totalSearchLectureQuestion(lectureNo, accountId);
		int lastLecturePage = countQuestionLecture / rowPerPage;
		
		int lectureUnderPerPage = 10;	
		int lectureUnderFirstPage = currentPage - (currentPage % lectureUnderPerPage) + 1;
		int lectureUnderLastPage = lectureUnderFirstPage + lectureUnderPerPage - 1;
		
		if (currentPage % lectureUnderPerPage == 0 && currentPage != 0) {
			lectureUnderFirstPage = lectureUnderFirstPage - lectureUnderPerPage;
			lectureUnderLastPage = lectureUnderLastPage - lectureUnderPerPage;
		}
		
		if(countQuestionLecture % rowPerPage !=0) {
			lastLecturePage +=1;
		}
	
		model.addAttribute("lectureUnderPerPage",lectureUnderPerPage);
		model.addAttribute("lectureUnderFirstPage",lectureUnderFirstPage);
		model.addAttribute("lectureUnderLastPage",lectureUnderLastPage);
		model.addAttribute("lectureCurrentPage",currentPage);
		model.addAttribute("lastLecturePage", lastLecturePage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("questionList", questionList);
		model.addAttribute("lectureList", lectureList);
		model.addAttribute("lectureNo", lectureNo);
		return "/student/questionList";
	}
	
	@GetMapping("/student/questionTitleSearch/{accountId}/{questionTitle}/{currentPage}")
	public String searchTitleQuestion(Model model, 
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="questionTitle")String questionTitle, 
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage = 5;
		List<Question> questionList = studentQuestionService.getQuestionTitleSearch(accountId,questionTitle,currentPage, rowPerPage);
		int countQuestionTitle = studentQuestionService.totalSearchTitleQuestion(questionTitle, accountId);
		int lastTitlePage = countQuestionTitle / rowPerPage;
		
		int titleUnderPerPage = 10;	
		int titleUnderFirstPage = currentPage - (currentPage % titleUnderPerPage) + 1;
		int titleUnderLastPage = titleUnderFirstPage + titleUnderPerPage - 1;
		
		if (currentPage % titleUnderPerPage == 0 && currentPage != 0) {
			titleUnderFirstPage = titleUnderFirstPage - titleUnderPerPage;
			titleUnderLastPage = titleUnderLastPage - titleUnderPerPage;
		}
		
		if(countQuestionTitle % rowPerPage !=0) {
			lastTitlePage +=1;
		}
		model.addAttribute("titleUnderPerPage",titleUnderPerPage);
		model.addAttribute("titleUnderFirstPage",titleUnderFirstPage);
		model.addAttribute("titleUnderLastPage",titleUnderLastPage);
		model.addAttribute("titleCurrentPage",currentPage);
		model.addAttribute("questionTitle",questionTitle);
		model.addAttribute("questionList",questionList);
		model.addAttribute("lastTitlePage",lastTitlePage);
		return "/student/questionList";
	}
	
	// 질문 상세히 보기
	@GetMapping("/student/questionOne/{questionNo}/{accountId}/{currentPage}")
	public String oneQuestion(Model model, 
			@PathVariable(name="questionNo")int questionNo,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage = 3;
		Question question = studentQuestionService.getQuestionOne(questionNo);
		List<QuestionComment> questionCommet = studentQuestionService.getCommentList(questionNo, currentPage, rowPerPage);
		Student student = studentQuestionService.getStudentName(accountId);
		
		
		int countQuestionComment = studentQuestionService.totalQuestionComment(questionNo);
		int lastCommentPage = countQuestionComment / rowPerPage;
		int commentUnderPerPage = 10;	
		int commentUnderFirstPage = currentPage - (currentPage %  commentUnderPerPage) + 1;
		int  commentUnderLastPage =  commentUnderFirstPage +  commentUnderPerPage - 1;
		
		if (currentPage %  commentUnderPerPage == 0 && currentPage != 0) {
			 commentUnderFirstPage =  commentUnderFirstPage -  commentUnderPerPage;
			 commentUnderLastPage =  commentUnderLastPage -  commentUnderPerPage;
		}
		
		if(countQuestionComment % rowPerPage !=0) {
			lastCommentPage +=1;
		}
		model.addAttribute("commentUnderPerPage",commentUnderPerPage);
		model.addAttribute("commentUnderFirstPage",commentUnderFirstPage);
		model.addAttribute("commentUnderLastPage",commentUnderLastPage);
		model.addAttribute("commentCurrentPage",currentPage);
		model.addAttribute("lastCommentPage", lastCommentPage);
		model.addAttribute("questionCommet",questionCommet);
		model.addAttribute("question",question);
		model.addAttribute("student", student);
		return "/student/questionOne";
	}
		
	@GetMapping("/student/questionPw/{questionNo}")
	public String PwQuestion(Model model,
			@PathVariable(name="questionNo")int questionNo) {
		Question question = studentQuestionService.getQuestionOne(questionNo);
		
		model.addAttribute("question", question);
		return "/student/questionPw";
	}
	
	@GetMapping("/student/questionWriterSearch/{accountId}/{questionWriter}/{currentPage}")
	public String searchWriterQuestion(Model model,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="questionWriter")String questionWriter,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage = 5;
		List<Question> questionList = studentQuestionService.getQuestionWriterSearch(accountId,questionWriter,currentPage, rowPerPage);
		int countQuestionWriter = studentQuestionService.totalSearchWriterQuestion(questionWriter, accountId);
		int lastWriterPage = countQuestionWriter / rowPerPage;
		
		int writerUnderPerPage = 10;	
		int writerUnderFirstPage = currentPage - (currentPage % writerUnderPerPage) + 1;
		int writerUnderLastPage = writerUnderFirstPage + writerUnderPerPage - 1;
		
		if (currentPage % writerUnderPerPage == 0 && currentPage != 0) {
			writerUnderFirstPage = writerUnderFirstPage - writerUnderPerPage;
			writerUnderLastPage = writerUnderLastPage - writerUnderPerPage;
		}
		
		if(countQuestionWriter % rowPerPage !=0) {
			lastWriterPage +=1;
		}
		model.addAttribute("writerUnderPerPage",writerUnderPerPage);
		model.addAttribute("writerUnderFirstPage",writerUnderFirstPage);
		model.addAttribute("writerUnderLastPage",writerUnderLastPage);
		model.addAttribute("writerCurrentPage",currentPage);
		model.addAttribute("questionWriter", questionWriter);
		model.addAttribute("lastWriterPage", lastWriterPage);
		model.addAttribute("questionList",questionList);
		return "/student/questionList";
	}
	
	@GetMapping("/student/questionCountUp/{accountId}/{questionNo}")
	public String CountUpQuestion(@PathVariable(name="accountId")String accountId,
			@PathVariable(name="questionNo")int questionNo) {
		studentQuestionService.updateQuestionCount(questionNo);
		return "redirect:/student/questionOne/{questionNo}/{accountId}/1";
	}
	
	// 질문 등록 폼
	@GetMapping("/student/questionAdd/{accountId}")
	public String addQuestion(Model model,@PathVariable(name="accountId")String accountId) {
		List<Lecture> lectureList = studentQuestionService.getLectureList(accountId);
		Student student = studentQuestionService.getStudentName(accountId);
		model.addAttribute("student", student);
		model.addAttribute("lectureList", lectureList);
		return "/student/questionAdd";
	}
	
	// 질문 등록 액션
	@PostMapping("/student/questionAdd")
	public String addQuestion(QuestionAddForm questionAddForm,
			@RequestParam(value="studentId")String studentId) {
		
		// db에 모든 html태그 접근 제한
		String title = questionAddForm.getQuestionTitle().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		questionAddForm.setQuestionTitle(title);
		String content = questionAddForm.getQuestionContent().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		questionAddForm.setQuestionContent(content);
		
		studentQuestionService.addQuestion(questionAddForm);
		return "redirect:/student/questionList/"+studentId+"/1";
	}
	
	@PostMapping("/student/questionCommentAdd/{questionNo}/{accountId}")
	public String addQuestionCommetn(QuestionComment questionComment,
			@RequestParam(value="questionNo")int questionNo,
			@PathVariable(name="accountId")String accountId) {
		studentQuestionService.addQuestionComment(questionComment);
		return "redirect:/student/questionOne/{questionNo}/{accountId}/1";
	}
	
	//댓글 수정 폼
	@GetMapping("/student/questionCommentModify/{questionNo}/{questionCommentNo}/{accountId}")
	public String modifyQuestionComment(Model model,
			@PathVariable(name="questionNo")int questionNo,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="questionCommentNo")int questionCommentNo) {
		Question question = studentQuestionService.getQuestionOne(questionNo);
		QuestionComment questionComment = studentQuestionService.getQuestionCommetnOne(questionCommentNo);
		
		Student student = studentQuestionService.getStudentName(accountId);
		model.addAttribute("student", student);
		
		model.addAttribute("question",question);
		model.addAttribute("questionComment",questionComment);
		return "/student/questionCommentModify";
	}
	
	@PostMapping("/student/questionCommentModify/{questionNo}/{accountId}")
	public String modifyQuestionComment(QuestionComment questionComment,
			@PathVariable(name="questionNo")int questionNo,
			@PathVariable(name="accountId")String accountId) {
		studentQuestionService.updateQuestionComment(questionComment);
		return "redirect:/student//questionOne/{questionNo}/{accountId}/1";
	}
	
	//질문 수정 폼
	@GetMapping("/student/questionModify/{accountId}/{questionNo}")
	public String modifyQuestion(Model model,
			@PathVariable(name="questionNo")int questionNo,
			@PathVariable(name="accountId")String accountId) {
		Question question = studentQuestionService.getQuestionOne(questionNo);
		List<Lecture> lectureList = studentQuestionService.getLectureList(accountId);
		Student student = studentQuestionService.getStudentName(accountId);
		model.addAttribute("student", student);
		model.addAttribute("lectureList", lectureList);
		model.addAttribute("question",question);
		return "/student/questionModify";
	}
	
	//질문 수정 액션
	@PostMapping("student/questionModify/{accountId}")
	public String modifyQuestion(QuestionAddForm questionAddForm,
			@RequestParam(value="questionNo")int questionNo,
			@PathVariable(name="accountId")String accountId) {
		
		// db에 모든 html태그 접근 제한
		String title = questionAddForm.getQuestionTitle().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		questionAddForm.setQuestionTitle(title);
		String content = questionAddForm.getQuestionContent().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		questionAddForm.setQuestionContent(content);
		
		studentQuestionService.updateQuestion(questionAddForm);
		return "redirect:/student/questionOne/"+questionNo+"/{accountId}/1";
	}
	// 질문 삭제 
	@GetMapping("/student/questionRemove/{accountId}/{questionNo}")
	public String removeQuestion(
			@PathVariable(name="questionNo")int questionNo,
			@PathVariable(name="accountId")String accountId) {
		studentQuestionService.deleteQuestion(questionNo);
		return "redirect:/student/questionList/"+accountId+"/1";
	}
	
	@GetMapping("/student/questionCommentRemove/{questionNo}/{questionCommentNo}/{accountId}")
	public String removeQuestionComment(@PathVariable(name="questionNo")int questionNo,
			@PathVariable(name="questionCommentNo")int questionCommentNo,
			@PathVariable(name="accountId")String accountId) {
		studentQuestionService.deleteQuestionComment(questionCommentNo);
		return "redirect:/student/questionOne/{questionNo}/{accountId}/1";
		
	}
	
	@GetMapping("/student/questionFileRemove/{accountId}")
	public String removeQuestionFile(@RequestParam(value="questionFileUuid")String questionFileUuid,
			@RequestParam(value="questionNo")int questionNo,
			@PathVariable(name="accountId")String accountId) {
		studentQuestionService.deleteQuestionOneFile(questionFileUuid);
		return "redirect:/student/questionModify/{accountId}/"+questionNo;
	}
	
	@GetMapping("/student/questionFileCount/{questionFileUuid}")
	public String countUpQuestionFile(@PathVariable(name="questionFileUuid")String questionFileUuid) {
		studentQuestionService.updateQuestionFileCount(questionFileUuid);
		return "redirect:/student/questionFileDownload/{questionFileUuid}";
	}
	
	@GetMapping("/student/questionFileDownload/{questionFileUuid}")
	public ResponseEntity<byte[]> displayFile(@PathVariable(name="questionFileUuid")String fileName,HttpServletResponse response)throws Exception{
		// 파일을 다운로드 받기 위한 스트림
		
		String rootPath = "";
		
		String attachPath = "";
		
		if ( OS.indexOf("nux") >= 0) {
        	rootPath = "/var/lib/tomcat9/webapps/lms/";
        	attachPath = "uploadfile/questionfile/";
        } else {
            File file = new File("");
            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
            attachPath = "uploadfile\\questionfile\\";
        }
		
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
