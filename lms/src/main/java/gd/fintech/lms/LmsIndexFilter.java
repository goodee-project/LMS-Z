package gd.fintech.lms;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/","/teacherLogin", "/teacherSignup", "/studentLogin", "/studentSignup", "/managerLogin", "/managerSignup", "/adminLogin", "/adminSignup", "/managerLoginSearch","/teacherLoginSearch", "/studentLoginSearch"})
public class LmsIndexFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		String cPath = ((HttpServletRequest) request).getContextPath();
		if(session.getAttribute("teacherId") != null) {
			((HttpServletResponse)response).sendRedirect(cPath + "/teacher");
			return;
		} 
		if(session.getAttribute("studentId") != null) {
			((HttpServletResponse)response).sendRedirect(cPath + "/student");
			return;
		} 
		if(session.getAttribute("managerId") != null) {
			((HttpServletResponse)response).sendRedirect(cPath + "/manager");
			return;
		} 
		if(session.getAttribute("adminId") != null) {
			((HttpServletResponse)response).sendRedirect(cPath + "/admin");
			return;
		} 
		
		chain.doFilter(request, response);
	}

}

