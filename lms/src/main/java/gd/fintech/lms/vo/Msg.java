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
}
