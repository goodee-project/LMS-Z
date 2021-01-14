package gd.fintech.lms.student.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;

@Mapper
public interface StudentCourseGradesRestMapper {
	//강좌별 성적 차트
	public Map<String, Object> selectCourseGreads(String studentId);
	//현재 수강중인 강의 목록
	public List<ClassRegistration> selectAllMyLectureList(String studentId);
}
