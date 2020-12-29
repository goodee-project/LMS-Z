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
	public int getAttendanceTotal(String studentId, int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("lectureNo", lectureNo);
		return studentAttendanceMapper.selectAttendanceTotal(map);
	}
	//지각한 횟수
	public int getComLateTotal(String studentId,int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("lectureNo", lectureNo);
		return studentAttendanceMapper.selectComLateTotal(map);
	}
	//조퇴한 횟수
	public int getEarlyLeaveTotal(String studentId,int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("lectureNo", lectureNo);
		return studentAttendanceMapper.selectEarlyLeaveTotal(map);
	}
	//외출한 횟수
	public int getOutingTotal(String studentId,int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("lectureNo", lectureNo);
		return studentAttendanceMapper.selectOutingTotal(map);
	}
	//결석한 횟수
	public int getAbsentTotal(String studentId,int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("lectureNo", lectureNo);
		return studentAttendanceMapper.selectAbsentTotal(map);
	}
	//수강중인 강의의 총 일수
	public int getTotalLectureDays(String lectureStartdate,String lectureEnddate, int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("lectureStartdate", lectureStartdate);
		map.put("lectureEnddate", lectureEnddate);
		map.put("lectureNo", lectureNo);
		return studentAttendanceMapper.selectTotalLectureDays(map);
	}
	//과정 진행률
	public int getCommonLectureDays(String lectureStartdate,int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("lectureStartdate", lectureStartdate);
		map.put("lectureNo", lectureNo);
		return studentAttendanceMapper.selectCommonLectureDays(map);
	}
}
