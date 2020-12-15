package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.MemberQueueMapper;
import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;


@Service
@Transactional
public class MemberQueueService {
	@Autowired private MemberQueueMapper memberQueueMapper;
	//학생 대기상태
	public List<StudentQueue> getStudentMemberQueueList(){
		return memberQueueMapper.selectStudentMemberQueue();
	}
	//강사 대기상태
	public List<TeacherQueue> getTeacherMemberQueueList(){
		return memberQueueMapper.selectTeacherMemberQueue();
	}
	public void deleteStudentQueue(String studentId) {
		memberQueueMapper.deleteStudentQueue(studentId);
		memberQueueMapper.updateAccountState(studentId);
	}
}
