package gd.fintech.lms.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.admin.mapper.AdminLoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Connect;

@Service
@Transactional
public class AdminLoginService {
	@Autowired AdminLoginMapper adminLoginMapper;
	// 로그인 액션
	public String getAdminAccount(Account account) {
		Connect connect = new Connect();
		connect.setAccountId(account.getAccountId());
		connect.setConnectState("접속");
		if(adminLoginMapper.selectConnectByOverlapLogin(connect) == 0) {
			account.setAccountLevel("관리자");
			account.setAccountState("활성화");
			
			return adminLoginMapper.selectAdminAccount(account);
		}
		return "중복";
	}
}
