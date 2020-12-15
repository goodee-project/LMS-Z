package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentQuestionMapper;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Question;

@Service
public class StudentQuestionService {
	@Autowired private StudentQuestionMapper studentQuestionMapper;
	
	//질문목록 리스트 페이징
	public List<Question> getQuestionPage(int currentPage, int rowPerPage){
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		
		return studentQuestionMapper.selectQuestionListPage(map);
	}
	
	//질문목록 행의 갯수 (페이징에 사용)
	public int totalQuestion() {
		return studentQuestionMapper.totalCountQuestion();
	}
	
	//질문 상세히 보기
	public Question getQuestionOne(int questionNo) {
		Question question = studentQuestionMapper.selectQuestionOne(questionNo);
		return question;
	}
	
	//질문 등록
	public int addQuestion(Question question) {
		return studentQuestionMapper.insertQuestion(question);
	}
	
	public List<Lecture> getLectureList(){
		return studentQuestionMapper.selectLectureList();
	}
}
