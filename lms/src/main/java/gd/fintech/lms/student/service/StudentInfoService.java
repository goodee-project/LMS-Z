package gd.fintech.lms.student.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.student.mapper.StudentInfoMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Student;

@Service
@Transactional
public class StudentInfoService {
	@Autowired StudentInfoMapper studentInfoMapper;
	
	// 주소변경 사이트 주소 가져오기
	public Student getstudentByAddress(String studentId) {
		return studentInfoMapper.selectStudentByAddress(studentId);
	}
	
	// 회원 탈퇴
	public void deleteStudent(String studentId) {
		Account account = new Account();
		
		account.setAccountState("탈퇴");
		account.setAccountId(studentId);
		studentInfoMapper.updateAccountTodelete(account);
		
		studentInfoMapper.deleteStudent(studentId);
	}
	
	public void modifyStudentByImage(MultipartFile multipartFile, String studentId) {
		// 파일의 점 위치 확인
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		// 파일의 확장자 확인
		String ext = multipartFile.getOriginalFilename().substring(p).toLowerCase();
		// 파일 이름을 uuid를 통해 암호화
		String fileName = UUID.randomUUID().toString().replace("-", "");
		// 예전 파일이름을 가져옴
		String pastFileName = studentInfoMapper.selectStudentByImageTodelete(studentId);
		
		studentInfoMapper.updateStudentByImage(studentId, fileName);
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		// 서버의 상대경로
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		// 서버의 중간경로
		String attachPath = "images\\";
		
		File f = new File(rootPath + attachPath + fileName);
		File pastF = new File(rootPath + attachPath + pastFileName);
		
		// 이미지 수정 전에 예전 이미지 삭제
		if(pastF.exists()) {
			pastF.delete();
		}
		
		// 파일 경로로 이미지를 저장
		try {			
			multipartFile.transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		HttpSession session = request.getSession();
		
		session.removeAttribute("studentImage"); 
	    session.setAttribute("studentImage", fileName);
	}
	
	// 마이페이지 주소 수정
	public void modifyStudentByAddress(Student student) {
		studentInfoMapper.updateStudentByAddress(student);
	}
	
	// 마이페이지 핸드폰 번호 수정
	public void modifyStudentByPhone(String studentId, String studentPhone) {
		studentInfoMapper.updateStudentByPhone(studentId, studentPhone);
	}
	
	// 마이페이지 생일 수정
	public void modifyStudentByBirth(String studentId, String studentBirth) {
		studentInfoMapper.updateStudentByBirth(studentId, studentBirth);
	}
	
	// 마이페이지 성별 수정
	public void modifyStudentByGender(String studentId, String studentGender) {
		studentInfoMapper.updateStudentByGender(studentId, studentGender);
	}
	
	// 마이페이지 이메일 중복검사
	public int getStudentAndStudentQueueByOverlapEmail(String studentEmail) {
		return studentInfoMapper.selectStudentAndStudentQueueByOverlapEmail(studentEmail);
	}
	
	// 마이페이지 이메일 수정
	public void modifyStudentByEmail(String studentId, String studentEmail) {
		studentInfoMapper.updateStudentByEmail(studentId, studentEmail);
	}
	
	// 마이페이지 이름 수정
	public void modifyStudentByName(String studentId, String studentName) {
		studentInfoMapper.updateStudentByName(studentId, studentName);
	}
	
	// 패스워드 변경 시 현재 패스워드 확인
	public int getAccountByPw(String accountId, String accountPw) {
		return studentInfoMapper.selectAccountByPw(accountId, accountPw);
	}
	
	// 학생 마이페이지 정보
	public Student getStudentInfo(String studentId) {
		// mapper의 강사 마이페이지 정보 메소드 return
		return studentInfoMapper.selectStudentInfo(studentId);
	}
	
	// 패스워드 변경
	public void modifyAccountPw(Account account) {
		studentInfoMapper.updateAccountPw(account);
	}
	
}
