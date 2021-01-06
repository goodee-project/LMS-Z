package gd.fintech.lms.student.restservice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.restmapper.StudentReportSubmitRestMapper;

@Service
@Transactional
public class StudentReportSubmitRestService {
	@Autowired StudentReportSubmitRestMapper studentReportSubmitRestMapper;
	
	//학생 과제 제출 빈도 및 강의별 총 과제 수
	public Map<String, Object> getReportSubmit(String studentId){
		return studentReportSubmitRestMapper.selectReportSubmit(studentId);
	}
}
