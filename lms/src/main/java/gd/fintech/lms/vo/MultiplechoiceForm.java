package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;
@Data
public class MultiplechoiceForm {
	private int multiplechoiceNo;
	private int lectureNo;
	private int multiplechoiceId;
	private String multiplechoiceQuestion;
	private String multiplechoiceAnswer;
	private String multiplechoiceCreatedate;
	private String multiplechoiceUpdatedate;
	private int multiplechoiceExampleNo;
	private String multiplechoiceExampleId;
	private String multiplechoiceExampleContent;
	private String multiplechoiceExampleCreatedate;
	private String multiplechoiceExampleUpdatedate;
	private List<MultiplechoiceExample> multiplechoiceExampleList;
}
