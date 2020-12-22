package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface TeacherQuestionMapper {
	List<Question> selectQuestionList(Map<String, Object> map);
	int selectQuestionCount(String accountId);
	Question selectQuestionOne(Map<String, Object> map);
}
