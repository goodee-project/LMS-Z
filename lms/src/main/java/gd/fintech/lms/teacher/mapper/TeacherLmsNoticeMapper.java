package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LmsNotice;

@Mapper
public interface TeacherLmsNoticeMapper {
	//공지사항 목록
	List<LmsNotice> selectLmsNoticeList();
	
	//공지사항 상세보기
	LmsNotice selectLmsNoticeOne(int lmsNoticeNo);
}
