package com.terrier.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.terrier.domain.User_VO;
import com.terrier.dto.User_DTO;
import com.terrier.service.User_Service;

@Controller
@RequestMapping("/user/*")

public class Login_Controller 
{
//	@Inject
//	private User_Service service;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)//그냥 처음 접속했을때
	public void loginGET()throws Exception
	{
		
	}
	
//	@RequestMapping(value="/login",method=RequestMethod.POST)//로그인버튼눌렀을때
//	public String loginPOST(User_DTO dto,Model model,RedirectAttributes rttr ,HttpSession session)throws Exception
//	{
//		User_VO vo=service.login(dto);
//		if(vo==null)
//		{
//			return "redirect:/user/login";
//		}
//		session.setAttribute("user_info", vo);
//		rttr.addFlashAttribute("msg","SUCCESS");
//		return "redirect:/terrier/main";
//	}
		
}
