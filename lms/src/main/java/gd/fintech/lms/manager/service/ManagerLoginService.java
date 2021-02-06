package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.Connect;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerForm;

@Service
@Transactional
public class ManagerLoginService {
	@Autowired ManagerLoginMapper managerLoginMapper;
	@Autowired JavaMailSender mailSender;
	
	// 아이디, 패스워드 체크
	public int getManagerToNameAndEmailByCheck(String managerName, String managerEmail) {
		Manager manager = new Manager();
		
		manager.setManagerEmail(managerEmail);
		manager.setManagerName(managerName);
		
		return managerLoginMapper.selectManagerToNameAndEmailByCheck(manager);
	}
	
	// 아이디 패스워드 찾기
	public void modifyAccountToPw(Manager manager) {
		Manager returnManager = managerLoginMapper.selectManagerToNameAndEmail(manager);
		if(returnManager == null) {
			return;
		}
		
		StringBuffer accountPwBuffer = new StringBuffer();
		Random rnd = new Random();
	     for (int i = 0; i < 13; i++) {
	         int rIndex = rnd.nextInt(3);
	         switch (rIndex) {
	         case 0:
	             // a-z
	        	 accountPwBuffer.append((char) ((int) (rnd.nextInt(26)) + 97));
	             break;
	         case 1:
	             // A-Z
	        	 accountPwBuffer.append((char) ((int) (rnd.nextInt(26)) + 65));
	             break;
	         case 2:
	             // 0-9
	        	 accountPwBuffer.append((rnd.nextInt(10)));
	             break;
	         }
	     }
	     
	     String accountPw = accountPwBuffer.toString();
	     
	     try {
		     MimeMessage msg = mailSender.createMimeMessage();
		     MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
		             
		     messageHelper.setSubject("LMS - " + returnManager.getManagerName() + "님 비밀번호 찾기 메일입니다.");
		     messageHelper.setText("아이디는 "+returnManager.getManagerId()+" 입니다. \n 비밀번호는 "+accountPw+" 입니다.");
		     messageHelper.setTo(returnManager.getManagerEmail());
		     msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(returnManager.getManagerEmail()));
		     mailSender.send(msg);
	             
	     } catch(MessagingException e) {
	    	 e.printStackTrace();
	     }

		managerLoginMapper.updateAccountToPw(returnManager.getManagerId(), accountPw);
	}
	
	// 로그인 시 이미지 가져오기
	public String getManagerImage(String managerId) {
		return managerLoginMapper.selectManagerImage(managerId);
	}
	
	// 회원가입 주소 찾기 service
	public Map<String, Object> getAddressToSearch(String doro){
		Map<String, Object> map = new HashMap<String, Object>();
		
		//List<Address> addressList = managerLoginMapper.selectAddressToSearch(doro, (currentPage-1)*limitPage, limitPage);
		List<Address> addressList = managerLoginMapper.selectAddressToSearch(doro);
		
		/*
		int limitPage = 10;
		int lastPage = managerLoginMapper.selectAddressToSearchCount(doro);
		if(lastPage % lastPage == 0) {
			lastPage = lastPage / limitPage;
		} else {
			lastPage = lastPage / limitPage + 1;
		}
		*/
		
		map.put("addressList", addressList);
		
		return map;
	}
	
	// 회원가입하는 사람의 이메일 중복검사 service
	public int getManagerToSignupByOverLapEmail(String managerEmail) {
		return managerLoginMapper.selectManagerToSignupByOverLapEmail(managerEmail);
	}
	
	// 회원가입하는 사람의 아이디 중복검사 service
	public int getAccountToSignupByOverlapId(String accountId) {
		return managerLoginMapper.selectAccountToSignupByOverlapId(accountId);
	}
	
	// 로그인 액션
	public String getAccountToManagerLogin(Account account) {
		Connect connect = new Connect();
		connect.setAccountId(account.getAccountId());
		connect.setConnectState("접속");
		if(managerLoginMapper.selectConnectByOverlapLogin(connect) == 0) {
			// 회원 리스트에 존재하지만 휴면상태인 회원 구분
			if(managerLoginMapper.selectAccountStateCk(account.getAccountId()) != null) {
				if(managerLoginMapper.selectAccountStateCk(account.getAccountId()).equals("휴면상태")) {
					//System.out.println("휴면상태");
					account.setAccountLevel("운영자");
					account.setAccountState("휴면상태");
					
					return managerLoginMapper.selectAccountToManagerLogin(account);
				}
			}
			account.setAccountLevel("운영자");
			account.setAccountState("활성화");
			
			return managerLoginMapper.selectAccountToManagerLogin(account);
		}
		return "중복";
	}
	
	// 회원가입하는 mapper2개를 가져와 manager_queue와 level 순서로 insert실행
	public void addSignup(ManagerForm managerForm) {
		managerForm.setAccountLevel("운영자");
		managerForm.setAccountState("대기");
		
		managerForm.setManagerPhone(managerForm.getManagerPhone1()+managerForm.getManagerPhone2()+managerForm.getManagerPhone3());
			
		managerLoginMapper.insertManagerQueueToSignup(managerForm);
		managerLoginMapper.insertAccountToSignup(managerForm);
	}
	
	// 휴면상태일 경우 휴면해제 인증 폼으로 이동하기 위한 조건
	public String getAccountStateCk(String accountId) {
		return managerLoginMapper.selectAccountStateCk(accountId);
	}
	
	// 휴면계정 인증번호 보내기
	public String getDormantMsg(String managerId) {
		String managerEmail = managerLoginMapper.selectManagerEmail(managerId);
		
		//메세지 보낼 값을 담을 변수
		String dormantMsg = "";
		Random rnd = new Random();
		//4자리의 인증메일
	     for (int i = 0; i < 4; i++) {
	    	 //0~9까지 랜덤 숫자
	         String ran = Integer.toString(rnd.nextInt(10));
	         dormantMsg += ran;
	     }
		     
	     try {
		     MimeMessage msg = mailSender.createMimeMessage();
		     MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
		             
		     messageHelper.setSubject("LMS - 휴면계정 인증 번호입니다.");
		     messageHelper.setText("인증번호는 "+dormantMsg+" 입니다. \n");
		     messageHelper.setTo(managerEmail);
		     msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(managerEmail));
		     mailSender.send(msg);
	             
	     } catch(MessagingException e) {
	    	 e.printStackTrace();	     
	     }
	     return dormantMsg;
	}
	
	// 휴면계정 인증 성공 시 활성화 상태로 업데이트
	public int modifyChangeActivity(String managerId) {
		return managerLoginMapper.updateChangeActivity(managerId);
	}
}
