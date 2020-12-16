package gd.fintech.lms.student.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentLoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.ManagerForm;
import gd.fintech.lms.vo.StudentForm;

@Service
@Transactional
public class StudentLoginService {
	@Autowired StudentLoginMapper studentLoginMapper;
	
	public String getAccountToStudentLogin(Account account) {
		
		account.setAccountLevel(4);
		account.setAccountState("활성화");
		
		return studentLoginMapper.selectAccountToStudentLogin(account);
	}
	
	// 회원가입하는 mapper2개를 가져와 manager_queue와 account 순서로 insert실행
	public void addSignup(StudentForm studentForm) {
		studentForm.setAccountLevel(4);
		studentForm.setAccountState("대기");
			
		studentLoginMapper.insertstudentQueueToSignup(studentForm);
		studentLoginMapper.insertAccountToSignup(studentForm);
	}
}
