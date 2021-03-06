package gd.fintech.lms;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@ServletComponentScan // 필터 기능을 구현하기 위해 필요한 어노테이션
@SpringBootApplication
@EnableScheduling // 스케줄러를 활성화하기 위해 필요한 어노테이션
public class LmsApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(LmsApplication.class, args);
	}

}
