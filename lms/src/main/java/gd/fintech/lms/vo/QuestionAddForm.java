package gd.fintech.lms.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QuestionAddForm {
	private int questionNo;
	private int lectureNo;
	private String accountId;
	private String questionWriter;
	private String questionTitle;
	private String questionContent;
	private String questionCreatedate;
	private String questionUpdatedate;
	private int questionCount;
	private String questionPassword;
	private List<MultipartFile> questionFile;
}
