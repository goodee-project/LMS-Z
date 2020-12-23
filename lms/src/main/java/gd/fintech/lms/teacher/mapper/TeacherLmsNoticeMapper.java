package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LmsNotice;

@Mapper
public interface TeacherLmsNoticeMapper {
	//공지사항 목록
	List<LmsNotice> selectLmsNoticeList(Map<String, Object> map);
	
	//공지사항 리스트 총개수
	int selectLmsNoticeCount();
	
	//공지사항 상세보기
	LmsNotice selectLmsNoticeOne(int lmsNoticeNo);
	
	//공지사항 조회수 증가
	int updateLmsNoticeCount(int lmsNoticeNo);
}
