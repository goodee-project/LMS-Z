package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface TeacherQuestionMapper {
	//질문목록
	List<Question> selectQuestionList(Map<String, Object> map);
	//질문리스트 총개수
	int selectQuestionCount(int lectureNo);
	//질문상세보기
	Question selectQuestionOne(Map<String, Object> map);
	//질문상세보기 조회수 증가
	int updateQuestionOneCount(int questionNo);
}
