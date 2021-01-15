package gd.fintech.lms.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionComment;
import gd.fintech.lms.vo.QuestionFile;

@Mapper
public interface StudentQuestionFileMapper {
	
	//질문 파일 추가
	int insertQuestionFile(QuestionFile questionFile);
	
	//질문파일 모두 삭제(등록 질문을 삭제할때 질문파일도 모두 삭제됩니다)
	int deleteAllQuestionFile(int questionNo);
	
	//질문 수정시 원치않는 파일을 삭제할때 사용됩니다.
	int deleteOneQuestionFile(String questionFileUuid);
	
	List<String> selectQuestionFileUuid(int questionNo);
	
	int updateQuestionFileCount(String questionFileUuid);
	
}
