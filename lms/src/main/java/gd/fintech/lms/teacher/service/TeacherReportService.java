package gd.fintech.lms.teacher.service;

import java.util.List;

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
	public List<Report> getReportList(){
		return teacherReportMapper.selectReportList();
	}
	
	//과제등록
	public int addReport(Report report) {
		return teacherReportMapper.insertReport(report);
	}
	
	//과제삭제
	public int removeReport(int reportNo) {
		return teacherReportMapper.deleteReport(reportNo);
	}
	
	//과제 상세보기
	public Report getReportOne(int reportNo) {
		return teacherReportMapper.selectReportOne(reportNo);
	}

}