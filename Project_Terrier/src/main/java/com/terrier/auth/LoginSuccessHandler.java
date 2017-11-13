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
	
	private RequestCache requestCache = new HttpSessionRequestCache();  // HttpSession�� ��û Cache ���� ����
	private String targetUrlParameter;	// Ÿ�� Url�� �Ķ���Ͱ�
	private String defaultUrl;	// �⺻ Url
	private boolean useReferer;  // getHeader("Referer") �� ����� ���ΰ�
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();  // �����̷�Ʈ ����
	
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
		
		// ���ǿ� ���� ���̵� ����
		request.getSession().setAttribute("id", auth.getName());
		
		// ���� �ڵ�
		Audit_VO audit = new Audit_VO();
		audit.setAdmin_Id(auth.getName());
		audit.setIpaddress(request.getRemoteAddr());
		audit.setBehavior("�α��� ����");
		
		try {
			service.audit_insert(audit);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(requestCache.getRequest(request, response) != null) 
			response.sendRedirect(requestCache.getRequest(request, response).getRedirectUrl());
		else	// login���� �ٷ� �����ϴ� ���
			response.sendRedirect(defaultUrl); // �⺻ Url�� 			
	}
	
	private void clearAttributeSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session != null) { // �α��� �����ϱ� ���� ���ǿ� ������ ���� ���
			if(session.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION) != null) // ���ǿ� �α��� ���� ������ ���� ��� �����Ѵ�.
				session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		
	}

}
