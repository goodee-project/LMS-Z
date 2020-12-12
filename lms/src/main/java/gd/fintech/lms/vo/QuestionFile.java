package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class QuestionFile {
	private String questionFileUuid;
	private String questionFileOriginal;
	private int questionNo;
	private int questionFileSize;
	private String questionFileType;
	private int questionFileCount;
	private String questionFileCreatedate;
}
