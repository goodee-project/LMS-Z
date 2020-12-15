package gd.fintech.lms.vo;

import lombok.Data;

// 2개의 테이블  에 insert를 위한 vo
@Data
public class ManagerForm {
	private String managerId; 
	private String managerPw;
	private String managerEmail;
	private String managerPhone;
	private String managerName;
	private String managerGender;
	private String managerBirth;
	private String managerPosition;
	private String managerAddressMain;
	private String managerAddressSub;
    private String accountState;
    private int accountLevel;
}