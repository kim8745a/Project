package com.terrier.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.terrier.domain.Employee_VO;
import com.terrier.domain.G_Owner_VO;
import com.terrier.domain.G_mgt_log_VO;
import com.terrier.domain.GroupList_VO;
import com.terrier.domain.User_VO;
import com.terrier.service.G_mgt_Service;

//그룹관리 view컨트롤 전용
@Controller
@RequestMapping("terrier/*")
public class Group_Controller {
	@Inject
	G_mgt_Service g_mgt_service;
	
	@RequestMapping(value="group_management/g_mgt",method=RequestMethod.GET) //그룹관리-그룹관리 
	public void g_mgtGET(Model model,HttpServletRequest request) throws Exception
	{
		// 스프링 시큐리티 사용으로 HttpSession -> request.getSession으로 변경.
		String id = request.getSession().getAttribute("id").toString();//접속한사람의 ID가 오너id가 저장될것.
		List<GroupList_VO> grouplist_vo;
		grouplist_vo = g_mgt_service.group_list(id);
		model.addAttribute("list", grouplist_vo);
		
		List<G_mgt_log_VO> log=g_mgt_service.group_log_list(id);//오너아이디줘서 로그기록출력
		model.addAttribute("log",log);
	}
	
	@RequestMapping(value="group_management/emp_list",method=RequestMethod.GET)//그룹관리->해당 그룹클릭시 리스트 나오게하는 기능
	public void emp_list(G_Owner_VO vo,Model model) throws Exception
	{
		System.out.println("emp_list가움직인다..");
		System.out.println(vo);
		model.addAttribute("list",g_mgt_service.emp_list(vo));
	}
	
	
	
	@RequestMapping(value="group_management/g_Create",method=RequestMethod.GET)
	public void g_Create(Model model, HttpServletRequest request) throws Exception
	{
		// 스프링 시큐리티 사용으로 HttpSession -> request.getSession으로 변경.
		String id = request.getSession().getAttribute("id").toString();
		List<GroupList_VO> grouplist_vo;
		grouplist_vo = g_mgt_service.group_list(id);
		model.addAttribute("list", grouplist_vo);
	}
	
	@RequestMapping("group_management/all_emp")
	public String group_all_emp(G_Owner_VO vo,Model model) throws Exception//그룹관리->그룹관리->그룹에 해당되지않는 사원들만 리스트보여주기
	{
		System.out.println("test123");
		model.addAttribute("all_list",g_mgt_service.all_emp_list(vo));
		return "terrier/group_management/g_EmpList_All";
	}
	
	@RequestMapping("group_management/all_emp_empty")
	public String group_all_emp_empty(G_Owner_VO vo,Model model) throws Exception//그룹에 포함되지않는 인원뽑기
	{
		List<Employee_VO> list;
		list = g_mgt_service.all_emp_list(vo);
		model.addAttribute("all_list",list);
		return "terrier/group_management/g_EmpList_A_empty"; //g_Create.jsp->$("#all_emp")에 넣을jsp를 리턴
	}
	
	@RequestMapping("group_management/in_group_emp")
	public String group_in_group_emp(G_Owner_VO vo,Model model) throws Exception//그룹에 포함되어있는 인원뽑기
	{
		List<Employee_VO> list;
		list = g_mgt_service.emp_list(vo);
		model.addAttribute("group_list",list);
		return "terrier/group_management/g_EmpList_InGroup";//g_Create.jsp->$("#in_group_emp")에 넣을jsp를 리턴
	}
	
	@RequestMapping("group_management/in_group_emp_empty")
	public String group_in_group_emp_empty() throws Exception
	{
		return "terrier/group_management/g_EmpList_G_empty";
	}
	
}
