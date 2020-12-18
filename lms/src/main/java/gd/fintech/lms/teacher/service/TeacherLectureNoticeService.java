package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLectureNoticeMapper;
import gd.fintech.lms.vo.LectureNotice;

@Service
@Transactional
public class TeacherLectureNoticeService {
	@Autowired TeacherLectureNoticeMapper teacherLectureNoticeMapper;
	
	// 강좌별 공지사항 목록 출력(강좌번호(lectureNo), 각 페이지마다 시작하는 번호(beginRow), 한 페이지에 출력될 개수(rowPerPage))  
	public List<LectureNotice> getLectureNoticeList(int lectureNo, int beginRow, int rowPerPage){
		// Map 객체 생성
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		// map 안에 mapper에 필요한 값 입력
		map.put("lectureNo", lectureNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		// lectureNotice 객체 선언 및 초기화
		List<LectureNotice> noticeList = teacherLectureNoticeMapper.selectLectureNoticeList(map);
		return noticeList;
	}
	
	// 강좌별 공지사항 목록 페이징을 위한 공지사항 전체 개수
	public int getLectureNoticeCount(int lectureNo) {
		return teacherLectureNoticeMapper.selectLectureNoticeCount(lectureNo);
	}
	
	// 강좌별 공지사항 등록
	public int addLectureNotice(LectureNotice lectureNotice) {
		return teacherLectureNoticeMapper.insertLectureNotice(lectureNotice);
	}
	
	// 강좌별 공지사항 상세보기
	public LectureNotice getLectureNoticeOne(int lectureNoticeNo) {
		// LectureNotice 객체 선언 및 초기화
		LectureNotice lectureNotice = teacherLectureNoticeMapper.selectLectureNoticeOne(lectureNoticeNo);
		return lectureNotice;
	}
	
	// 강좌별 공지사항 수정
	public int modifyLectureNotice(LectureNotice lectureNotice) {
		return teacherLectureNoticeMapper.updateLectureNotice(lectureNotice);
	}
	
	// 강좌별 공지사항 삭제
	public int removeLectureNotice(int lectureNoticeNo) {
		// mapper 메소드 호출 및 반환
		return teacherLectureNoticeMapper.deleteLectureNotice(lectureNoticeNo);
	}
}
