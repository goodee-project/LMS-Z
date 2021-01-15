package gd.fintech.lms.student.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionComment;

@Mapper
public interface StudentQuestionCommentMapper {
	QuestionComment selectOneQuestionComment(int questionCommentNo);
	
	int insertQuestionComment(QuestionComment questionComment);
	
	int updateQuestionComment(QuestionComment questionComment);
	
	int deleteOneQuestionComment(int questionCommentNo);
}
