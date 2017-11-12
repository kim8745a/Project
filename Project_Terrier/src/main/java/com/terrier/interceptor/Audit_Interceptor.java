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
			audit.setBehavior("계정 감사 조회");
			
			service.audit_insert(audit);
		} else if(URI.equals("/request_management/w_list")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("요청 대기 리스트 조회");
			
			service.audit_insert(audit);
		} else if(URI.equals("/request_management/w_list_search")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("요청 대기 리스트 검색");
			
			service.audit_insert(audit);
		} else if(URI.equals("/request_management/c_list")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("요청 완료 리스트 조회");
			
			service.audit_insert(audit);
		} else if(URI.equals("/request_management/c_list_search")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("요청 완료 리스트 검색");
			
			service.audit_insert(audit);
		} else if(URI.equals("/loss_management/lr_list")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("분실 요청 리스트 조회");
			
			service.audit_insert(audit);
		} else if(URI.equals("/loss_management/l_list")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("분실 처리 리스트 조회");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/g_mgt")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("그룹 관리 조회");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/g_Update")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("그룹 생성");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/d_mgt")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("단말 관리 조회");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/c_mgt")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("사원의 단말 관리 조회");
			
			service.audit_insert(audit);
		} else if(URI.equals("/device_management/d_mgt_search")){
			audit.setAdmin_Id(id);
			audit.setIpaddress(ip);
			audit.setBehavior("단말 검색");
			
			service.audit_insert(audit);
		} else {
			System.out.println(URI);
		}

		
	}
}
