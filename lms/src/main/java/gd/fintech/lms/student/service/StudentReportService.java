package gd.fintech.lms.student.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.student.mapper.StudentReportSubmitFileMapper;
import gd.fintech.lms.student.mapper.StudentReportSubmitMapper;
import gd.fintech.lms.vo.QuestionFile;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;
import gd.fintech.lms.vo.ReportSubmitAddForm;
import gd.fintech.lms.vo.ReportSubmitFile;
import gd.fintech.lms.vo.Student;

@Service
public class StudentReportService {
	// 질문 파일업로드를 사용할시 파일이 저장될 경로(uploadfile폴더의 경로)를 지정해주세요
	
	@Autowired private StudentReportSubmitMapper studentReportSubmitMapper;
	@Autowired private StudentReportSubmitFileMapper studentReportSubmitFileMapper;	
	public List<Report> getReportPage(int currentPage, int rowPerPage, String accountId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("accountId", accountId);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		
		return studentReportSubmitMapper.selectReportListPage(map);
	}
	
	public List<Report> getOverdueReportPage(int currentPage, int rowPerPage, String accountId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("accountId", accountId);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		
		return studentReportSubmitMapper.selectOverdueReportListPage(map);
	}
	
	public Student getStudentName(String accountId) {
		return studentReportSubmitMapper.selectStudentName(accountId);
	}
	
	public List<Report> getOverdueReportSearch(int currentPage, int rowPerPage, String accountId, String reportTitle){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reportTitle", reportTitle);
		map.put("accountId", accountId);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		
		return studentReportSubmitMapper.selectOverdueReportSearch(map);
	}
	
	public int totalReport(String accountId) {
		return studentReportSubmitMapper.totalCountReport(accountId);
	}
	
	public int totalOverdueSearch(String accountId, String reportTitle) {
		return studentReportSubmitMapper.totalCountOverdueSearch(accountId, reportTitle);
	}
	
	public int totalOverdueReport(String accountId) {
		return studentReportSubmitMapper.totalCountOverdueReport(accountId);
	}
	public int upCountReportFile(String reportSubmitFileUuid) {
		return studentReportSubmitFileMapper.updateFileCount(reportSubmitFileUuid);
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
				

				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				
				String rootPath = request.getSession().getServletContext().getRealPath("/");
				
				String attachPath = "uploadfile\\reportfile\\";
				
				File f = new File(rootPath + attachPath + filename + ext);
				
				try {
					mf.transferTo(f);
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
	
	public int deleteReportOneFile(String reportSubmitFileUuid) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		String attachPath = "uploadfile\\reportfile\\";
		
		File file = new File(rootPath+attachPath+reportSubmitFileUuid);
		if(file.exists()) {
			file.delete();
		}
		return studentReportSubmitFileMapper.deleteReportSubmitFile(reportSubmitFileUuid);
	}
	
	public void deleteReportAllSubmit(int reportSubmitNo) {
		List<String> reportSubmitFileUuid = studentReportSubmitFileMapper.selectReportSubmitFileUuid(reportSubmitNo);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		String attachPath = "uploadfile\\reportfile\\";
		
		for(String s : reportSubmitFileUuid) {
			File file = new File(rootPath+attachPath+reportSubmitFileUuid);
			if(file.exists()) {
				file.delete();
			}
		}
		studentReportSubmitFileMapper.deleteReportSubmitAllFile(reportSubmitNo);
		studentReportSubmitMapper.deleteReportSubmit(reportSubmitNo);
	}
	
	public Report getReportOne(int reportNo) {
		Report report = studentReportSubmitMapper.selectReportOne(reportNo);
		return report;
	}
	
	public ReportSubmit getReportSubmitOne(int reportNo, String accountId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reportNo", reportNo);
		map.put("accountId", accountId);
		return studentReportSubmitMapper.selectReportSubmitOne(map);
	}
	
	public void updateReportSubmit(ReportSubmitAddForm reportSubmitAddForm) {
		ReportSubmit reportSubmit = new ReportSubmit();
		reportSubmit.setReportSubmitNo(reportSubmitAddForm.getReportSubmitNo());
		reportSubmit.setReportSubmitWriter(reportSubmitAddForm.getReportSubmitWriter());
		reportSubmit.setReportSubmitUpdatedate(reportSubmitAddForm.getReportSubmitUpdatedate());
		reportSubmit.setReportSubmitTitle(reportSubmitAddForm.getReportSubmitTitle());
		reportSubmit.setReportSubmitContent(reportSubmitAddForm.getReportSubmitContent());
		studentReportSubmitMapper.updateReportSubmit(reportSubmit);
		
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
				
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				
				String rootPath = request.getSession().getServletContext().getRealPath("/");
				
				String attachPath = "uploadfile\\reportfile\\";
				
				try {
					mf.transferTo(new File(rootPath+attachPath+filename+ext));
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
}
