package gd.fintech.lms.teacher.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLoginMapper;
import gd.fintech.lms.vo.Account;

@Service
@Transactional
public class TeacherLoginService {
	@Autowired TeacherLoginMapper teacherLoginMapper;
	
	public String getAccountToTeacherLogin(Account account) {
		account.setAccountLevel(3);
		account.setAccountState("활성화");
		
		return teacherLoginMapper.selectAccountToTeacherLogin(account);
	}
}
