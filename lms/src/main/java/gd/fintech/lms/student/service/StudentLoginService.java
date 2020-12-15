package gd.fintech.lms.student.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentLoginMapper;
import gd.fintech.lms.vo.Account;

@Service
@Transactional
public class StudentLoginService {
	@Autowired StudentLoginMapper studentLoginMapper;
	
	public String getAccountToStudentLogin(Account account) {
		
		account.setAccountLevel(4);
		account.setAccountState("활성화");
		
		return studentLoginMapper.selectAccountToStudentLogin(account);
	}
}
