package gd.fintech.lms.student.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;

@Mapper
public interface StudentCourseGradesRestMapper {
	// 학생이 수강중인 강의 이름 리스트
	public List<String> selectLectureName(String studentId);
	//강좌별 성적 리스트
	public List<String> selectScore(String studentId);
	//강좌별 전체 평균 성적 리스트
	public List<String> selectScoreAvg(String studentId);
}
