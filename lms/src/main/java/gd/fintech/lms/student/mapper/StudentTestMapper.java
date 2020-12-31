package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.AnswerSheet;

@Mapper
public interface StudentTestMapper {
	//객관식 문제 제출
	int insertAnswerMultiplechoice(AnswerSheet answerSheet);
	//채점 점수
	String selectTestScore(Map<String, Object> map);
	//시험 문제 제출 유무 체크
	List<AnswerSheet> selectTestAnswer(String accountId); 
	//시험 전부 제출했는지 않했는지 체크
	int selectAllTestAnswer(Map<String, Object> map);
}
