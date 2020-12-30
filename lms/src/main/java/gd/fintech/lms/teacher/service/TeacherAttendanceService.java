package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherAttendanceMapper;
import gd.fintech.lms.vo.Attendance;

@Service
@Transactional
public class TeacherAttendanceService {

	@Autowired TeacherAttendanceMapper teacherAttendanceMapper;
	
	//학생 출석부 목록출력
	public List<Attendance> getAttendanceList(int lectureNo, int currentYear, int currentMonth, int currentDay) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		
		return teacherAttendanceMapper.selectAttendanceList(map);
	}
	
	//학생 출석부 상태변경
	public int modifyAttendanceState(Attendance attendance) {
		return teacherAttendanceMapper.updateAttendanceState(attendance);
	}
	
	//학생 출석부 상세보기
	public Attendance getAttendanceStateOne(int lectureNo, String studentId, String attendanceDay) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("studentId", studentId);
		map.put("attendanceDay", attendanceDay);
		
		return teacherAttendanceMapper.selectAttendanceOne(map);
	}
	
	public int addAttendanceState(Attendance attendance) {
		return teacherAttendanceMapper.insertAttendanceState(attendance);
	}
}
