package gd.fintech.lms.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.admin.mapper.LoginAdminMapper;
import gd.fintech.lms.vo.Account;

@Service
@Transactional
public class LoginAdminService {
	@Autowired LoginAdminMapper loginAdminMapper;
	
	public String getAdminAccount(Account account) {
		return loginAdminMapper.selectAdminAccount(account);
	}
}
