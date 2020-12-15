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
	
	// 강좌별 공지사항 목록 출력(강좌번호(lectureNo), 페이징을 위한 현재페이지(currentPage), 한 페이지에 출력될 개수(rowPerPage))  
	public List<LectureNotice> getLectureNoticeList(int lectureNo, int currentPage, int rowPerPage){
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("lectureNo", lectureNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
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
	public LectureNotice getLectureNoticeOne(int lectureNo, int lectureNoticeNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("lectureNo", lectureNo);
		map.put("lectureNoticeNo", lectureNoticeNo);
		
		LectureNotice lectureNotice = teacherLectureNoticeMapper.selectLectureNoticeOne(map);
		return lectureNotice;
	}
}
