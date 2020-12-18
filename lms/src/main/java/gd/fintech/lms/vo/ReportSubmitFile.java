package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class ReportSubmitFile {
	private String reportSubmitFileUuid;
	private String reportSubmitFileOriginal;
	private int reportSubmitNo;
	private long reportSubmitFileSize;
	private String reportSubmitFileType;
	private int reportSubmitFileCount;
	private String reportSubmitFileCreatedate;
}
