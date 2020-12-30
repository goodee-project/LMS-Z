package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherClassRegistrationMapper;
import gd.fintech.lms.vo.ClassRegistration;

@Service
@Transactional
public class TeacherClassRegistrationService {
	
	@Autowired TeacherClassRegistrationMapper teacherClassRegistrationMapper;
	
	public List<ClassRegistration> getClassRegistrationList(int lectureNo, String lectureStartdate, String lectureEnddate){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("lectureStartdate", lectureStartdate);
		map.put("lectureEnddate", lectureEnddate);
		
		return teacherClassRegistrationMapper.selectClassRegistrationList(map);
	}

}
