package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LectureNotice {
	private int lectureNoticeNo;
	private int lectureNo;
	private String lectureNoticeTitle;
	private String lectureNoticeContent;
	private String lectureNoticeCreatedate;
	private String lectureNoticeUpdatedate;
	private int lectureNoticeCount;
}
