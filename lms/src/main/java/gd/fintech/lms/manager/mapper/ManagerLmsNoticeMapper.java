package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LmsNotice;

@Mapper
public interface ManagerLmsNoticeMapper {
	
	//공지사항 리스트 
	List<LmsNotice> selectLmsNoticeList(Map<String, Object> map);
	
	//공지사항 총 리스트 수
	int selectLmsNoticeCount();
	
	//검색 후 일치하는 공지사항 리스트
	List<LmsNotice> selectSearchLmsNotice(Map<String,Object> map);
	
	//LMS 공지사항 검색 했을 때 일치하는 DB데이터 수
	int selectSearchNoticeTotal(String lmsNoticeTitle);
	
	//공지사항 클릭시 조회 수 +1
	int updateLmsNoticeCount(int lmsNoticeNo);
	
	//공지사항 상세내용
	LmsNotice selectLmsNoticeOne(int lmsNoticeNo);
	
	//공지사항 추가 
	int insertLmsNotice(LmsNotice lmsNotice);
	
	//공지사항 추가 시 자동으로 작성자 이름 출력
	String selectManagerName(String managerId);
	
	//공지사항 수정 
	int updateLmsNotice(LmsNotice lmsNotice);
	
	//공지사항 삭제 
	int deleteLmsNotice(int lmsNoticeNo);
	
}