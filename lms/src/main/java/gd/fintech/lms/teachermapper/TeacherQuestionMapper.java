package gd.fintech.lms.teachermapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface TeacherQuestionMapper {
	List<Question> selectQuestionList();
}
