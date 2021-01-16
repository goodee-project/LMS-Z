package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherMsgMapper;
import gd.fintech.lms.vo.Msg;
import gd.fintech.lms.vo.Student;

@Service
@Transactional
public class TeacherMsgService {
	@Autowired TeacherMsgMapper teacherMsgMapper;

	//수강듣고 있는 학생 이름
	public List<Student> getLectureInStudent(String teacherId,int lectureNo){
		Map<String,Object> map = new HashMap<>();
		map.put("teacherId", teacherId);
		map.put("lectureNo", lectureNo);
		return teacherMsgMapper.selectLectureInStudentList(map);
	}
	// 메세지 기록 리스트 출력
	public List<Msg> getTeacherMsgList(String studentId, String teacherId){
		Map<String,Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("teacherId", teacherId);
		return teacherMsgMapper.selectTeacherMsgList(map);
	}
	// 메세지 보내기
	public int addToStudentMsg(Msg msg) {
		return teacherMsgMapper.insertToStudentMsg(msg);
	}
	// 메세지 읽음 표시
	public int modifyTeacherMsgRead(Msg msg) {
		return teacherMsgMapper.updateTeacherReadMsg(msg);
	}
	public List<Msg> getMsgReadCheck(String teacherId, String studentId){
		Map<String,Object> map = new HashMap<>();
		map.put("teacherId", teacherId);
		map.put("studentId", studentId);
		return teacherMsgMapper.selectMsgReadCheck(map);
	}
}
