package com.terrier.auth;

import java.io.IOException;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;

import com.terrier.domain.Audit_VO;
import com.terrier.service.Audit_Service;


public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	private RequestCache requestCache = new HttpSessionRequestCache();  // HttpSession의 요청 Cache 값을 저장
	private String targetUrlParameter;	// 타겟 Url의 파라미터값
	private String defaultUrl;	// 기본 Url
	private boolean useReferer;  // getHeader("Referer") 를 사용할 것인가
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();  // 리다이렉트 상태
	
	@Inject
	Audit_Service service;
	
	
	public String getTargetUrlParameter() {
		return targetUrlParameter;
	}

	public void setTargetUrlParameter(String targetUrlParameter) {
		this.targetUrlParameter = targetUrlParameter;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	public boolean isUseReferer() {
		return useReferer;
	}

	public void setUseReferer(boolean useReferer) {
		this.useReferer = useReferer;
	}
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		clearAttributeSession(request);
		
		// 세션에 어드민 아이디 저장
		request.getSession().setAttribute("id", auth.getName());
		
		// 감사 코드
		Audit_VO audit = new Audit_VO();
		audit.setAdmin_Id(auth.getName());
		audit.setIpaddress(request.getRemoteAddr());
		audit.setBehavior("로그인 성공");
		
		try {
			service.audit_insert(audit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(requestCache.getRequest(request, response) != null) 
			response.sendRedirect(requestCache.getRequest(request, response).getRedirectUrl());
		else	// login으로 바로 접근하는 경우
			response.sendRedirect(defaultUrl); // 기본 Url로 			
	}
	
	private void clearAttributeSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session != null) { // 로그인 성공하기 직전 세션에 정보가 있을 경우
			if(session.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION) != null) // 세션에 로그인 실패 정보가 있을 경우 삭제한다.
				session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		
	}

}
