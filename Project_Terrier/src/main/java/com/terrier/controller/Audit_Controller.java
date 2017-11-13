package com.terrier.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.terrier.domain.Audit_VO;
import com.terrier.domain.Audit_VO_filter;
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
	
	@RequestMapping(value="account_management/audit_list/search", method=RequestMethod.GET)
	public String d_mgt_search(@ModelAttribute("cri")Criteria cri, @ModelAttribute("auditVO")Audit_VO_filter audit, 
			Model model, HttpServletRequest request) throws Exception // 검색 버튼 속성
	{	
		// 맵에 페이징 객체와 감사 VO를 파라미터로 넘겨줌
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("auditVO", audit);
		
		model.addAttribute("list", audit_Service.listSearchCriteria(map));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(audit_Service.countSearchPaging(map));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "terrier/account_management/audit_list";
	}
	
}
