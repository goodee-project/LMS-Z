package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureArchive;

@Mapper
public interface StudentLectureArchiveMapper {

	List<LectureArchive> selectLectureArchiveList(Map<String, Object>map);
	
	List<LectureArchive> selectLectureArchiveSearchTitle(Map<String, Object>map);
	
	List<LectureArchive> selectLectureArchiveSearchLecture(Map<String, Object>map);
	
	LectureArchive selectLectureArchiveOne(int lectureArchiveNo);
	
	int upLectureArchiveCount(int lectureArchiveNo);
	
	int upLectureArchiveFileCount(String lectureArchiveFileUuid);
	
	int totalLectureArchive(String accountId);
	
	int totalSearchLectureArchive(String accountId,String lectureArchiveTitle);
	
	int totalSearchLecture(Map<String, Object>map);
	
	List<Lecture> selectLectureList(String accountId); 
}
