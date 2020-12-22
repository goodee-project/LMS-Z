package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherCommentMapper;
import gd.fintech.lms.vo.QuestionComment;

@Service
@Transactional
public class TeacherCommentService {
	
	@Autowired TeacherCommentMapper teacherCommentMapper;
	
	public List<QuestionComment> getQuestionCommentList(int beginRow, int rowPerPage){
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		return teacherCommentMapper.selectQuestionCommentList(map);
	}
	
	public int getQuestionCommentCount(int questionNo) {
		return teacherCommentMapper.selectQuestionCommentCount(questionNo);
	}
	
	public int addQuestionComment(QuestionComment questionComment) {
		return teacherCommentMapper.insertQuestionComment(questionComment);
	}
	
	public int removeQuestionComment(int questionCommentNo) {
		return teacherCommentMapper.deleteQuestionComment(questionCommentNo);
	}
	
	public int modifyQuestionComment(QuestionComment questionComment) {
		return teacherCommentMapper.updateQuestionComment(questionComment);
	}
	
	public QuestionComment questionCommentOne(int questionCommentNo) {
		return teacherCommentMapper.selectQuestionCommentOne(questionCommentNo);
	}
}
