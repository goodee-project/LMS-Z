package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLmsNoticeMapper;
import gd.fintech.lms.vo.LmsNotice;

@Service
@Transactional
public class ManagerLmsNoticeService {
	@Autowired ManagerLmsNoticeMapper managerLmsNoticeMapper;

	//공지사항 리스트, 페이징
	public List<LmsNotice> getLmsNoticeList(int beginRow, int rowPerPage){
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<LmsNotice> lmsnoticeList = managerLmsNoticeMapper.selectLmsNoticeList(map);
		return lmsnoticeList;
	}
	//공지사항 개수
	public int getLmsNoticeCount() {
		return managerLmsNoticeMapper.selectLmsNoticeCount();	
	}
	//LMS 공지사항 검색 기능
	public List<LmsNotice> getSearchLmsNotice(String lmsNoticeTitle, int beginRow, int rowPerPage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lmsNoticeTitle", lmsNoticeTitle);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return managerLmsNoticeMapper.selectSearchLmsNotice(map);
	}
	//LMS 공지사항 검색 했을 때 일치하는 DB데이터 수
	public int getSearchNoticeTotal(String lmsNoticeTitle) {
		return managerLmsNoticeMapper.selectSearchNoticeTotal(lmsNoticeTitle);
	}
	// 공지사항 조회수 +1
	public int modifyLmsNoticeCount(int lmsNoticeNo) {
		return managerLmsNoticeMapper.updateLmsNoticeCount(lmsNoticeNo);
	}
	//공지사항 상세내용
	public LmsNotice getLmsNoticeOne(int lmsNoticeNo) {
		return managerLmsNoticeMapper.selectLmsNoticeOne(lmsNoticeNo);
	}
	//공지사항 작성 
	public int addLmsNotice(LmsNotice lmsNotice) {
		return managerLmsNoticeMapper.insertLmsNotice(lmsNotice);
	}
	//공지사항 추가 시 자동으로 작성자 이름 출력
	public String getManagerName(String managerId) {
		return managerLmsNoticeMapper.selectManagerName(managerId);
	}
	//공지사항 수정
	public int modifyLmsNotice(LmsNotice lmsNotice) {
		return managerLmsNoticeMapper.updateLmsNotice(lmsNotice);
	}
	//공지사항 삭제 
	public int removeLmsNotice(int lmsNoticeNo) {
		return managerLmsNoticeMapper.deleteLmsNotice(lmsNoticeNo);
	}
}