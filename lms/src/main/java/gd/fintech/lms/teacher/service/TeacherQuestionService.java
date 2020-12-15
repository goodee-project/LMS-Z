package gd.fintech.lms.teacher.service;

import java.util.List;

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
	public List<Question> getQuestionList(){
		return teacherQuestionMapper.selectQuestionList();
	}
	
	//질문게시판 상세보기
	public Question getQuestionOne(int questionNo) {
		return teacherQuestionMapper.selectQuestionOne(questionNo);
	}
}
