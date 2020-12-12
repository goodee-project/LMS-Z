package gd.fintech.lms.adminservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.adminmapper.LoginAdminMapper;

@Service
@Transactional
public class LoginAdminService {
	@Autowired LoginAdminMapper loginAdminMapper;
}
