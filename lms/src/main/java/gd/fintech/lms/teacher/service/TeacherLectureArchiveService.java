package gd.fintech.lms.teacher.service;

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

import gd.fintech.lms.teacher.mapper.TeacherLectureArchiveFileMapper;
import gd.fintech.lms.teacher.mapper.TeacherLectureArchiveMapper;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureArchive;
import gd.fintech.lms.vo.LectureArchiveAddForm;
import gd.fintech.lms.vo.LectureArchiveFile;
import gd.fintech.lms.vo.QuestionAddForm;
import gd.fintech.lms.vo.QuestionFile;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Service
public class TeacherLectureArchiveService {
	
	@Autowired TeacherLectureArchiveMapper teacherLectureArchiveMapper;
	@Autowired TeacherLectureArchiveFileMapper teacherLectureArchiveFileMapper;
	private static String OS = System.getProperty("os.name").toLowerCase();
	
	public List<LectureArchive> getLectureArchiveList(int currentPage, int rowPerPage, String accountId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("accountId", accountId);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		
		return teacherLectureArchiveMapper.selectLectureArchive(map);
	}
	
	public List<LectureArchive> getLectureArchiveSearchList(int currentPage, int rowPerPage, String accountId, String lectureArchiveTitle){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("accountId", accountId);
		map.put("lectureArchiveTitle", lectureArchiveTitle);
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		System.out.println(lectureArchiveTitle);
		return teacherLectureArchiveMapper.selectLectureArchiveSearchTitle(map);
	}
	
	public int listCountLectureArchive(String accountId) {
		return teacherLectureArchiveMapper.totalLectureArchive(accountId);
	}
	
	public int searchCountLectureArchive(String accountId, String lectureArchiveTitle) {
		return teacherLectureArchiveMapper.totalSearchLectureArchive(accountId, lectureArchiveTitle);
	}
	
	public Teacher getTeacherName(String accountId) {
		return teacherLectureArchiveMapper.selectTeacherName(accountId);
	}
	
	public Lecture getLectureName(String accountId, int lectureNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountId", accountId);
		map.put("lectureNo", lectureNo);
		return teacherLectureArchiveMapper.selectLectureName(map);
	}
	public void addLectureArchive(LectureArchiveAddForm lectureArchiveAddForm) {
		LectureArchive lectureArchive = new LectureArchive();
		
		lectureArchive.setLectureNo(lectureArchiveAddForm.getLectureNo());
		lectureArchive.setAccountId(lectureArchiveAddForm.getAccountId());
		lectureArchive.setLectureArchiveWriter(lectureArchiveAddForm.getLectureArchiveWriter());
		lectureArchive.setLectureArchiveTitle(lectureArchiveAddForm.getLectureArchiveTitle());
		lectureArchive.setLectureArchiveContent(lectureArchiveAddForm.getLectureArchiveContent());
		lectureArchive.setLectureArchiveCreatedate(lectureArchiveAddForm.getLectureArchiveCreatedate());
		lectureArchive.setLectureArchiveUpdatedate(lectureArchiveAddForm.getLectureArchiveUpdatedate());
		lectureArchive.setLectureArchiveCount(lectureArchiveAddForm.getLectureArchiveCount());
		
		teacherLectureArchiveMapper.insertLectureArchive(lectureArchive);
		
		List<LectureArchiveFile> lectureArchiveFile=null;
		if(lectureArchiveAddForm.getLectureArchiveFile() != null) {
			lectureArchiveFile = new ArrayList<LectureArchiveFile>();
			for(MultipartFile mf : lectureArchiveAddForm.getLectureArchiveFile()) {
				LectureArchiveFile lf = new LectureArchiveFile();
				lf.setLectureArchiveNo(lectureArchive.getLectureArchiveNo());
				int count = 0;
				int p = mf.getOriginalFilename().lastIndexOf(".");
				
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-","");
				
				lf.setLectureArchiveFileUuid(filename+ext);
				lf.setLectureArchiveFileOriginal(mf.getOriginalFilename());
				lf.setLectureArchiveFileSize(mf.getSize());
				lf.setLectureArchiveFileType(mf.getContentType());
				lf.setLectureArchiveFileCount(count);
				lectureArchiveFile.add(lf);
				
				
				String rootPath = "";
				
				String attachPath = "";
				
				if ( OS.indexOf("nux") >= 0) {
		        	rootPath = "/var/lib/tomcat9/webapps/lms/";
		        	attachPath = "uploadfile/lectureArchivefile/";
		        } else {
		            File file = new File("");
		            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
		            attachPath = "uploadfile\\lectureArchivefile\\";
		        }
				
				
				File f = new File(rootPath + attachPath + filename + ext);
				
				try {
					mf.transferTo(f);
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		} 
		if(lectureArchiveFile != null) {
			for(LectureArchiveFile lf : lectureArchiveFile) {
				teacherLectureArchiveFileMapper.insertLectureArchiveFile(lf);
			}
		}
	}
	public List<Lecture> getLectureList(String accountId){
		return teacherLectureArchiveMapper.selectLectureList(accountId);
	}
	public LectureArchive getLectureArchiveOne(int lectureArchiveNo) {
		LectureArchive lectureArchive = teacherLectureArchiveMapper.selectLectureArchiveOne(lectureArchiveNo);
		return lectureArchive;
	}
	public int deleteLectureArchiveOneFile(String lectureArchiveFileUuid) {
		String rootPath = "";
		
		String attachPath = "";
		
		if ( OS.indexOf("nux") >= 0) {
        	rootPath = "/var/lib/tomcat9/webapps/lms/";
        	attachPath = "uploadfile/lectureArchivefile/";
        } else {
            File file = new File("");
            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
            attachPath = "uploadfile\\lectureArchivefile\\";
        }
		
		
		File file = new File(rootPath+attachPath+lectureArchiveFileUuid);
		if(file.exists()) {
			file.delete();
		}
		return teacherLectureArchiveFileMapper.deleteLectureArchiveOneFile(lectureArchiveFileUuid);
	}
	
	public void deleteLectureArchive(int lectureArchiveNo) {
		List<String> lectureArchiveFileUuid = teacherLectureArchiveFileMapper.selectLectureArchiveFileUuid(lectureArchiveNo);
		String rootPath = "";
		
		String attachPath = "";
		
		if ( OS.indexOf("nux") >= 0) {
        	rootPath = "/var/lib/tomcat9/webapps/lms/";
        	attachPath = "uploadfile/lectureArchivefile/";
        } else {
            File file = new File("");
            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
            attachPath = "uploadfile\\lectureArchivefile\\";
        }
		
		for(String s : lectureArchiveFileUuid) {
			File file = new File(rootPath + attachPath+s);
			if(file.exists()) {
				file.delete();
			}
		}
		teacherLectureArchiveFileMapper.deleteLectureArchiveAllFile(lectureArchiveNo);
		teacherLectureArchiveMapper.deleteLectureArchive(lectureArchiveNo);
	}
	public void updateLectureArchive(LectureArchiveAddForm lectureArchiveAddForm) {
		LectureArchive lectureArchive = new LectureArchive();
		lectureArchive.setLectureArchiveNo(lectureArchiveAddForm.getLectureArchiveNo());
		lectureArchive.setAccountId(lectureArchiveAddForm.getAccountId());
		lectureArchive.setLectureNo(lectureArchiveAddForm.getLectureNo());
		lectureArchive.setLectureArchiveWriter(lectureArchiveAddForm.getLectureArchiveWriter());
		lectureArchive.setLectureArchiveTitle(lectureArchiveAddForm.getLectureArchiveTitle());
		lectureArchive.setLectureArchiveContent(lectureArchiveAddForm.getLectureArchiveContent());
		lectureArchive.setLectureArchiveUpdatedate(lectureArchiveAddForm.getLectureArchiveUpdatedate());
		teacherLectureArchiveMapper.updateLectureArchive(lectureArchive);
		
		List<LectureArchiveFile> lectureArchiveFile=null;
		if(lectureArchiveAddForm.getLectureArchiveFile() != null) {
			lectureArchiveFile = new ArrayList<LectureArchiveFile>();
			for(MultipartFile mf : lectureArchiveAddForm.getLectureArchiveFile()) {
				LectureArchiveFile lf = new LectureArchiveFile();
				lf.setLectureArchiveNo(lectureArchive.getLectureArchiveNo());
				int count = 0;
				int p = mf.getOriginalFilename().lastIndexOf(".");
				
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-","");
				
				lf.setLectureArchiveFileUuid(filename+ext);
				lf.setLectureArchiveFileOriginal(mf.getOriginalFilename());
				lf.setLectureArchiveFileSize(mf.getSize());
				lf.setLectureArchiveFileType(mf.getContentType());
				lf.setLectureArchiveFileCount(count);
				lectureArchiveFile.add(lf);
				
				String rootPath = "";
				
				String attachPath = "";
				
				if ( OS.indexOf("nux") >= 0) {
		        	rootPath = "/var/lib/tomcat9/webapps/lms/";
		        	attachPath = "uploadfile/lectureArchivefile/";
		        } else {
		            File file = new File("");
		            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
		            attachPath = "uploadfile\\lectureArchivefile\\";
		        }
				
				File f = new File(rootPath + attachPath + filename + ext);
				
				try {
					mf.transferTo(f);
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		} 
		if(lectureArchiveFile != null) {
			for(LectureArchiveFile lf : lectureArchiveFile) {
				teacherLectureArchiveFileMapper.insertLectureArchiveFile(lf);
			}
		}
	}
	
	public int upCountLectureArchive(int lectureArchiveNo) {
		return teacherLectureArchiveMapper.upLectureArchiveCount(lectureArchiveNo);
	}
	
	public int upCountLectureArchiveFile(String lectureArchiveFileUuid) {
		return teacherLectureArchiveFileMapper.upLectureArchiveFileCount(lectureArchiveFileUuid);
	}
}
