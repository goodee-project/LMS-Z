package gd.fintech.lms.student.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.Lecture;

@Mapper
public interface StudentLectureMapper {
	// 페이징 처리한 전체 강의 목록 map => beginRow, rowPerPage
	public List<Lecture> selectLectureList(Map<String, Object> map);
	// 페이징처리) 전체 강의목록 갯수
	public int selectLectureListTotal();
	
	//**** 강의 목록 상세보기 ******
	public Lecture selectLectureListOne(int lectureNo);
	
	//===== 강의 수강 신청 ====
	public int insertClassRegistration(Map<String,Object> map);
	
	//==== 나의 수강 현황 목록 =========
	public List<ClassRegistration> selectMyLectureList(Map<String,Object> map);
	
}