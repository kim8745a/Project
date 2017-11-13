package com.terrier.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.terrier.domain.Criteria;
import com.terrier.domain.Employee_VO;
import com.terrier.domain.L_mgt_lr_list_VO;
import com.terrier.domain.PageMaker;
import com.terrier.service.D_mgt_Service;
import com.terrier.service.L_mgt_Service;

@Controller
@RequestMapping("terrier/*")
public class Loss_Controller {
	
	@Inject
	D_mgt_Service d_mgt_service;
	
	@Inject
	L_mgt_Service l_mgt_service;
	
	@RequestMapping(value="loss_management/l_list",method=RequestMethod.GET)
	public void l_list(Model model) throws Exception {
		model.addAttribute("list",d_mgt_service.emp_list());
	}
	
	@RequestMapping(value="loss_management/l_list_search",method=RequestMethod.GET)
	public String l_list_search(Employee_VO vo,Model model) throws Exception
	{
		//vo에는 선택된 값들이 모두 바인딩될것임.
		model.addAttribute("vo",vo);
		List<Employee_VO> list; 
		list=d_mgt_service.emp_search_list(vo);
		model.addAttribute("list",list);
		return "terrier/loss_management/l_list";
	}
	
	@RequestMapping(value="loss_management/lf_list",method=RequestMethod.GET)
	public void lf_list(Model model) throws Exception {
		model.addAttribute("list",l_mgt_service.emp_list());
	}
	
	@RequestMapping(value="loss_management/lf_list_search",method=RequestMethod.GET)
	public String lf_list_search(Employee_VO vo, Model model) throws Exception {
		//vo에는 선택된 값들이 모두 바인딩될것임.
		model.addAttribute("vo",vo);
		List<Employee_VO> list; 
		list=l_mgt_service.emp_search_list(vo);
		model.addAttribute("list",list);
		return "terrier/loss_management/lf_list";
	}

	@RequestMapping(value="loss_management/lr_list",method=RequestMethod.GET)
	public void lr_list(@ModelAttribute("cri")Criteria cri, Model model) throws Exception {
		model.addAttribute("list",l_mgt_service.l_request_list(cri));
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(l_mgt_service.l_request_count());
		model.addAttribute("pageMaker",pageMaker);
	}
	
	@RequestMapping(value="loss_management/lr_list_search",method=RequestMethod.GET)
	public String lr_list_search(@ModelAttribute("cri")Criteria cri, L_mgt_lr_list_VO vo, Model model) throws Exception {
		//vo에는 선택된 값들이 모두 바인딩될것임.
		System.out.println(cri.getPage());
		
		model.addAttribute("vo",vo);
		model.addAttribute("list",l_mgt_service.l_request_list_search(cri, vo));
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("여기까진 않와4");
		pageMaker.setTotalCount(l_mgt_service.l_request_search_count(cri, vo));
		System.out.println("여기까진 않와5");
		model.addAttribute("pageMaker",pageMaker);
		return "terrier/loss_management/lr_list";
	}
}