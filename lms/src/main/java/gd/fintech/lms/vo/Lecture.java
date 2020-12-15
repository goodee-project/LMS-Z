package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Lecture {
	private int lectureNo;
	private String accountId;
	private int subjectNo;
	private String teacherName;
	private String lectureName;
	private int textbookIsbn;
	private String lectureStartdate;
	private String lectureEnddate;
	private int lectureTotal;
	private int syllabusNo;
	private int classroomNo;
	private String lectureCreatedate;
	private String lectureUpdatedate;
}
