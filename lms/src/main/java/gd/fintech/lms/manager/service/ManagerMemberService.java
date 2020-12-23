package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerMemberMapper;
import gd.fintech.lms.vo.Account;

@Service
@Transactional
public class ManagerMemberService {
	@Autowired ManagerMemberMapper managerMemberMapper;
	
	//활성화 되어있는 학생,강사 리스트 출력
	public List<Account> getTeacherAndStudentList(){
		return managerMemberMapper.selectTeacherAndStudent();
	}
}
