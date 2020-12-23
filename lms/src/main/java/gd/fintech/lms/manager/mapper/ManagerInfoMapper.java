package gd.fintech.lms.manager.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;

@Mapper
public interface ManagerInfoMapper {
	Manager selectManagerInfo(String managerId);
	
	// 패스워드 변경
	int updateAccountPw(Account account);
	
	// 패스워드 변경 시 현재 패스워드 확인
	int selectAccountByPw(String accountId, String accountPw);
	
	// 마이 페이지 정보 수정
	int updateManagerByName(String managerId, String managerName);
	int updateManagerByEmail(String managerId, String managerEmail);
	int updateManagerByGender(String managerId, String managerGender);
	int updateManagerByBirth(String managerId, String managerBirth);
	int updateManagerByImage(String managerId, String managerImage);
	int updateManagerByPhone(String managerId, String managerPhone);
	int updateManagerByAddress(Manager manager);
	
	// 마이 페이지 이메일 중복 검사
	int selectManagerAndManagerQueueByOverlapEmail(String managerEmail);
	
	// 프로젝트에서 이미지 삭제
	String selectManagerByImageTodelete(String managerId);
	
	// 회원탈퇴
	int updateAccountTodelete(Account account);
	int deleteManager(String managerId);
	
	// 주소변경 사이트 주소 가져오기
	Manager selectManagerByAddress(String managerId);
}
