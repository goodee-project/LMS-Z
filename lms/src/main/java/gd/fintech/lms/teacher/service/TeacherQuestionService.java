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
	@Autowired TeacherQuestionMapper TeacherquestionMapper;
	
	public List<Question> getQuestionList(){
		return TeacherquestionMapper.selectQuestionList();
	}
}
