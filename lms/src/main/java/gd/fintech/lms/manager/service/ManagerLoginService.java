package gd.fintech.lms.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLoginMapper;
import gd.fintech.lms.vo.Account;

@Service
@Transactional
public class ManagerLoginService {
	@Autowired ManagerLoginMapper managerLoginMapper;
	
	public String getAccountToManagerLogin(Account account) {
		
		account.setAccountLevel(2);
		account.setAccountState("활성화");
		
		return managerLoginMapper.selectAccountToManagerLogin(account);
	}
}
