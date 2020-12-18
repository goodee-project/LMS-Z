package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentReportMapper;
import gd.fintech.lms.vo.Report;

@Service
public class StudentReportService {
	@Autowired private StudentReportMapper studentReportMapper;
		
	public List<Report> getReportPage(String accountId){
		return studentReportMapper.selectReportListPage(accountId);
	}
	
	
}
