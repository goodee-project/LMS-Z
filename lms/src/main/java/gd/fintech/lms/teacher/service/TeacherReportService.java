package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherReportMapper;
import gd.fintech.lms.vo.Report;

@Service
@Transactional
public class TeacherReportService {
	@Autowired TeacherReportMapper teacherReportMapper;
	
	//과제목록
	public List<Report> getReportList(int lectureNo, int beginRow, int rowPerPage){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		return teacherReportMapper.selectReportList(map);
	}
	
	//과제등록
	public int addReport(Report report) {
		return teacherReportMapper.insertReport(report);
	}
	//과제삭제
	public void removeReport(int reportNo) {
		teacherReportMapper.deleteReportSubmit(reportNo);
		teacherReportMapper.deleteReport(reportNo);
	}
	
	//과제 상세보기
	public Report getReportOne(int reportNo) {
		return teacherReportMapper.selectReportOne(reportNo);
	}
	
	//과제수정
	public int modifyReport(Report report) {
		return teacherReportMapper.updateReport(report);
	}
	//페이징을 위한 카운트
	public int getReportCount(int lectureNo) {
		return teacherReportMapper.selectReoprtCount(lectureNo);
	}
}
