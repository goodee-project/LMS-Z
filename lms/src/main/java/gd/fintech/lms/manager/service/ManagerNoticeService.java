package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerNoticeMapper;
import gd.fintech.lms.vo.LmsNotice;

@Service
@Transactional
public class ManagerNoticeService {
	@Autowired ManagerNoticeMapper managerNoticeMapper;

	//공지사항 리스트, 페이징
	public List<LmsNotice> getLmsNoticeList(int lmsNoticeNo, int currentPage, int rowPerPage){
		int beginRow = (currentPage -1) * rowPerPage; 
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("lmsNoticeNo", lmsNoticeNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<LmsNotice> lmsnoticeList = managerNoticeMapper.selectLmsNoticeList(map);
		return lmsnoticeList;
	}
	//공지사항 개수
	public int getLmsNoticeCount(int lmsNoticeNo) {
	return managerNoticeMapper.selectLmsNoticeCount(lmsNoticeNo);	
	}
	//공지사항 상세내용
	public LmsNotice getLmsNoticeOne(int lmsNoticeNo) {
		return managerNoticeMapper.selectLmsNoticeOne(lmsNoticeNo);
	}
	//공지사항 작성 
	public int addLmsNotice(LmsNotice lmsNotice) {
		return managerNoticeMapper.insertLmsNotice(lmsNotice);
	}
	//공지사항 수정
	public int modifyLmsNotice(LmsNotice lmsNotice) {
		return managerNoticeMapper.updateLmsNotice(lmsNotice);
	}
	//공지사항 삭제 
	public int removeLmsNotice(int lmsNoticeNo) {
		return managerNoticeMapper.deleteLmsNotice(lmsNoticeNo);
	}
}