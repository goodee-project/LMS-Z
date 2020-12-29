package gd.fintech.lms.student.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentAttendanceMapper {
	//출석한 횟수
	public int selectAttendanceTotal(Map<String, Object> map);
	//지각한 횟수
	public int selectComLateTotal(Map<String, Object> map);
	//조퇴한 횟수
	public int selectEarlyLeaveTotal(Map<String, Object> map);
	//외출한 횟수
	public int selectOutingTotal(Map<String, Object> map);
	//결석한 횟수
	public int selectAbsentTotal(Map<String, Object> map);
	//수강중인 강의의 총 일수
	public int selectTotalLectureDays(Map<String, Object> map);
	//진행되었어야 할 출석 일수
	public int selectCommonLectureDays(Map<String, Object> map);
}
