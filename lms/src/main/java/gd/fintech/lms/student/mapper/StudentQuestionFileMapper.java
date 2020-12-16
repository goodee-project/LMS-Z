package gd.fintech.lms.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionFile;

@Mapper
public interface StudentQuestionFileMapper {
	int insertQuestionFile(QuestionFile questionFile);
	
	int deleteAllQuestionFile(int questionNo);
	
	List<String> selectQuestionFileUuid(int questionNo);
}
