package gd.fintech.lms.teacher.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherReportSubmitMapper;
import gd.fintech.lms.vo.ReportSubmit;

@Service
@Transactional
public class TeacherReportSubmitService {
	@Autowired TeacherReportSubmitMapper teacherReportSubmitMapper;
	
	public List<ReportSubmit> getReportSubmit(int reportNo){
		
		return teacherReportSubmitMapper.selectReportSubmit(reportNo);
	}
}
