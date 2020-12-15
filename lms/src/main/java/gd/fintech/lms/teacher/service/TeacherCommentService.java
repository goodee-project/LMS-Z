package gd.fintech.lms.teacher.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherCommentMapper;
import gd.fintech.lms.vo.QuestionComment;

@Service
@Transactional
public class TeacherCommentService {
	
	@Autowired TeacherCommentMapper teacherCommentMapper;
	
	public List<QuestionComment> getQuestionCommentList(){
		return teacherCommentMapper.selectQuestionCommentList();
	}
	
	public int addQuestionComment(QuestionComment questionComment) {
		return teacherCommentMapper.insertQuestionComment(questionComment);
	}
	
	public int removeQuestionComment(int questionCommentNo) {
		return teacherCommentMapper.deleteQuestionComment(questionCommentNo);
	}
}
