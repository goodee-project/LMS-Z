package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class ReportSubmit {
	private int reportSubmitNo;
	private int reportId;
	private String accountId;
	private String reportSubmitCreatedate;
	private String reportSubmitUpdatedate;
	private String reportSubmitTitle;
	private String reportSubmitContent;
	private String reportSubmitPoint;
	private String reportSubmitFeedback;
}
