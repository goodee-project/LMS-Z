package gd.fintech.lms.student.restservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.restmapper.StudentCourseGradesRestMapper;
import gd.fintech.lms.vo.ClassRegistration;

@Service
@Transactional
public class StudentCourseGradesRestService {
	@Autowired StudentCourseGradesRestMapper studentCourseGradesRestMapper;
	//강의 이름
	public List<String> getLectureName(String studentId){
		return studentCourseGradesRestMapper.selectLectureName(studentId);
	}
	
	//학생 성적
	public List<String> getScore(String studentId){
		return studentCourseGradesRestMapper.selectScore(studentId);
	}
	//강의 평균 점수
	public List<String> getScoreAvg(String studentId) {
		return studentCourseGradesRestMapper.selectScoreAvg(studentId);
	}
}
