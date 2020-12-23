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
	
	// 시험 상세보기
	List<Multiplechoice> selectTestOne(int lectureNo);
	
	// 시험문제, 답 추가(여러 문제를 입력하기 위해 list 사용)
	Multiplechoice insertTestQuestion(List<Multiplechoice> list);
	
	// 시험문제 보기 추가(여러 보기를 입력하기 위해 list 사용)
	MultiplechoiceExample insertTestQuestionExample(List<MultiplechoiceExample> examList);
	
	// 시험정보(일정) 추가
	int insertTest(Test test);
}
