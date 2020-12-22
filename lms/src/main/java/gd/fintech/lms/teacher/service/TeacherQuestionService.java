package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherQuestionMapper;
import gd.fintech.lms.vo.Question;

@Service
@Transactional
public class TeacherQuestionService {
	@Autowired TeacherQuestionMapper teacherQuestionMapper;
	
	//질문게시판 목록 출력
	public List<Question> getQuestionList(String teacherId, int beginRow, int rowPerPage){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountId", teacherId);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		return teacherQuestionMapper.selectQuestionList(map);
	}
	
	//질문게시판 총개수
	public int getQuestionCount(String accountId) {
		return teacherQuestionMapper.selectQuestionCount(accountId);
	}
	
	//질문게시판 상세보기
	public Question getQuestionOne(int questionNo, int beginRow, int rowPerPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questionNo", questionNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		return teacherQuestionMapper.selectQuestionOne(map);
	}
}
