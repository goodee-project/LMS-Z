package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LectureArchiveFile {
	private String lectureArchiveFileUuid;
	private String lectureArchiveFileOriginal;
	private int lectureArchiveNo;
	private long lectureArchiveFileSize;
	private String lectureArchiveFileType;
	private int lectureArchiveFileCount;
	private String lectureArchiveFileCreatedate;
}
