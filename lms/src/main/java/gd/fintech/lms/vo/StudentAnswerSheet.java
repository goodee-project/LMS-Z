package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class StudentAnswerSheet {
	private String studentId;
	private String studentName;
	private String studentGender;
	private String submissionStatus;
	private int multiplechoiceId;
	private String multiplechoiceQuestion;
	private int multiplechoiceAnswer;
	private int answerSelect;
	private int score;
}
