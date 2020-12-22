package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class Question {
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
	private List<QuestionComment> questionCommentList;
	private List<QuestionFile> questionfile;
	private Lecture lecture;
}
