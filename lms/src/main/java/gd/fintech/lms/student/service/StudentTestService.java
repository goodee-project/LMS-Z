package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentTestMapper;
import gd.fintech.lms.vo.AnswerSheet;

@Service
@Transactional
public class StudentTestService {
	@Autowired StudentTestMapper studentTestMapper;
	
	//객관식 문제 제출
	public int addAnswerMultiplechoice(AnswerSheet answerSheet) {
		return studentTestMapper.insertAnswerMultiplechoice(answerSheet);
	}
	
	//채점 점수
	public int getTestScore(int lectureNo, String studentId) {
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		map.put("accountId", studentId);
		return studentTestMapper.selectTestScore(map);
	}
	//시험 문제 제출 유무 체크
	public List<AnswerSheet> getTestAnswer(String accountId){
		return studentTestMapper.selectTestAnswer(accountId);
	}
	//시험 전부 제출했는지 않했는지 체크
	public int getAllTestAnswer(int lectureNo, String studentId) {
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		map.put("accountId", studentId);
		return studentTestMapper.selectAllTestAnswer(map);
	}
}
