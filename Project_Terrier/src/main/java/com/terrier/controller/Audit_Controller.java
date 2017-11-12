package com.terrier.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.terrier.domain.Audit_VO;
import com.terrier.domain.Criteria;
import com.terrier.domain.PageMaker;
import com.terrier.service.Audit_Service;

// 계정관리 컨트롤러

@Controller
@RequestMapping("terrier/*")
public class Audit_Controller {

	@Inject
	Audit_Service audit_Service;
	
	@RequestMapping(value="account_management/audit_list", method=RequestMethod.GET)
	public void d_mgtGET(@ModelAttribute("cri")Criteria cri, Model model, HttpServletRequest request) throws Exception 
	{	
		model.addAttribute("list", audit_Service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(audit_Service.countPaging(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
}
