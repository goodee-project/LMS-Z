package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentAttendanceMapper;

@Service
@Transactional
public class StudentAttendanceService {
	@Autowired StudentAttendanceMapper studentAttendanceMapper;
	
	//출석한 횟수
	public int getAttendanceTotal(String studentId) {
		return studentAttendanceMapper.selectAttendanceTotal(studentId);
	}
	//지각한 횟수
	public int getComLateTotal(String studentId) {
		return studentAttendanceMapper.selectComLateTotal(studentId);
	}
	//조퇴한 횟수
	public int getEarlyLeaveTotal(String studentId) {
		return studentAttendanceMapper.selectEarlyLeaveTotal(studentId);
	}
	//외출한 횟수
	public int getOutingTotal(String studentId) {
		return studentAttendanceMapper.selectOutingTotal(studentId);
	}
	//결석한 횟수
	public int getAbsentTotal(String studentId) {
		return studentAttendanceMapper.selectAbsentTotal(studentId);
	}
	//수강중인 강의의 총 일수
	public int getTotalLectureDays(String lectureStartdate,String lectureEnddate, int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("lectureStartdate", lectureStartdate);
		map.put("lectureEnddate", lectureEnddate);
		map.put("lectureNo", lectureNo);
		return studentAttendanceMapper.selectTotalLectureDays(map);
	}
	//진행되었어야 할 출석일수
	public int getCommonLectureDays(String lectureStartdate,int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("lectureStartdate", lectureStartdate);
		map.put("lectureNo", lectureNo);
		return studentAttendanceMapper.selectCommonLectureDays(map);
	}
}
