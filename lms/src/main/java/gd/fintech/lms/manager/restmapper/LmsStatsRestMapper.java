package gd.fintech.lms.manager.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LmsStatsRestMapper {
	//연도별 강사 가입수/탈퇴수를 구하기 위한 메퍼 호출
	List<Map<String, Object>> selectTeacherInOutCount(int year);
	//연도별 학생 가입수/탈퇴수를 구하기 위한 메퍼 호출
	List<Map<String, Object>> selectStudentInOutCount(int year);
	//전체 강사와 학생의 회원수를 구하기 위한 메퍼 호출
	Map<String, Object> selectTeacherAndStudentCount();
}
