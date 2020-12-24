package gd.fintech.lms.teacher.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherSyllabusMapper;
import gd.fintech.lms.vo.Syllabus;

@Service
@Transactional
public class TeacherSyllabusService {
	@Autowired TeacherSyllabusMapper teacherSyllabusMapper;
	
	// 강의계획서 추가
	public int addSyllabus(Syllabus syllabus) {
		return teacherSyllabusMapper.insertSyllabus(syllabus);
	}
}
