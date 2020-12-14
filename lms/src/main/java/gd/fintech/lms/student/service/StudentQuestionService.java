package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentQuestionMapper;
import gd.fintech.lms.vo.Question;

@Service
public class StudentQuestionService {
	@Autowired private StudentQuestionMapper StudentQuestionMapper;
	
	//질문목록 리스트 페이징
	public List<Question> getQuestionPage(int currentPage, int rowPerPage){
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		
		return StudentQuestionMapper.selectQuestionListPage(map);
	}
	
	//질문목록 행의 갯수 (페이징에 사용)
	public int totalQuestion() {
		return StudentQuestionMapper.totalCountQuestion();
	}
}
