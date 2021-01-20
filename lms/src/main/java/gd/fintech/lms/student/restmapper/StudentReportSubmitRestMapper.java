package gd.fintech.lms.student.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentReportSubmitRestMapper {
	// 수강중인 강의 리스트
	public List<String> selectMyLectureList(String studentId);
	// 나의 과제 점수
	public List<String> selectMyReportScore(String studentId);
	// 강의 과제 평균 점수
	public List<String> selectAvgReportScore(String studentId);
}
