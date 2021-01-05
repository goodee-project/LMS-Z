package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLmsNoticeMapper;
import gd.fintech.lms.vo.LmsNotice;

@Service
@Transactional
public class TeacherLmsNoticeService {
	@Autowired TeacherLmsNoticeMapper teacherLmsNoticeMapper;
	
	//공지사항 목록
	public List<LmsNotice> getLmsNoticeList(int beginRow, int rowPerPage, String searchTitle){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		map.put("searchTitle", searchTitle);
		
		return teacherLmsNoticeMapper.selectLmsNoticeList(map);
	}
	
	//공지사항 리스트 총개수
	public int getLmsNoticeCount(String searchTitle) {
		return teacherLmsNoticeMapper.selectLmsNoticeCount(searchTitle);
	}
	
	//공지사항 상세보기
	public LmsNotice getLmsNoticeOne(int lmsNoticeNo) {
		return teacherLmsNoticeMapper.selectLmsNoticeOne(lmsNoticeNo);
	}
	
	//공지사항 조회수 증가
	public int modifyLmsNoticeCount(int lmsNoticeNo) {
		return teacherLmsNoticeMapper.updateLmsNoticeCount(lmsNoticeNo);
	}
}
