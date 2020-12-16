package gd.fintech.lms.teacher.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLectureMapper;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Syllabus;

@Service
@Transactional
public class TeacherLectureService {
	@Autowired TeacherLectureMapper teacherLectureMapper;
	
	// 강사별 강의목록 출력(강사 구분을 위해 accountId 받아옴)
	public List<Lecture> getLectureList(String accountId){
		return teacherLectureMapper.selectLectureList(accountId);
	}
	
	// 강의 상세정보, 강의계획서 출력
	public Lecture getLectureOne(int lectureNo) {
		return teacherLectureMapper.selectLectureOne(lectureNo);
	}
}
