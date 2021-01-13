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
	public Map<String, Object> getAttendanceList(int lectureNo, String attendanceDay) {
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
		
		List<Attendance> attendanceList = teacherAttendanceMapper.selectAttendanceList(map);
		List<Attendance> attendanceYesList = teacherAttendanceMapper.selectAttendanceYesList(map);
		List<Attendance> attendanceEtcList = teacherAttendanceMapper.selectAttendanceEtcList(map);
		String lectureName = teacherAttendanceMapper.selectLectureByName(lectureNo);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("attendanceList", attendanceList);
		resultMap.put("attendanceYesList", attendanceYesList);
		resultMap.put("attendanceEtcList", attendanceEtcList);
		resultMap.put("lectureName", lectureName);
		
		return resultMap;
	}
	
	//학생 출석부 상태변경
	public void modifyAttendanceState(Attendance attendance) {
		for(int i=0; i<attendance.getAccountIdList().size(); i++) {
			attendance.setAccountId(attendance.getAccountIdList().get(i));
			if(teacherAttendanceMapper.selectAttendanceStateCheck(attendance).equals("출석")) {
				attendance.setAttendanceState("미출석");
				teacherAttendanceMapper.updateAttendanceState(attendance);
			} else {
				attendance.setAttendanceState("출석");
				teacherAttendanceMapper.updateAttendanceState(attendance);
			}
		}
	}
	
	//학생 출석부 상태변경
	public void modifyAttendanceOneState(Attendance attendance) {
		teacherAttendanceMapper.updateAttendanceState(attendance);
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
