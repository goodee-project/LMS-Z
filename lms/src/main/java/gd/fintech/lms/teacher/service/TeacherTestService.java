package gd.fintech.lms.teacher.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherTestMapper;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.MultiplechoiceExample;
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
	
	// 시험문제 / 보기 추가
	public void addTestQuestion(Multiplechoice multiplechoice) {
		// multiplechoice 값 vo에 입력(시험문제)
		Multiplechoice addMultiplechoice = new Multiplechoice();
		addMultiplechoice.setLectureNo(multiplechoice.getLectureNo());
		addMultiplechoice.setMultiplechoiceId(multiplechoice.getMultiplechoiceId());
		addMultiplechoice.setMultiplechoiceQuestion(multiplechoice.getMultiplechoiceQuestion());
		addMultiplechoice.setMultiplechoiceAnswer(multiplechoice.getMultiplechoiceAnswer());
		
		teacherTestMapper.insertTestQuestion(addMultiplechoice);
		
		// multiplechoice.vo에 있는 multiplechoiceExample 리스트에 값 넣기
		List<MultiplechoiceExample> multiplechoiceExample = null;
		if(multiplechoice.getMultiplechoiceExampleList() != null) {
			multiplechoiceExample = new ArrayList<MultiplechoiceExample>();
			for(MultiplechoiceExample ex : multiplechoice.getMultiplechoiceExampleList()) {
				MultiplechoiceExample example = new MultiplechoiceExample();
				// addMultiplechoice에 넣은 multiplechoiceNo 값 가져와서 넣기
				example.setMultiplechoiceNo(addMultiplechoice.getMultiplechoiceNo());
				example.setMultiplechoiceExampleId(ex.getMultiplechoiceExampleId());
				example.setMultiplechoiceExampleContent(ex.getMultiplechoiceExampleContent());
				
				multiplechoiceExample.add(example);
			}
		}
		if(multiplechoiceExample != null) {
			for(MultiplechoiceExample ex : multiplechoiceExample) {
				System.out.println(ex);
				teacherTestMapper.insertTestQuestionExample(ex);
			}
		}
	}
}
