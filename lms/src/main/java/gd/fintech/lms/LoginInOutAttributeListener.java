package gd.fintech.lms;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;


@WebListener
public class LoginInOutAttributeListener implements HttpSessionAttributeListener {
	public LoginInOutAttributeListener() {
	}
	
	//세션 객체에 setAttribute()를 통해 새로운 객체가 등록되었을 때
	
	public void attributeAdded(HttpSessionBindingEvent sbe, ServletResponse response , ServletRequest request) throws IOException,ServletException{
		System.out.println("session 이름 : "+sbe.getName());
		System.out.println("session 값 : "+sbe.getValue());
		if(sbe.getValue()!=null) {
			System.out.println("listenerAttribute 진입");
			((HttpServletResponse)response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/admin/index");
		}
	}
	
}
