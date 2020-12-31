package gd.fintech.lms.student.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentIndexMapper;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Report;

@Service
@Transactional
public class StudentIndexService {
	@Autowired StudentIndexMapper studentIndexMapper;
	
	// 해당 아이디가 듣고 있는 강좌 service
	public List<Lecture> getLecture(String studentId){
		return studentIndexMapper.selectLecture(studentId);
	}
	
	// 해당 아이디가 듣고 있는 강좌의 과제와 그 과제를 제출했는지를 알기 위한 service
	public List<Report> getReport(String studentId){
		List<Report> reportList = studentIndexMapper.selectReport(studentId);
		List<Report> reportListReturn = new ArrayList<Report>();
		
		int reportCheck = 0;
		
		for(int i=0; i<reportList.size(); i++) {
			reportCheck = reportList.get(i).getReportNo();
			int returnCheck = studentIndexMapper.selectReportCheck(reportCheck, studentId);
			if(returnCheck == 0) {
				reportListReturn.add(reportList.get(i));
			}
		}
		
		
		return reportListReturn;
	}
}
