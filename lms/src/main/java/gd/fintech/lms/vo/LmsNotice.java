package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LmsNotice {
	private int lmsNoticeNo; // lms공지사항 번호 
	private String accountId; // 작성자 id
	private String lmsNoticeWriter; // 작성자 닉네임? 이름?
	private String lmsNoticeTitle; // 공지사항 제목
	private String lmsNoticeContent; // 공지사항 상세내용 
	private String lmsNoticeCreatedate; // 작성일
	private String lmsNoticeUpdatedate; // 공지사항 수정일
	private int lmsNoticeCount; // 조회수 
}