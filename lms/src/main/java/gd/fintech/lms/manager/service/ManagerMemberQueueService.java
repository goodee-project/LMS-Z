package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerMemberQueueMapper;
import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;


@Service
@Transactional
public class ManagerMemberQueueService {
	@Autowired private ManagerMemberQueueMapper managerMemberQueueMapper;
	//학생 대기상태
	public List<StudentQueue> getStudentMemberQueueList(int beginRowS, int rowPerPage){
		Map<String, Object> map = new HashMap<>();
		map.put("beginRowS", beginRowS);
		map.put("rowPerPage", rowPerPage);
		return managerMemberQueueMapper.selectStudentMemberQueue(map);
	}
	//강사 대기상태
	public List<TeacherQueue> getTeacherMemberQueueList(int beginRowT, int rowPerPage){
		Map<String, Object> map = new HashMap<>();
		map.put("beginRowT", beginRowT);
		map.put("rowPerPage", rowPerPage);
		return managerMemberQueueMapper.selectTeacherMemberQueue(map);
	}
	//학생 승인
	public void insertStudent(String studentId, String accountState, String managerId) {
		StudentQueue studentQueue = managerMemberQueueMapper.selectStudentOne(studentId);
		//System.out.println(studentQueue);
		//System.out.println(studentId);
		Map<String, Object> s = new HashMap<String,Object>();
		s.put("s", studentQueue);
		s.put("managerId", managerId);
		//System.out.println(s);
		managerMemberQueueMapper.insertStudent(s);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("memberId", studentId);
		map.put("accountState", accountState);
		managerMemberQueueMapper.updateAccountState(map);
		managerMemberQueueMapper.deleteStudentQueue(studentId);
	}
	//강사 승인
	public void insertTeacher(String teacherId, String accountState, String managerId) {
		TeacherQueue teacherQueue = managerMemberQueueMapper.selectTeacherOne(teacherId);
		//System.out.println(teacherQueue);
		//System.out.println(teacherId);
		Map<String, Object> t = new HashMap<String,Object>();
		t.put("t", teacherQueue);
		t.put("managerId", managerId);
		//System.out.println(t);
		managerMemberQueueMapper.insertTeacher(t);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("memberId", teacherId);
		map.put("accountState", accountState);
		managerMemberQueueMapper.updateAccountState(map);
		managerMemberQueueMapper.deleteTeacherQueue(teacherId);
	}
	//학생 승인 거절
	public void deleteStudentQueue(String studentId, String accountState) {
		managerMemberQueueMapper.deleteStudentQueue(studentId);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("memberId", studentId);
		map.put("accountState", accountState);
		managerMemberQueueMapper.updateAccountState(map);
	}
	//강사 승인 거절
	public void deleteTeacherQueue(String teacherId, String accountState) {
		managerMemberQueueMapper.deleteTeacherQueue(teacherId);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("memberId", teacherId);
		map.put("accountState", accountState);
		managerMemberQueueMapper.updateAccountState(map);
	}
	//학생 페이징을 위한 메퍼 호출
	public int getStudentTotalCount() {
		return managerMemberQueueMapper.selectStudentQueueTotalCount();
	}
	//강사 페이징을 위한 메퍼 호출
	public int getTeacherTotalCount() {
		return managerMemberQueueMapper.selectTeacherQueueTotalCount();
	}
}
