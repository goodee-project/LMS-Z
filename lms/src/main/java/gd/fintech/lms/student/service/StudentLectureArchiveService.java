package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentLectureArchiveMapper;
import gd.fintech.lms.vo.LectureArchive;

@Service
public class StudentLectureArchiveService {
	@Autowired StudentLectureArchiveMapper studentLectureArchiveMapper;
	
	public List<LectureArchive> getLectureArchiveList(int currentPage, int rowPerPage, String accountId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountId", accountId);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return studentLectureArchiveMapper.selectLectureArchiveList(map);
	}
	
	public LectureArchive getLectureArchiveOne(int lectureArchiveNo) {
		return studentLectureArchiveMapper.selectLectureArchiveOne(lectureArchiveNo);
	}
	
	public int upCountLectureArchive(int lectureArchiveNo) {
		return studentLectureArchiveMapper.upLectureArchiveCount(lectureArchiveNo);
	}
	
	public int listCountLectureArchive(String accountId) {
		return studentLectureArchiveMapper.totalLectureArchive(accountId);
	}
}
