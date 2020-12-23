package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.ManagerForm;

@Service
@Transactional
public class ManagerLoginService {
	@Autowired ManagerLoginMapper managerLoginMapper;
	
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
		
		account.setAccountLevel("운영자");
		account.setAccountState("활성화");
		
		return managerLoginMapper.selectAccountToManagerLogin(account);
	}
	
	// 회원가입하는 mapper2개를 가져와 manager_queue와 level 순서로 insert실행
	public void addSignup(ManagerForm managerForm) {
		managerForm.setAccountLevel("운영자");
		managerForm.setAccountState("대기");
		
		managerForm.setManagerPhone(managerForm.getManagerPhone1()+managerForm.getManagerPhone2()+managerForm.getManagerPhone3());
			
		managerLoginMapper.insertManagerQueueToSignup(managerForm);
		managerLoginMapper.insertAccountToSignup(managerForm);
	}
}
