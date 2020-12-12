package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class QuestionComment {
	private int questionCommentNo;
	private int questionNo;
	private String accountId;
	private String questionCommentWriter;
	private String questionCommentContent;
	private String questionCommentCreatedate;
	private String questionCommentUpdatedate;
}
