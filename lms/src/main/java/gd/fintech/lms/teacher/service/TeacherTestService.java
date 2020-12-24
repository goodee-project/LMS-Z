package gd.fintech.lms.teacher.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherTestMapper;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.Test;

@Service
@Transactional
public class TeacherTestService {
	@Autowired TeacherTestMapper teacherTestMapper;
	
	// 시험목록 출력
	public Test getTestList(int lectureNo){
		return teacherTestMapper.selectTestList(lectureNo);
	}
	
	// 시험문제목록 보기
	public List<Multiplechoice> getTestQuestionList(int lectureNo) {
		return teacherTestMapper.selectTestQuestionList(lectureNo);
	}
	
	// 시험문제 상세보기
	public Multiplechoice getTestQuestionOne(int multiplechoiceNo) {
		return teacherTestMapper.selectTestQuestionOne(multiplechoiceNo);
	}
	
	// 해당 강의의 시험정보(일정) 추가
	public int addTest(Test test) {
		return teacherTestMapper.insertTest(test);
	}
	
	// 해당 강의의 시험정보(일정) 수정
	public int modifyTest(Test test) {
		return teacherTestMapper.updateTest(test);
	}
}
