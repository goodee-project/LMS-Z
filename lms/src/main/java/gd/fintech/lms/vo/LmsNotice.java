package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LmsNotice {
	
	//lms공지사항 번호 
	private int lmsNoticeNo; 
	
	//작성자 id
	private String accountId; 
	
	//작성자 닉네임? 이름?
	private String lmsNoticeWriter; 
	
	//공지사항 제목
	private String lmsNoticeTitle; 
	
	//공지사항 상세내용
	private String lmsNoticeContent;  
	
	//작성일
	private String lmsNoticeCreatedate; 
	
	//공지사항 수정일
	private String lmsNoticeUpdatedate; 
	
	//조회수
	private int lmsNoticeCount;  
}