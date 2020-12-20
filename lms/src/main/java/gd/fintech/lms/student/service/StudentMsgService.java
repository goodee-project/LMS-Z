package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentMsgMapper;
import gd.fintech.lms.vo.Msg;

@Service
@Transactional
public class StudentMsgService {
	@Autowired StudentMsgMapper studentMsgMapper;
	
	// 메세지 기록 리스트 출력
	public List<Msg> getStudentMsgList(String studentId, String teacherId){
		Map<String,Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("teacherId", teacherId);
		return studentMsgMapper.selectStudentMsgList(map);
	}
	// 메세지 보내기
	public int addToteacherMsg(Msg msg) {
		return studentMsgMapper.insertToTeacherMsg(msg);
	}
	// 메세지 읽음 표시
	public int modifyStudentMsgRead(Msg msg) {
		return studentMsgMapper.updateStudentReadMsg(msg);
	}
}
