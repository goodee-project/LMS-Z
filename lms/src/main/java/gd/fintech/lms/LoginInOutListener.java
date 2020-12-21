package gd.fintech.lms;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class LoginInOutListener
 *
 */
@WebListener
public class LoginInOutListener implements HttpSessionListener {

    public LoginInOutListener() {
        // TODO Auto-generated constructor stub
    }

    public void sessionCreated(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }

    //세션이 삭제될때
  	@Override
      public void sessionDestroyed(HttpSessionEvent se)  { 
      	System.out.println("session Listener id 삭제");
      }
	
}
