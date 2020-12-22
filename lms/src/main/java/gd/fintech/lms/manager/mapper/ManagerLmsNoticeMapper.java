package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LmsNotice;

@Mapper
public interface ManagerLmsNoticeMapper {
	
	//공지사항 리스트 
	List<LmsNotice> selectLmsNoticeList(Map<String, Integer> map);
	
	//공지사항 총 리스트 수
	int selectLmsNoticeCount();
	
	//공지사항 클릭시 조회 수 +1
	int updateLmsNoticeCount(int lmsNoticeNo);
	
	//공지사항 상세내용
	LmsNotice selectLmsNoticeOne(int lmsNoticeNo);
	
	//공지사항 추가 
	int insertLmsNotice(LmsNotice lmsNotice);
	
	//공지사항 수정 
	int updateLmsNotice(LmsNotice lmsNotice);
	
	//공지사항 삭제 
	int deleteLmsNotice(int lmsNoticeNo);
	
}