package gd.fintech.lms;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(urlPatterns = "/manager/*")
public class ManagerLoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("manager login filter 실행.....");
		HttpSession session = ((HttpServletRequest)request).getSession();
		if(session.getAttribute("managerId") == null) {
			// ((HttpServletRequest) request).getContextPath() => /LMS-Z 절대 경로 주소 가져오기
			String cPath = ((HttpServletRequest) request).getContextPath();
			((HttpServletResponse)response).sendRedirect(cPath + "/managerLogin#");
			return;
		}
		chain.doFilter(request, response);
	}
}