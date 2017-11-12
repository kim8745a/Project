package com.terrier.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("terrier/*")
public class Main_Controller 
{
	
//	@RequestMapping("logout")//main->로그아웃 눌렀을때
//	public String logout(HttpSession session,RedirectAttributes rttr)
//	{
//		session.invalidate();// 세션
//		rttr.addFlashAttribute("msg","logout");
//		return "redirect:/user/login";
//	}

	@RequestMapping("main")//로그인 ->main
	public void main(Model model)
	{
		System.out.println("메인 페이지 접속");
	}

}
