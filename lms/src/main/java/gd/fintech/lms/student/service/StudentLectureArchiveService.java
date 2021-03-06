package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentLectureArchiveMapper;
import gd.fintech.lms.vo.Lecture;
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
	
	public List<LectureArchive> getLectureArchiveSearchLecture(int currentPage, int rowPerPage,int lectureNo, String accountId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("accountId", accountId);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return studentLectureArchiveMapper.selectLectureArchiveSearchLecture(map);
	}
	
	public List<LectureArchive> getLectureArchiveSearchList(int currentPage, int rowPerPage, String accountId, String lectureArchiveTitle){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("accountId", accountId);
		map.put("lectureArchiveTitle", lectureArchiveTitle);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return studentLectureArchiveMapper.selectLectureArchiveSearchTitle(map);
	}
	
	public List<Lecture> getLectureList(String accountId){
		return studentLectureArchiveMapper.selectLectureList(accountId);
	}
	
	public LectureArchive getLectureArchiveOne(int lectureArchiveNo) {
		return studentLectureArchiveMapper.selectLectureArchiveOne(lectureArchiveNo);
	}
	
	public int upCountLectureArchive(int lectureArchiveNo) {
		return studentLectureArchiveMapper.upLectureArchiveCount(lectureArchiveNo);
	}
	
	public int upCountLectureArchiveFile(String lectureArchiveFileUuid) {
		return studentLectureArchiveMapper.upLectureArchiveFileCount(lectureArchiveFileUuid);
	}
	
	public int searchCountLectureArchive(String accountId, String lectureArchiveTitle) {
		return studentLectureArchiveMapper.totalSearchLectureArchive(accountId, lectureArchiveTitle);
	}
	
	public int searchCountLecture(String accountId, int lectureNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountId", accountId);
		map.put("lectureNo", lectureNo);
		return studentLectureArchiveMapper.totalSearchLecture(map);
	}
	
	public int listCountLectureArchive(String accountId) {
		return studentLectureArchiveMapper.totalLectureArchive(accountId);
	}
}
