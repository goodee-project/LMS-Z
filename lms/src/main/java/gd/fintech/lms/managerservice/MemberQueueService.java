package gd.fintech.lms.managerservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.managermapper.MemberQueueMapper;
import gd.fintech.lms.vo.Account;


@Service
@Transactional
public class MemberQueueService {
	@Autowired private MemberQueueMapper memberQueueMapper;
	
	public List<Account> getStudentMemberQueueList(){
		return memberQueueMapper.selectStudentMemberQueue();
	}
	public List<Account> getTeacherMemberQueueList(){
		return memberQueueMapper.selectTeacherMemberQueue();
	}
}
