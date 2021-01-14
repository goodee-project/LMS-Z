package gd.fintech.lms;

import java.io.File;

public class Path {
	private static String OS = System.getProperty("os.name").toLowerCase();
	
    public static String PATH() { 
    	// 운영체제가 리눅스일 경우
        if ( OS.indexOf("nux") >= 0) {
        	return "/home/ubuntu/tomcat9/webapps/lms/";
        // 운영체제가 윈도우일 경우
        } else {
            File file = new File("");
        	return file.getAbsolutePath() + "\\src\\main\\webapp\\";
        }
    }
}
