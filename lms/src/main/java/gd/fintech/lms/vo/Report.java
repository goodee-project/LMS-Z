package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class Report {
	private int reportNo;
	private int lectureNo;
	private String reportTitle;
	private String reportContent;
	private String reportCreatedate;
	private String reportUpdatedate;
	private String reportStartdate;
	private String reportEnddate;
	private List<ClassRegistration> classRegistrationList;
}
