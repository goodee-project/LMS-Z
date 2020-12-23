package gd.fintech.lms.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.admin.mapper.AdminLoginMapper;
import gd.fintech.lms.vo.Account;

@Service
@Transactional
public class AdminLoginService {
	@Autowired AdminLoginMapper adminLoginMapper;
	
	public String getAdminAccount(Account account) {
		account.setAccountLevel("관리자");
		account.setAccountState("활성화");
		
		return adminLoginMapper.selectAdminAccount(account);
	}
}
