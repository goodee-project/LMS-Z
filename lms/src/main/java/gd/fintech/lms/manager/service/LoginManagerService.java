package gd.fintech.lms.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.LoginManagerMapper;

@Service
@Transactional
public class LoginManagerService {
	@Autowired LoginManagerMapper loginManagerMapper;
}
