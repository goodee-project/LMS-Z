package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureArchive;

@Mapper
public interface TeacherLectureArchiveMapper {
	
	// 자료실 리스트
	List<LectureArchive> selectLectureArchive(Map<String, Object>map);
	
	List<LectureArchive> selectLectureArchiveSearchTitle(Map<String, Object>map);
	
	int totalLectureArchive(String accountId);
	
	int totalSearchLectureArchive(String accountId,String lectureArchiveTitle);
	
	int insertLectureArchive(LectureArchive lectureArchive);
	
	int deleteLectureArchive(int lectureArchiveNo);
	
	List<Lecture> selectLectureList(String accountId);
	
	LectureArchive selectLectureArchiveOne(int lectureArchiveNo);
	
	int updateLectureArchive(LectureArchive lectureArchive);
	
	int upLectureArchiveCount(int lectureArchiveNo);
	//강좌와 연결된 자료실 목록 출력
	List<Integer> selectArchiveAndLecture(int lectureNo);
}
