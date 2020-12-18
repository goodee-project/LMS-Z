package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLectureMapper;
import gd.fintech.lms.vo.Lecture;

@Service
@Transactional
public class TeacherLectureService {
	@Autowired TeacherLectureMapper teacherLectureMapper;
	
	// 강사별 강의목록 출력(강사 구분을 위해 accountId 받아옴)
	public List<Lecture> getLectureList(String teacherId, int beginRow, int rowPerPage){
		// Map 객체 선언
		Map<String, Object> map = new HashMap<String, Object>();
		// map에 mapper에 필요한 accountId, beginRow, rowPerPage 입력
		map.put("accountId", teacherId);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		return teacherLectureMapper.selectLectureList(map);
	}
	
	// 강사별 강의목록 전체개수
	public int getLectureCount(String accountId) {
		return teacherLectureMapper.selectLectureCount(accountId);
	}
	
	// 강의 상세정보, 강의계획서 출력
	public Lecture getLectureOne(int lectureNo) {
		return teacherLectureMapper.selectLectureOne(lectureNo);
	}
}
