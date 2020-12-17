package gd.fintech.lms.student.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.ClassRegistrationForm;
import gd.fintech.lms.vo.Lecture;

@Mapper
public interface StudentLectureMapper {
	// 페이징) 전체 강의 목록 map => beginRow, rowPerPage
	public List<Lecture> selectLectureList(Map<String, Object> map);
	// 페이징) 전체 강의목록 갯수
	public int selectLectureListTotal();
	//**** 강의 목록 상세보기 ******
	public Lecture selectLectureListOne(int lectureNo);
	// ==== 강의 신청 여부 체크 ====
	public int selectClassRegistrationCk(Map<String,Object> map);
	//===== 강의 수강 신청 ====
	public int insertClassRegistration(Map<String,Object> map);
	//==== 페이징)나의 수강 현황 목록 =========
	public List<ClassRegistration> selectMyLectureList(Map<String,Object> map);
	//==== 페이징)전체 나의 수강 현황 목록 수 =====
	public int selectMyLectureListTotal(String studentId);
	//==== 나의 수강 현황 상세보기 ====
	public ClassRegistrationForm selectMyLectureListOne(Map<String,Object> map);
}