package gd.fintech.lms.teacher.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherTestMapper;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.MultiplechoiceExample;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentAnswerSheet;
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
		addMultiplechoice.setMultiplechoiceScore(multiplechoice.getMultiplechoiceScore());
		
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
		// example에 값이 들어있다면 데이터베이스에 insert해줌
		if(multiplechoiceExample != null) {
			for(MultiplechoiceExample ex : multiplechoiceExample) {
				System.out.println(ex);
				teacherTestMapper.insertTestQuestionExample(ex);
			}
		}
	}
	
	// 시험문제번호 중복 검사
	public int getMultiplechoiceIdOverlap(int lectureNo, int multiplechoiceId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);
		map.put("multiplechoiceId", multiplechoiceId);
		
		return teacherTestMapper.selectMultiplechoiceIdOverlap(map);
	}
	
	// 시험문제 수정
	public void modifyTestQuestion(Multiplechoice multiplechoice) {
		// multiplechoice 값 vo에 입력(시험문제)
		Multiplechoice modifyMultiplechoice = new Multiplechoice();
		modifyMultiplechoice.setMultiplechoiceNo(multiplechoice.getMultiplechoiceNo());
		modifyMultiplechoice.setMultiplechoiceQuestion(multiplechoice.getMultiplechoiceQuestion());
		modifyMultiplechoice.setMultiplechoiceAnswer(multiplechoice.getMultiplechoiceAnswer());
		modifyMultiplechoice.setMultiplechoiceScore(multiplechoice.getMultiplechoiceScore());
		
		teacherTestMapper.updateTestQuestion(modifyMultiplechoice);
		
		// multiplechoice.vo에 있는 multiplechoiceExample 리스트에 값 넣기
		List<MultiplechoiceExample> multiplechoiceExample = null;
		if(multiplechoice.getMultiplechoiceExampleList() != null) {
			multiplechoiceExample = new ArrayList<MultiplechoiceExample>();
			for(MultiplechoiceExample ex : multiplechoice.getMultiplechoiceExampleList()) {
				MultiplechoiceExample example = new MultiplechoiceExample();
				// addMultiplechoice에 넣은 multiplechoiceNo 값 가져와서 넣기
				example.setMultiplechoiceNo(modifyMultiplechoice.getMultiplechoiceNo());
				example.setMultiplechoiceExampleId(ex.getMultiplechoiceExampleId());
				example.setMultiplechoiceExampleContent(ex.getMultiplechoiceExampleContent());
				
				multiplechoiceExample.add(example);
			}
		}
		// example에 값이 있다면 수정해줌
		if(multiplechoiceExample != null) {
			for(MultiplechoiceExample ex : multiplechoiceExample) {
				System.out.println(ex);
				teacherTestMapper.updateTestQuestionExample(ex);
			}
		}
	}
	
	// 시험문제/보기 삭제
	public void removeTestQuestion(int multiplechoiceNo) {
		// 해당 시험문제의 보기 삭제(외래키로 연결되어있어 먼저 삭제해줌)
		teacherTestMapper.deleteTestQuestionExample(multiplechoiceNo);
		// 해당 시험문제 삭제
		teacherTestMapper.deleteTestQuestion(multiplechoiceNo);
	}
	
	// 수강중인 학생 목록 조회
	public List<StudentAnswerSheet> getStudentByLecture(int lectureNo) {
		return teacherTestMapper.selectStudentByLecture(lectureNo);
	}
	
	// 해당 강의를 수강하는 학생의 답안지 조회
	public List<StudentAnswerSheet> getAnswerSheetByStudent(int lectureNo, String studentId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("studentId", studentId);
		return teacherTestMapper.selectAnswerSheetByStudent(map);
	}
	
	// 학생 이름 출력
	public Student getStudentName(String studentId) {
		return teacherTestMapper.selectStudentName(studentId);
	}
}
