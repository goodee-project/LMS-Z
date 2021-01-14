package gd.fintech.lms.manager.service;

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

import gd.fintech.lms.Path;
import gd.fintech.lms.manager.mapper.ManagerInfoMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;

@Service
@Transactional
public class ManagerInfoService {
	@Autowired ManagerInfoMapper managerInfoMapper;
	
	private static String OS = System.getProperty("os.name").toLowerCase();
	
	// 주소변경 사이트 주소 가져오기
	public Manager getManagerByAddress(String managerId) {
		return managerInfoMapper.selectManagerByAddress(managerId);
	}
	
	// 회원 탈퇴
	public void deleteManager(String managerId) {
		Account account = new Account();
		
		account.setAccountState("탈퇴");
		account.setAccountId(managerId);
		managerInfoMapper.updateAccountTodelete(account);
		
		managerInfoMapper.deleteManager(managerId);
	}
	
	public void modifyManagerByImage(MultipartFile multipartFile, String managerId) {
		// 파일의 점 위치 확인
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		// 파일의 확장자 확인
		String ext = multipartFile.getOriginalFilename().substring(p).toLowerCase();
		// 파일 이름을 uuid를 통해 암호화
		String fileName = UUID.randomUUID().toString().replace("-", "");
		// 예전 파일이름을 가져옴
		String pastFileName = managerInfoMapper.selectManagerByImageTodelete(managerId);
		
		managerInfoMapper.updateManagerByImage(managerId, fileName);
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		// 서버의 상대경로
    	String rootPath = "";
    	String attachPath = "";
    	
        if ( OS.indexOf("nux") >= 0) {
        	rootPath = "/var/lib/tomcat9/webapps/lms/";
        	attachPath = "images/";
        } else {
            File file = new File("");
            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
            attachPath = "images\\";
        }
		
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
		
		session.removeAttribute("managerImage"); 
	    session.setAttribute("managerImage", fileName);
	}
	
	// 마이페이지 주소 수정
	public void modifyManagerByAddress(Manager manager) {
		managerInfoMapper.updateManagerByAddress(manager);
	}
	
	// 마이페이지 직책 수정
	public void modifyManagerByPosition(String managerId, String managerPosition) {
		managerInfoMapper.updateManagerByPosition(managerId, managerPosition);
	}
	
	// 마이페이지 핸드폰 번호 수정
	public void modifyManagerByPhone(String managerId, String managerPhone) {
		managerInfoMapper.updateManagerByPhone(managerId, managerPhone);
	}
	
	// 마이페이지 생일 수정
	public void modifyManagerByBirth(String managerId, String managerBirth) {
		managerInfoMapper.updateManagerByBirth(managerId, managerBirth);
	}
	
	// 마이페이지 성별 수정
	public void modifyManagerByGender(String managerId, String managerGender) {
		managerInfoMapper.updateManagerByGender(managerId, managerGender);
	}
	
	// 마이페이지 이메일 중복검사
	public int getManagerAndManagerQueueByOverlapEmail(String managerEmail) {
		return managerInfoMapper.selectManagerAndManagerQueueByOverlapEmail(managerEmail);
	}
	
	// 마이페이지 이메일 수정
	public void modifyManagerByEmail(String managerId, String managerEmail) {
		managerInfoMapper.updateManagerByEmail(managerId, managerEmail);
	}
	
	// 마이페이지 이름 수정
	public void modifyManagerByName(String managerId, String managerName) {
		managerInfoMapper.updateManagerByName(managerId, managerName);
	}
	
	// 패스워드 변경 시 현재 패스워드 확인
	public int getAccountByPw(String accountId, String accountPw) {
		return managerInfoMapper.selectAccountByPw(accountId, accountPw);
	}
	
	// 강사 마이페이지 정보
	public Manager getManagerInfo(String managerId) {
		// mapper의 강사 마이페이지 정보 메소드 return
		return managerInfoMapper.selectManagerInfo(managerId);
	}
	
	// 패스워드 변경
	public void modifyAccountPw(Account account) {
		managerInfoMapper.updateAccountPw(account);
	}
	
}
