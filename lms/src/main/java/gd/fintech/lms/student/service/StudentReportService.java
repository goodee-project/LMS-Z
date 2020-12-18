package gd.fintech.lms.student.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.student.mapper.StudentReportSubmitFileMapper;
import gd.fintech.lms.student.mapper.StudentReportSubmitMapper;
import gd.fintech.lms.vo.QuestionFile;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;
import gd.fintech.lms.vo.ReportSubmitAddForm;
import gd.fintech.lms.vo.ReportSubmitFile;

@Service
public class StudentReportService {
	// 질문 파일업로드를 사용할시 파일이 저장될 경로(uploadfile폴더의 경로)를 지정해주세요
	private final String PATH ="C:\\Users\\git\\LMS-Z\\lms\\src\\main\\webapp\\uploadfile\\questionfile";
	
	@Autowired private StudentReportSubmitMapper studentReportSubmitMapper;
	@Autowired private StudentReportSubmitFileMapper studentReportSubmitFileMapper;	
	public List<Report> getReportPage(String accountId){
		return studentReportSubmitMapper.selectReportListPage(accountId);
	}
	
	public void addReportSubmit(ReportSubmitAddForm reportSubmitAddForm) {
		ReportSubmit reportSubmit = new ReportSubmit();
		reportSubmit.setReportNo(reportSubmitAddForm.getReportNo());
		reportSubmit.setAccountId(reportSubmitAddForm.getAccountId());
		reportSubmit.setReportSubmitTitle(reportSubmitAddForm.getReportSubmitTitle());
		reportSubmit.setReportSubmitWriter(reportSubmitAddForm.getReportSubmitWriter());
		reportSubmit.setReportSubmitCreatedate(reportSubmitAddForm.getReportSubmitCreatedate());
		reportSubmit.setReportSubmitUpdatedate(reportSubmitAddForm.getReportSubmitUpdatedate());
		reportSubmit.setReportSubmitContent(reportSubmitAddForm.getReportSubmitContent());
		studentReportSubmitMapper.insertReport(reportSubmit);
		
		List<ReportSubmitFile> reportSubmitFile = null;
		if(reportSubmitAddForm.getReportSubmitFile() != null) {
			reportSubmitFile = new ArrayList<ReportSubmitFile>();
			for(MultipartFile mf : reportSubmitAddForm.getReportSubmitFile()) {
				ReportSubmitFile rf = new ReportSubmitFile();
				rf.setReportSubmitNo(reportSubmit.getReportSubmitNo());
				int count = 0;
				int p = mf.getOriginalFilename().lastIndexOf(".");
				
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-","");
				
				rf.setReportSubmitFileUuid(filename+ext);
				rf.setReportSubmitFileOriginal(mf.getOriginalFilename());
				rf.setReportSubmitFileSize(mf.getSize());
				rf.setReportSubmitFileType(mf.getContentType());
				rf.setReportSubmitFileCount(count);
				reportSubmitFile.add(rf);
				
				try {
					mf.transferTo(new File(PATH+filename+ext));
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
				
			}
		}
		if(reportSubmitFile != null) {
			for(ReportSubmitFile rf : reportSubmitFile) {
				studentReportSubmitFileMapper.insertReportSubmitFile(rf);
			}
		}
		
	}
	
	public Report getReportOne(int reportNo) {
		Report report = studentReportSubmitMapper.selectReportOne(reportNo);
		return report;
	}
	
}
