package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface StudentQuestionMapper {
	List<Question> selectQuestionListPage(Map<String, Integer> map); // 질문목록 리스트 (페이징)
	
	int totalCountQuestion(); // 질문목록 페이징에 사용되는 총 행의 갯수
}
