package gd.fintech.lms.teacher.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherClassRegistrationMapper;

@Service
@Transactional
public class TeacherClassRegistrationService {
	@Autowired TeacherClassRegistrationMapper teacherClassRegistrationMapper;
	
	//수강상태 변경
	public void updateClassRegistrationState() {
		teacherClassRegistrationMapper.updateClassRegistrationState();
	}
}
