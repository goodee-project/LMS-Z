package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class LoginLogo {
	private int loginLogoId;
	private String loginId;		  // 체크할 아이디
	private String loginDatetime; // 로그인 체크
	private String logoutDatetime;//로그아웃 체크

}
