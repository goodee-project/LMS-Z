package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Manager {
	private String managerId; // int => String
	private String managerEmail;
	private String managerPhone;
	private String managerName;
	private String managerGender;
	private String managerBirth;
	private String managerPosition;
	private String managerAddressMain;
	private String managerAddressSub;
	private String managerImage;
	private String managerAccessdate;
	private String managerUpdatedate;
}
