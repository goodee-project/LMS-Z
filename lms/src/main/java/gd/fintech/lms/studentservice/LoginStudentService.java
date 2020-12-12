package gd.fintech.lms.studentservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.studentmapper.LoginStudentMapper;

@Service
@Transactional
public class LoginStudentService {
	@Autowired LoginStudentMapper loginStudentMapper;
}
