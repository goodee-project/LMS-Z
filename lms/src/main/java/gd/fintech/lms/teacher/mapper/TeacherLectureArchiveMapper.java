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
	
	int totalLectureArchive(String accountId);
	
	int insertLectureArchive(LectureArchive lectureArchive);
	
	List<Lecture> selectLectureList(String accountId);
	
	LectureArchive selectLectureArchiveOne(int lectureArchiveNo);
	
	int updateLectureArchive(LectureArchive lectureArchive);
}
