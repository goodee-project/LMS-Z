package gd.fintech.lms.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminRestictMapper {
	//6개월동안 접속하지 않은 회원을 조회하기 위한 메퍼 호출
	List<String> selectUpdatedate();
	// 해당하는 회원의 상태를 휴면상태로 변경
	int updateAccountState(String accountId);
}
