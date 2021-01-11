package gd.fintech.lms.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.admin.mapper.AdminIndexMapper;
import gd.fintech.lms.vo.Connect;
import gd.fintech.lms.vo.ManagerQueue;

@Transactional
@Service
public class AdminIndexService {
	@Autowired AdminIndexMapper adminIndexMapper;
	
	// 운영자 승인 대기 리스트 출력
	public List<ManagerQueue> getManagerQueueList(){
		return adminIndexMapper.selectManagerQueue();
	}
	// 승인/거부 하려는 운영자 정보 불러오기
	public ManagerQueue getManagerQueueOne(String managerId) {
		return adminIndexMapper.selectManagerQueueOne(managerId);
	}
	// 운영자 승인
	public int addManagerInformation(ManagerQueue managerQueue) {
		return adminIndexMapper.insertManagerInformation(managerQueue);
	}
	// 운영자 승인 후 계정 활성화
	public int modifyManagerStateActivity(String managerId) {
		return adminIndexMapper.updateManagerStateActivity(managerId);
	}
	// 운영자 승인 거부
	public int removeManagerQueue(String managerId) {
		return adminIndexMapper.deleteManagerQueue(managerId);
	}
	// 운영자 미승인 후 계정 탈퇴
	public int modifyManagerStateSecession(String managerId) {
		return adminIndexMapper.updateManagerStateSecession(managerId);
	}
	// 6개월 이상 미접속자(휴면상태) 리스트
	public List<Connect> getDormantStateList(){
		return adminIndexMapper.selectDormantStateList();
	}
	// 휴면계정을 활성화로 변경
	public int modifyChangeActivation(String accountId) {
		return adminIndexMapper.updateChangeActivation(accountId);
	}
}
