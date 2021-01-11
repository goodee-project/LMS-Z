package gd.fintech.lms.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.admin.mapper.AdminRestictMapper;

@Service
@Transactional
public class AdminRestictService {
	@Autowired AdminRestictMapper adminRestictMapper;
	//6개월 이상 접속안한 id 리스트 저장, account 상태를 변경하는 서비스
	public void RestictAccount() {
		List<String> resticList = adminRestictMapper.selectUpdatedate();
		System.out.println(resticList);
		for(String r : resticList) {
			adminRestictMapper.updateAccountState(r);
		}
	}
	
}
