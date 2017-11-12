package com.terrier.auth;

import java.io.IOException;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.terrier.domain.Audit_VO;
import com.terrier.service.Audit_Service;

public class LoginFailureHandler implements AuthenticationFailureHandler{

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Inject
	Audit_Service service;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {
		
		request.getSession().setAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, exception);
		
		Audit_VO audit = new Audit_VO();
		audit.setAdmin_Id(request.getParameter("id"));
		audit.setIpaddress(request.getRemoteAddr());
		audit.setBehavior("로그인 실패");
		
		try {
			service.audit_insert(audit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		redirectStrategy.sendRedirect(request, response, "/user/login");
	}
	
}
