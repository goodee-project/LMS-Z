package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Attendance;

@Mapper
public interface TeacherAttendanceMapper {
	//학생 출석부 목록
	List<Attendance> selectAttendanceList(Map<String, Object> map);
	//학생 출석상태 변경
	int updateAttendanceState(Attendance attendance);
	//학생 출석상세보기
	Attendance selectAttendanceOne(Map<String, Object> map);
	
	// 날짜 초기 학생 attendance테이블에 추가
	int insertAttendanceByDay(Attendance attendance);
	List<Integer> selectClassRegistrationByNo(String attendanceDay, int lectureNo);
	int selectAttendanceByDay(String attendanceDay, int classRegistrationNo);
}
