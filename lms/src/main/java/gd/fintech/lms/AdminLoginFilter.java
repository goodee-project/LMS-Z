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


@WebFilter(urlPatterns = "/admin/*")
public class AdminLoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("admin login filter 실행.....");
		HttpSession session = ((HttpServletRequest)request).getSession();
		//System.out.println("세션에 저장된 아이디"+session.getAttribute("adminId"));
		if(session.getAttribute("adminId") == null) {
			// ((HttpServletRequest) request).getContextPath() => /LMS-Z 절대 경로 주소 가져오기
			//System.out.println("adminId값 없음");
			String cPath = ((HttpServletRequest) request).getContextPath();
			((HttpServletResponse)response).sendRedirect(cPath + "/adminLogin");
			return;
		}
		chain.doFilter(request, response);
	}
}