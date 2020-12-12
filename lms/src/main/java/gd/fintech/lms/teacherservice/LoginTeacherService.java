package gd.fintech.lms.teacherservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teachermapper.LoginTeacherMapper;

@Service
@Transactional
public class LoginTeacherService {
	@Autowired LoginTeacherMapper loginTeacherMapper;
}
