package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LectureArchive {
	private int lectureArchiveNo;
	private int lectureNo;
	private String accountId;
	private String lectureArchiveWriter;
	private String lectureArchiveTitle;
	private String lectureArchiveContent;
	private String lectureArchiveCreatedate;
	private String lectureArchiveUpdatedate;
	private int lectureArchiveCount;
}
