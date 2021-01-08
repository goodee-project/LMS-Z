package gd.fintech.lms.student.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.student.mapper.StudentQuestionFileMapper;
import gd.fintech.lms.student.mapper.StudentQuestionMapper;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Question;
import gd.fintech.lms.vo.QuestionAddForm;
import gd.fintech.lms.vo.QuestionComment;
import gd.fintech.lms.vo.QuestionFile;
import gd.fintech.lms.vo.Student;

@Service
public class StudentQuestionService {
	// 질문 파일업로드를 사용할시 파일이 저장될 경로(uploadfile폴더의 경로)를 지정해주세요

	@Autowired private StudentQuestionMapper studentQuestionMapper;
	@Autowired private StudentQuestionFileMapper studentQuestionFileMapper;
	
	public List<Question> getQuestionTitleSearch(String accountId,String questionTitle,int currentPage, int rowPerPage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountId", accountId);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		map.put("questionTitle", questionTitle);
		return studentQuestionMapper.selectQuestionTitleSearch(map);
	}
	
	public List<Question> getQuestionWriterSearch(String accountId,String questionWriter,int currentPage, int rowPerPage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountId", accountId);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		map.put("questionWriter", questionWriter);
		return studentQuestionMapper.selectQuestionWriterSearch(map);
	}
	//질문목록 리스트 페이징
	public List<Question> getQuestionPage(String accountId,int currentPage, int rowPerPage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountId", accountId);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return studentQuestionMapper.selectQuestionListPage(map);
	}
	
	public List<QuestionComment> getCommentList(int questionNo,int currentPage, int rowPerPage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questionNo", questionNo);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return studentQuestionMapper.selectCommentList(map);
	}
	
	//질문 조회수 증가
	public int updateQuestionCount(int questionNo) {
		return studentQuestionMapper.updateQuestionCount(questionNo);
	}
	
	//질문목록 행의 갯수 (페이징에 사용)
	public int totalQuestion(String accountId) {
		return studentQuestionMapper.totalCountQuestion(accountId);
	}
	
	public int totalQuestionComment(int questionNo) {
		return studentQuestionMapper.totalCountQuestionComment(questionNo);
	}
	
	public int totalSearchWriterQuestion(String questionWriter,String accountId) {
		return studentQuestionMapper.totalCountQuestionSearchWriter(questionWriter, accountId);
	}
	
	public int totalSearchTitleQuestion(String questionTitle,String accountId) {
		return studentQuestionMapper.totalCountQuestionSearchTitle(questionTitle, accountId);
	}
	
	//질문 상세히 보기
	public Question getQuestionOne(int questionNo) {
		Question question = studentQuestionMapper.selectQuestionOne(questionNo);
		return question;
	}
	
	public Student getStudentName(String accountId) {
		return studentQuestionMapper.selectStudentName(accountId);
	}
	
	//질문 등록 +(질문 파일)
	public void addQuestion(QuestionAddForm questionAddForm) {
		Question question = new Question();
		
		question.setLectureNo(questionAddForm.getLectureNo());
		question.setAccountId(questionAddForm.getAccountId());
		question.setQuestionWriter(questionAddForm.getQuestionWriter());
		question.setQuestionTitle(questionAddForm.getQuestionTitle());
		question.setQuestionContent(questionAddForm.getQuestionContent());
		question.setQuestionCreatedate(questionAddForm.getQuestionCreatedate());
		question.setQuestionUpdatedate(questionAddForm.getQuestionUpdatedate());
		question.setQuestionPassword(questionAddForm.getQuestionPassword());
		
		studentQuestionMapper.insertQuestion(question);
		
		List<QuestionFile> questionFile=null;
		if(questionAddForm.getQuestionFile() != null) {
			questionFile = new ArrayList<QuestionFile>();
			for(MultipartFile mf : questionAddForm.getQuestionFile()) {
				QuestionFile qf = new QuestionFile();
				qf.setQuestionNo(question.getQuestionNo());
				int count = 0;
				int p = mf.getOriginalFilename().lastIndexOf(".");
				
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-","");
				
				qf.setQuestionFileUuid(filename+ext);
				qf.setQuestionFileOriginal(mf.getOriginalFilename());
				qf.setQuestionFileSize(mf.getSize());
				qf.setQuestionFileType(mf.getContentType());
				qf.setQuestionFileCount(count);
				questionFile.add(qf);
				
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				
				String rootPath = request.getSession().getServletContext().getRealPath("/");
				
				String attachPath = "uploadfile\\questionfile\\";
				
				File f = new File(rootPath + attachPath + filename + ext);
				try {
					mf.transferTo(f);
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		} 
		if(questionFile != null) {
			for(QuestionFile qf : questionFile) {
				studentQuestionFileMapper.insertQuestionFile(qf);
			}
		}
	}
	
	// 질문 생성시 강의 목록중 질문 강의를 선택하기 위해 사용
	public List<Lecture> getLectureList(String accountId){
		return studentQuestionMapper.selectLectureList(accountId);
	}
	
	// 작성 질문 수정
	public void updateQuestion(QuestionAddForm questionAddForm) {
		Question question = new Question();
		question.setQuestionNo(questionAddForm.getQuestionNo());
		question.setLectureNo(questionAddForm.getLectureNo());
		question.setQuestionWriter(questionAddForm.getQuestionWriter());
		question.setQuestionTitle(questionAddForm.getQuestionTitle());
		question.setQuestionContent(questionAddForm.getQuestionContent());
		question.setQuestionUpdatedate(questionAddForm.getQuestionUpdatedate());
		question.setQuestionPassword(questionAddForm.getQuestionPassword());
		studentQuestionMapper.updateQuestion(question);
		
		List<QuestionFile> questionFile=null;
		if(questionAddForm.getQuestionFile() != null) {
			questionFile = new ArrayList<QuestionFile>();
			for(MultipartFile mf : questionAddForm.getQuestionFile()) {
				QuestionFile qf = new QuestionFile();
				qf.setQuestionNo(question.getQuestionNo());
				int count = 0;
				int p = mf.getOriginalFilename().lastIndexOf(".");
				
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-","");
				
				qf.setQuestionFileUuid(filename+ext);
				qf.setQuestionFileOriginal(mf.getOriginalFilename());
				qf.setQuestionFileSize(mf.getSize());
				qf.setQuestionFileType(mf.getContentType());
				qf.setQuestionFileCount(count);
				questionFile.add(qf);
				
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				
				String rootPath = request.getSession().getServletContext().getRealPath("/");
				
				String attachPath = "uploadfile\\questionfile\\";
				
				File f = new File(rootPath + attachPath + filename + ext);
				try {
					mf.transferTo(f);
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		} 
		if(questionFile != null) {
			for(QuestionFile qf : questionFile) {
				studentQuestionFileMapper.insertQuestionFile(qf);
			}
		}
	}
	
	// 작성 질문 전체 삭제 (삭제는 작성자만 할 수 있게 스크립트 코드를 사용합니다)
	public void deleteQuestion(int questionNo) {
		List<String> questionFileUuid = studentQuestionFileMapper.selectQuestionFileUuid(questionNo);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		String attachPath = "uploadfile\\questionfile\\";
		
		for(String s : questionFileUuid) {
			File file = new File(rootPath + attachPath+s);
			if(file.exists()) {
				file.delete();
			}
		}
		studentQuestionFileMapper.deleteAllQuestionFile(questionNo);
		studentQuestionMapper.deleteQuestionAllComment(questionNo);
		studentQuestionMapper.deleteQuestion(questionNo);
	}
	
	public int deleteQuestionOneFile(String questionFileUuid) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		String attachPath = "uploadfile\\questionfile\\";
		
		File file = new File(rootPath+attachPath+questionFileUuid);
		if(file.exists()) {
			file.delete();
		}
		return studentQuestionFileMapper.deleteOneQuestionFile(questionFileUuid);
	}
}
