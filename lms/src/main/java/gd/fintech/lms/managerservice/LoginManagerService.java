package gd.fintech.lms.managerservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.managermapper.LoginManagerMapper;

@Service
@Transactional
public class LoginManagerService {
	@Autowired LoginManagerMapper loginManagerMapper;
}
