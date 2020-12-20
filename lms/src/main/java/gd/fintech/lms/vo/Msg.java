package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Msg {
	private String fromId; // 보낸 사람 아이디
	private String toId; // 받는 사람 아이디
	private String fromName; // 보낸 사람 이름
	private String msgContent; // 쪽지 내용
	private String msgSendDatetime; // 쪽지 보낸 시간
	private boolean isConfirm; // 쪽지 확인했는지 안했는지 체크
	
	// lombok은 setter,getter를 자동으로 생성해주는 라이브러리이다.
	// int,String 변수를 getInt, getString으로 setter,getter메서드 이름으로 만들지만
	// boolean은 is+변수 형식으로 'is'를 get처럼 사용하는데
	// 위에 boolean isConfirm형식에 is가 붙어있어 isConfirm()메서드가 생성되어
	// 맵핑하는 과정에서 찾지 못하고 에러가 발생
	// 해결방안
	public boolean getIsConfirm() {
		return isConfirm;
	}
}
