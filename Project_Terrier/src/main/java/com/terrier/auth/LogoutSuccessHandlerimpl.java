package com.terrier.auth;

import java.io.IOException;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AbstractAuthenticationTargetUrlRequestHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.terrier.domain.Audit_VO;
import com.terrier.service.Audit_Service;

public class LogoutSuccessHandlerimpl extends AbstractAuthenticationTargetUrlRequestHandler
			implements LogoutSuccessHandler{

	private String defaultUrl;
	
	@Inject
	Audit_Service service;
	
	public String getDefaultUrl() {
		return defaultUrl;
	}


	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}


	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		if(authentication != null) { // ���ǿ� ������ ���� ��� (�ð� ������ ���)
			// ���� �ڵ�
			Audit_VO audit = new Audit_VO();
			audit.setAdmin_Id(authentication.getName());
			audit.setIpaddress(request.getRemoteAddr());
			audit.setBehavior("�α׾ƿ� ����");
			
			try {
				service.audit_insert(audit);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			super.handle(request, response, authentication);
		} else {
			response.sendRedirect(defaultUrl);
		}
		
	}

}