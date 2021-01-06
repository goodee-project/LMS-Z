package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureArchive;

@Mapper
public interface StudentLectureArchiveMapper {

	List<LectureArchive> selectLectureArchiveList(Map<String, Object>map);
	
	LectureArchive selectLectureArchiveOne(int lectureArchiveNo);
	
	int upLectureArchiveCount(int lectureArchiveNo);
	
	int totalLectureArchive(String accountId);
}
