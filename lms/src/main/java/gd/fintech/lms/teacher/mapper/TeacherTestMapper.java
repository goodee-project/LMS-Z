package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.MultiplechoiceExample;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentAnswerSheet;
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
	
	// 시험문제 추가
	void insertTestQuestion(Multiplechoice multiplechoice);
	
	// 시험문제 보기 추가
	void insertTestQuestionExample(MultiplechoiceExample multiplechoiceExample);
	
	// 시험번호 중복검사
	int selectMultiplechoiceIdOverlap(Map<String, Integer> map);
	
	// 시험문제 수정
	void updateTestQuestion(Multiplechoice multiplechoice);
	
	// 시험문제 보기 수정
	void updateTestQuestionExample(MultiplechoiceExample multiplechoiceExample);
	
	// 시험문제 삭제
	int deleteTestQuestion(int multiplechoiceNo);
	
	// 시험문제 보기 삭제
	int deleteTestQuestionExample(int multiplechoiceNo);
	
	// 수강중인 학생 목록 조회
	List<StudentAnswerSheet> selectStudentByLecture(int lectureNo);
	
	// 학생의 답안지 조회
	List<StudentAnswerSheet> selectAnswerSheetByStudent(Map<String, Object> map);
	
	// 해당 학생의 이름
	Student selectStudentName(String studentId);
	
	// 시험 삭제
	int deleteTest(int lectureNo);
	
	// 강좌와 연결된 시험번호 조회
	List<Integer> selectTestAndLecture(int lectureNo);
	
	// 강좌 삭제시 연결된 학생의 답안지 삭제
	int deleteAnswerSheer(int multiplechoiceNo);
}
