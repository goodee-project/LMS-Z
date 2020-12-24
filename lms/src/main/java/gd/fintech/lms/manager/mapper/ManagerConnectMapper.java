package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Connect;

@Mapper
public interface ManagerConnectMapper {
	// 로그인 시 발생
	int insertConnect(Connect connect);
	int updateConnectToIn(Connect connect);
	int selectConnectToCheck(String accountId);
	
	// 로그아웃 시 발생
	int updateConnectToOut(Connect connect);
	
	// 방문자 수 불러 올때 사용
	List<Map<String, Object>> selectConnect(String connectState);
}
