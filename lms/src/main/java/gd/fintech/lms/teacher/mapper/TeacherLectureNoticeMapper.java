package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureNotice;

@Mapper
public interface TeacherLectureNoticeMapper {
	// 강좌별 공지사항 목록 mapper
	// 강좌별 공지사항 목록(Map->lectureNo, beginRow, rowPerPage)
	List<LectureNotice> selectLectureNoticeList(Map<String, Integer> map);
	// 강좌별 공지사항 목록 페이징을 위한 공지사항 총 개수
	int selectLectureNoticeCount(int lectureNo);
	
	// 강좌별 공지사항 등록
	int insertLectureNotice(LectureNotice lectureNotice);

	// 강좌별 공지사항 상세보기
	LectureNotice selectLectureNoticeOne(int lectureNoticeNo);
	
	// 강좌별 공지사항 수정
	int updateLectureNotice(LectureNotice lectureNotice);
	
	// 강좌별 공지사항 삭제
	int deleteLectureNotice(int lectureNoticeNo);
}
