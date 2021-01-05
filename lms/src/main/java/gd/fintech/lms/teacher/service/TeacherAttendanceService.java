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
	public List<Attendance> getAttendanceList(int lectureNo, String attendanceDay) {
		List<Integer> attendanceCheckList = teacherAttendanceMapper.selectClassRegistrationByNo(attendanceDay, lectureNo);
		for(int i=0; i<attendanceCheckList.size(); i++) {
			if(teacherAttendanceMapper.selectAttendanceByDay(attendanceDay, attendanceCheckList.get(i)) == 0) {
				Attendance attendance = new Attendance();
				attendance.setAttendanceDay(attendanceDay);
				attendance.setClassRegistrationNo(attendanceCheckList.get(i));
				teacherAttendanceMapper.insertAttendanceByDay(attendance);
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("attendanceDay", attendanceDay);
		
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

}
