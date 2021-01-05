package gd.fintech.lms.student.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentCourseGradesRestMapper {
	//강좌별 성적 차트
	public Map<String, Object> selectCourseGreads(String studentId);
}
