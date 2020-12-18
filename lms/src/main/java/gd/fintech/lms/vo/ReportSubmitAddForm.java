package gd.fintech.lms.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReportSubmitAddForm {
	private int reportSubmitNo;
	private int reportNo;
	private String accountId;
	private String reportSubmitWriter;
	private String reportSubmitCreatedate;
	private String reportSubmitUpdatedate;
	private String reportSubmitTitle;
	private String reportSubmitContent;
	private List<MultipartFile> reportSubmitFile;
}
