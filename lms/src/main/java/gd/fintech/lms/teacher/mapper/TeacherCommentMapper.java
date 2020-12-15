package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionComment;

@Mapper
public interface TeacherCommentMapper {
	List<QuestionComment> selectQuestionCommentList();
}
