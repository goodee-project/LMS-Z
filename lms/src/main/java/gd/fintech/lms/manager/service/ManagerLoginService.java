package gd.fintech.lms.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.ManagerForm;

@Service
@Transactional
public class ManagerLoginService {
	@Autowired ManagerLoginMapper managerLoginMapper;
	
	// 회원가입하는 사람의 아이디 또는 이메일의 중복검사 service
	public int getAccountToSignupByoverlap(String accountId, String accountEmail) {
		return managerLoginMapper.selectAccountToSignupByoverlap(accountId, accountEmail);
	}
	
	public String getAccountToManagerLogin(Account account) {
		
		account.setAccountLevel(2);
		account.setAccountState("활성화");
		
		return managerLoginMapper.selectAccountToManagerLogin(account);
	}
	
	// 회원가입하는 mapper2개를 가져와 manager_queue와 level 순서로 insert실행
	public void addSignup(ManagerForm managerForm) {
		managerForm.setAccountLevel(2);
		managerForm.setAccountState("대기");
			
		managerLoginMapper.insertManagerQueueToSignup(managerForm);
		managerLoginMapper.insertAccountToSignup(managerForm);
	}
}
