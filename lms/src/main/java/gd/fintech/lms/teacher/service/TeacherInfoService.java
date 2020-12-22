package gd.fintech.lms.teacher.service;

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

import gd.fintech.lms.teacher.mapper.TeacherInfoMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class TeacherInfoService {
	@Autowired TeacherInfoMapper teacherInfoMapper;
	
	// 주소변경 사이트 주소 가져오기
	public Teacher getTeacherByAddress(String teacherId) {
		return teacherInfoMapper.selectTeacherByAddress(teacherId);
	}
	
	// 회원 탈퇴
	public void deleteTeacher(String teacherId) {
		Account account = new Account();
		
		account.setAccountState("탈퇴");
		account.setAccountId(teacherId);
		teacherInfoMapper.updateAccountTodelete(account);
		
		teacherInfoMapper.deleteTeacher(teacherId);
	}
	
	public void modifyTeacherByImage(MultipartFile multipartFile, String teacherId) {
		// 파일의 점 위치 확인
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		// 파일의 확장자 확인
		String ext = multipartFile.getOriginalFilename().substring(p).toLowerCase();
		// 파일 이름을 uuid를 통해 암호화
		String fileName = UUID.randomUUID().toString().replace("-", "");
		// 예전 파일이름을 가져옴
		String pastFileName = teacherInfoMapper.selectTeacherByImageTodelete(teacherId);
		
		teacherInfoMapper.updateTeacherByImage(teacherId, fileName);
		
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
		
		session.removeAttribute("teacherImage"); 
	    session.setAttribute("teacherImage", fileName);
	}
	
	// 마이페이지 주소 수정
	public void modifyTeacherByAddress(Teacher teacher) {
		teacherInfoMapper.updateTeacherByAddress(teacher);
	}
	
	// 마이페이지 핸드폰 번호 수정
	public void modifyTeacherByPhone(String teacherId, String teacherPhone) {
		teacherInfoMapper.updateTeacherByPhone(teacherId, teacherPhone);
	}
	
	// 마이페이지 생일 수정
	public void modifyTeacherByBirth(String teacherId, String teacherBirth) {
		teacherInfoMapper.updateTeacherByBirth(teacherId, teacherBirth);
	}
	
	// 마이페이지 성별 수정
	public void modifyTeacherByGender(String teacherId, String teacherGender) {
		teacherInfoMapper.updateTeacherByGender(teacherId, teacherGender);
	}
	
	// 마이페이지 이메일 중복검사
	public int getTeacherAndTeacherQueueByOverlapEmail(String teacherEmail) {
		return teacherInfoMapper.selectTeacherAndTeacherQueueByOverlapEmail(teacherEmail);
	}
	
	// 마이페이지 이메일 수정
	public void modifyTeacherByEmail(String teacherId, String teacherEmail) {
		teacherInfoMapper.updateTeacherByEmail(teacherId, teacherEmail);
	}
	
	// 마이페이지 이름 수정
	public void modifyTeacherByName(String teacherId, String teacherName) {
		teacherInfoMapper.updateTeacherByName(teacherId, teacherName);
	}
	
	// 패스워드 변경 시 현재 패스워드 확인
	public int getAccountByPw(String accountId, String accountPw) {
		return teacherInfoMapper.selectAccountByPw(accountId, accountPw);
	}
	
	// 강사 마이페이지 정보
	public Teacher getTeacherInfo(String teacherId) {
		// mapper의 강사 마이페이지 정보 메소드 return
		return teacherInfoMapper.selectTeacherInfo(teacherId);
	}
	
	// 패스워드 변경
	public void modifyAccountPw(Account account) {
		teacherInfoMapper.updateAccountPw(account);
	}
	
}
