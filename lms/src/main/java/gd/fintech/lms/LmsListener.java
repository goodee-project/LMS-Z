package gd.fintech.lms;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import gd.fintech.lms.manager.service.ManagerConnectService;

@WebListener
public class LmsListener implements HttpSessionAttributeListener {
    /**
     * Default constructor. 
     */
    public LmsListener() {
        // TODO Auto-generated constructor stub
    }
    private ManagerConnectService managerConnectService;
    public void attributeAdded(HttpSessionBindingEvent se)  { 
    	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    	 if(managerConnectService==null){
             ServletContext servletContext = request.getServletContext();
             WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
             managerConnectService = webApplicationContext.getBean(ManagerConnectService.class);
         }
         
         if(se.getName() == "managerId") {
        	 managerConnectService.modifyConnectIn((String)se.getValue());
        	 return;
         }
         if(se.getName() == "teacherId") {
        	 managerConnectService.modifyConnectIn((String)se.getValue());
        	 return;
         }
         if(se.getName() == "studentId") {
        	 managerConnectService.modifyConnectIn((String)se.getValue());
        	 return;
         }
         if(se.getName() == "adminId") {
        	 managerConnectService.modifyConnectIn((String)se.getValue());
        	 return;
         }
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
       	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
       	if(managerConnectService==null){
            ServletContext servletContext = request.getServletContext();
            WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
            managerConnectService = webApplicationContext.getBean(ManagerConnectService.class);
        }
       	
   	 	if(se.getName() == "managerId") {
   	 		managerConnectService.modifyConnectOut((String)se.getValue());
   	 		return;
   	 	}
   	 	if(se.getName() == "teacherId") {
   	 		managerConnectService.modifyConnectOut((String)se.getValue());
   	 		return;
   	 	}
   	 	if(se.getName() == "studentId") {
   	 		managerConnectService.modifyConnectOut((String)se.getValue());
   	 		return;
   	 	}
   	 	if(se.getName() == "adminId") {
   	 		managerConnectService.modifyConnectOut((String)se.getValue());
   	 		return;
   	 	}
        
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}
