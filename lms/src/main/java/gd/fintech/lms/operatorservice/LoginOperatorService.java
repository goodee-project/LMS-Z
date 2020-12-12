package gd.fintech.lms.operatorservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.operatormapper.LoginOperatorMapper;

@Service
@Transactional
public class LoginOperatorService {
	@Autowired LoginOperatorMapper loginOperatorMapper;
}
