package gd.fintech.lms.teacher.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherInfoMapper;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class TeacherInfoService {
	@Autowired TeacherInfoMapper teacherInfoMapper;
	
	// 강사 마이페이지 정보
	public Teacher getTeacherInfo(String teacherId) {
		// mapper의 강사 마이페이지 정보 메소드 return
		return teacherInfoMapper.selectTeacherInfo(teacherId);
	}
}
