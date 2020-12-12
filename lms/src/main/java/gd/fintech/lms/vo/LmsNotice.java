package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LmsNotice {
	private int lmsNoticeNo;
	private String accountId;
	private String lmsNoitceWriter;
	private String lmsNoticeTitle;
	private String lmsNoticeContent;
	private String lmsNoticeCreatedate;
	private String lmsNoticeUpdatedate;
	private String lmsNoticeCount;
}
