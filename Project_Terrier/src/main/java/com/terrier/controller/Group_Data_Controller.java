package com.terrier.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.terrier.domain.G_Owner_VO;
import com.terrier.domain.Group_VO;
import com.terrier.domain.User_VO;
import com.terrier.service.G_mgt_Service;

//그룹관리 Data컨트롤전용
@RestController
@RequestMapping("terrier/*")
public class Group_Data_Controller {
	@Inject
	G_mgt_Service g_mgt_service;
	
	@RequestMapping("group_management/group_Check")
	public String group_Duplicate_check(@RequestParam String group_name,HttpServletRequest request) throws Exception
	{
		// 스프링 시큐리티 사용으로 HttpSession -> request.getSession으로 변경.
		String id = request.getSession().getAttribute("id").toString();
		G_Owner_VO vo = new G_Owner_VO();
		vo.setGroup_name(group_name);
		vo.setId(id);		
		return String.valueOf(g_mgt_service.group_check(vo));
	}
	@RequestMapping("group_management/group_Delete")
	public void	group_Delete(@RequestParam String group_name,HttpServletRequest request) throws Exception
	{
		// 스프링 시큐리티 사용으로 HttpSession -> request.getSession으로 변경.
		String id = request.getSession().getAttribute("id").toString();
		
		G_Owner_VO vo = new G_Owner_VO();
		vo.setGroup_name(group_name);
		vo.setId(id);
		
		g_mgt_service.group_delete(vo);
	}	
	@RequestMapping(value="group_management/g_Update",method=RequestMethod.POST)//g_Create에서 배열로 보낼 예정
	public void g_CreatListPOST(@RequestParam(value="g_emp_list[]")String[] emp,@RequestParam(value="g_name")String g_name,HttpServletRequest request,Model model)throws Exception
	{	
		List<Group_VO> group =new ArrayList<Group_VO>();
        int size=emp.length;//그룹팝업에서 선택한 사원수
        // 스프링 시큐리티 사용으로 HttpSession -> request.getSession으로 변경.
     	String id = request.getSession().getAttribute("id").toString();

        for(int i=0;i<size;i++)
        {
        	Group_VO gvo=new Group_VO();
        	gvo.setEmployee_num(emp[i]);//사원번호
        	gvo.setGroup_name(g_name);//그룹명
        	gvo.setGroup_owner(id);//오너아이디
        	group.add(gvo);
        }     
        G_Owner_VO owner_vo = new G_Owner_VO();
        owner_vo.setGroup_name(g_name);
        owner_vo.setId(id);		
		g_mgt_service.group_delete(owner_vo);	
        g_mgt_service.group_update(group);
        
	}
	
}
