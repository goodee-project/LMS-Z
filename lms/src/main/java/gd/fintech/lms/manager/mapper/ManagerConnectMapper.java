package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Connect;
import gd.fintech.lms.vo.ConnectCount;

@Mapper
public interface ManagerConnectMapper {
	// 로그인 시 발생
	int insertConnect(Connect connect);
	int updateConnectToIn(Connect connect);
	Connect selectConnectToCheck(String accountId);
	int insertConnectCount(ConnectCount connectCount);
	int updateConnectCount(ConnectCount connectCount);
	int selectConnectCountToCheck(ConnectCount connectCount);
	
	// 로그아웃 시 발생
	int updateConnectToOut(Connect connect);
	
	// 방문자 수 불러 올때 사용
	List<Map<String, Object>> selectConnect(String connectState);
	
	// 해당 아이디의 오늘 방문자 수 출력
	int selectConnectCountToNo(String accountId);
}
