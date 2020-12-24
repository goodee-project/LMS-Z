package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.MultiplechoiceExample;
import gd.fintech.lms.vo.Test;

@Mapper
public interface TeacherTestMapper {
	// 시험목록 출력
	Test selectTestList(int lectureNo);
	
	// 시험문제 상세보기
	Multiplechoice selectTestQuestionOne(int multiplechocieNo);
	
	// 시험문제목록 출력
	List<Multiplechoice> selectTestQuestionList(int lectureNo);
	
	// 시험정보(일정) 추가
	int insertTest(Test test);
	
	// 시험정보(일정) 수정
	int updateTest(Test test);
}
