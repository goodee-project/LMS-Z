package gd.fintech.lms.teachermapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureNotice;

@Mapper
public interface TeacherLectureNoticeMapper {
	// 강좌별 공지사항 목록 mapper
	List<LectureNotice> selectLectureNoticeList(Map<String, Integer> map); // 강좌별 공지사항 목록
	int selectLectureNoticeCount(int lectureNo); // 강좌별 공지사항 목록 페이징을 위한 공지사항 총 개수
	
	// 강좌별 공지사항 등록
	int insertLectureNotice(LectureNotice lectureNotice);

	// 강좌별 공지사항 상세보기(수정폼)
	LectureNotice selectLectureNoticeOne(int lectureNo);
}
