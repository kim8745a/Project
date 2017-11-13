package com.terrier.interceptor;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.terrier.domain.Audit_VO;
import com.terrier.service.Audit_Service;

public class Audit_Interceptor extends HandlerInterceptorAdapter{
	
	@Inject
	Audit_Service service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return true;
	}
	
	@Override
	 public void postHandle(
			   HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			   throws Exception {
		
		Audit_VO audit = new Audit_VO();
		
		String id = request.getSession().getAttribute("id").toString();
		String ip = request.getRemoteAddr();
		String behavior = handler.toString();
		String URI = request.getRequestURI().replace("/terrier", "");
		
		if(URI.equals("/account_management/audit_list")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("���� ���� ��ȸ");
			
			service.audit_insert(audit);
		} else if(URI.equals("/request_management/w_list")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("��û ��� ����Ʈ ��ȸ");
			
			service.audit_insert(audit);
		} else if(URI.equals("/request_management/w_list_search")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("��û ��� ����Ʈ �˻�");
			
			service.audit_insert(audit);
		} else if(URI.equals("/request_management/c_list")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("��û �Ϸ� ����Ʈ ��ȸ");
			
			service.audit_insert(audit);
		} else if(URI.equals("/request_management/c_list_search")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("��û �Ϸ� ����Ʈ �˻�");
			
			service.audit_insert(audit);
		} else if(URI.equals("/loss_management/lr_list")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("�н� ��û ����Ʈ ��ȸ");
			
			service.audit_insert(audit);
		} else if(URI.equals("/loss_management/l_list")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("�н� ó�� ����Ʈ ��ȸ");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/g_mgt")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("�׷� ���� ��ȸ");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/g_Update")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("�׷� ����");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/d_mgt")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("�ܸ� ���� ��ȸ");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/c_mgt")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("����� �ܸ� ���� ��ȸ");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/d_mgt_search")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("�ܸ� �˻�");
			
			service.audit_insert(audit);
		} else {
			System.out.println(URI);
		}

		
	}
}
