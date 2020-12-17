package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLectureMapper;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class ManagerLectureService {
	@Autowired ManagerLectureMapper managerLectureMapper;
	
	public List<Lecture> getLectureList(){
		return managerLectureMapper.selectLectureList();
	}
	public List<Teacher> getTeacherList(){
		return managerLectureMapper.selectTeacherList();
	}
}

