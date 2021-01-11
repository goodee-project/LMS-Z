package gd.fintech.lms.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Connect;
import gd.fintech.lms.vo.ManagerQueue;

@Mapper
public interface AdminIndexMapper {
	// 운영자 승인 대기 리스트 출력
	public List<ManagerQueue> selectManagerQueue(); 
	// 승인/거부 하려는 운영자 정보 불러오기
	public ManagerQueue selectManagerQueueOne(String managerId); 
	// 운영자 승인
	public int insertManagerInformation(ManagerQueue managerQueue); 
	// 운영자 승인 후 계정 활성화
	public int updateManagerStateActivity(String managerId); 
	// 운영자 승인 거부
	public int deleteManagerQueue(String managerId);
	// 운영자 미승인 후 계정 탈퇴
	public int updateManagerStateSecession(String managerId);
	// 6개월 이상 미접속자(휴면상태) 리스트
	public List<Connect> selectDormantStateList();
	// 휴면계정 해지 => 활성화
	public int updateChangeActivation(String accountId);
}
