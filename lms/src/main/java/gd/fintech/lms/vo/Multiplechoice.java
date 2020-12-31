package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class Multiplechoice {
	private int multiplechoiceNo;
	private int lectureNo;
	private int multiplechoiceId;
	private String multiplechoiceQuestion;
	private String multiplechoiceAnswer;
	private int multiplechoiceScore;
	private String multiplechoiceCreatedate;
	private String multiplechoiceUpdatedate;
	private List<MultiplechoiceExample> multiplechoiceExampleList;
}
