package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Lecture {
	private int lectureNo;
	private String accountId;
	private int subjectNo;
	private String teacherName;
	private String lectureName;
	private String textbookIsbn;
	private String lectureStartdate;
	private String lectureEnddate;
	private int lectureTotal;
	private int syllabusNo;
	private int classroomNo;
	private String lectureCreatedate;
	private String lectureUpdatedate;
	private Account account;
	private Classroom classroom;
	private Teacher teacher;
	private Subject subject;
	private Syllabus syllabus;
	private Textbook textbook;
	private String lectureImage;
	private String lectureImageColor;
}
