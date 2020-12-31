package gd.fintech.lms.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class LectureArchiveAddForm {
	private int lectureArchiveNo;
	private int lectureNo;
	private String accountId;
	private String lectureArchiveWriter;
	private String lectureArchiveTitle;
	private String lectureArchiveContent;
	private String lectureArchiveCreatedate;
	private String lectureArchiveUpdatedate;
	private int lectureArchiveCount;
	private List<MultipartFile> lectureArchiveFile;
}
