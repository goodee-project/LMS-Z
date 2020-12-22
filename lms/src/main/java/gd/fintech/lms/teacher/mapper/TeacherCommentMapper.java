package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionComment;

@Mapper
public interface TeacherCommentMapper {
	//댓글목록
	List<QuestionComment> selectQuestionCommentList(Map<String, Object> map);
	//댓글목록 총개수
	int selectQuestionCommentCount(int questionNo);
	//댓글입력
	int insertQuestionComment(QuestionComment questionComment);
	//댓글삭제
	int deleteQuestionComment(int questionCommentNo);
	//댓글수정
	int updateQuestionComment(QuestionComment QuestionComment);
	//댓글상세보기(댓글수정)
	QuestionComment selectQuestionCommentOne(int questionCommentNo);
}
