package gd.fintech.lms.student.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentLectureMapper;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.ClassRegistrationCancel;
import gd.fintech.lms.vo.ClassRegistrationForm;
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
	// ==== 강의 신청 여부 체크 ====
	public int getClassRegistrationCk(String studentId, int lectureNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("lectureNo", lectureNo);
		return studentLectureMapper.selectClassRegistrationCk(map);
	}
	//===== 강의 수강 신청 ==== 
	public int addClassRegistration(String studentId,int lectureNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("lectureNo", lectureNo);
		return studentLectureMapper.insertClassRegistration(map);
	}
	// ==== 강의 신청 인원 ===
	public int getNumberOfApplicants(int lectureNo) {
		return studentLectureMapper.selectNumberOfApplicants(lectureNo);
	}
	//==== 나의 수강 현황 목록 =========
	public List<ClassRegistration> getMyLectureList(String studentId,int beginRow, int rowPerPage){
		Map<String,Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return studentLectureMapper.selectMyLectureList(map);
	}
	//==== 페이징)전체 나의 수강 현황 목록 수 =====
	public int getMyLectureListTotal(String studentId) {
		return studentLectureMapper.selectMyLectureListTotal(studentId);
	}
	//==== 나의 수강 현황 상세보기 ====
	public ClassRegistrationForm getMyLectureListOne(String studentId, int lectureNo){
		Map<String,Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("lectureNo", lectureNo);
		return studentLectureMapper.selectMyLectureListOne(map);
	}
	//==== 수료한 수강생들만 사용할 수 있는 수강 후기 작성 =====
	public int modifyLectureReview(ClassRegistration classRegistration) {
		return studentLectureMapper.updateLectureReview(classRegistration);
	}
	//=== 승인 대기중인 강의 취소 ====
	public int removeWaitingClassCancel(int classRegistrationNo) {
		return studentLectureMapper.deleteWaitingClassCancel(classRegistrationNo);
	}
	// ==== 수강 중 취소한 학생의 사유 입력 ====
	public int addReasonForCancellation(ClassRegistrationCancel classRegistrationCancel) {
		return studentLectureMapper.insertReasonForCancellation(classRegistrationCancel);
	}
	//=== 수강 중 취소시 상태 변화 / 수강중 -> 취소
	public int modifyClassStateChange(int classRegistrationNo) {
		return studentLectureMapper.updateClassStateChange(classRegistrationNo);
	}
}

















