package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JacksonInject;

import gd.fintech.lms.manager.mapper.ManagerConnectMapper;
import gd.fintech.lms.vo.Connect;

@Service
@Transactional
public class ManagerConnectService {
	@Autowired ManagerConnectMapper managerConnectMapper;
	
	// List안에 map형식으로 connect테이블의 값들을 controller에 전달
	public List<Map<String, Object>> getConnect() {
		return managerConnectMapper.selectConnect("접속");
	}
	
	// 세션이 없어 질 때 connect 데이터배이스의 state 조절
	public void modifyConnectOut(String accountId) {
		Connect connect = new Connect();
		connect.setAccountId(accountId);
		connect.setConnectState("미접속");
		
		managerConnectMapper.updateConnectToOut(connect);
	}
	
	// 세션이 생길 때 만약 id가 있는 데이터라면 업데이트 없으면 추가 하는 service
	public void modifyConnectIn(String accountId) {
		int check = managerConnectMapper.selectConnectToCheck(accountId);
		
		Connect connect = new Connect();
		connect.setAccountId(accountId);
		connect.setConnectState("접속");
		
		if(check == 0) {
			managerConnectMapper.insertConnect(connect);
		} else {
			managerConnectMapper.updateConnectToIn(connect);
		}
	}
}
