package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Student {
	private String studentId;
	private String studentEmail;
	private String studentName;
	private String studentPhone;
	private String studentGender;
	private String studentBirth;
	private String studentAddressMain;
	private String studentAddressSub;
	private String studentImage;
	private String studentAccessdate;
	private String studentUpdatedate;
	private String managerIdAccess;
	private Msg msg;
}
