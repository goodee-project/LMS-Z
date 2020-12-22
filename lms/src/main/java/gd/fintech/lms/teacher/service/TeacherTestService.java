package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherTestMapper;
import gd.fintech.lms.vo.Test;

@Service
@Transactional
public class TeacherTestService {
	@Autowired TeacherTestMapper teacherTestMapper;
	
	// 시험목록 출력
	public List<Test> getTestList(int lectureNo){
		return teacherTestMapper.selectTestList(lectureNo);
	}
}
