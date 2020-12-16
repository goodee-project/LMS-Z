package gd.fintech.lms.student.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentLectureMapper;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.Lecture;

@Transactional
@Service
public class StudentLectureService {
	@Autowired StudentLectureMapper studentLectureMapper;
	
	// 페이징 처리한 전체 강의 목록 map => beginRow, rowPerPage
	public List<Lecture> getLectureList(int beginRow, int rowPerPage){
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return studentLectureMapper.selectLectureList(map);
	}
	//페이징처리) 전체 강의목록 갯수
	public int getLectureListTotal() {
		return studentLectureMapper.selectLectureListTotal();
	}
	
	//**** 강의 목록 상세보기 ******
	public Lecture getLectureListOne(int lectureNo) {
		return studentLectureMapper.selectLectureListOne(lectureNo);
	}
	//===== 강의 수강 신청 ==== 
	public int addClassRegistration(String studentId,int lectureNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("lectureNo", lectureNo);
		return studentLectureMapper.insertClassRegistration(map);
	}
	
	//==== 나의 수강 현황 목록 =========
	public List<ClassRegistration> getMyLectureList(String studentId,int beginRow, int rowPerPage){
		Map<String,Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return studentLectureMapper.selectMyLectureList(map);
	}
}

















