package com.terrier.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.terrier.domain.Audit_VO;
import com.terrier.domain.Criteria;
import com.terrier.domain.PageMaker;
import com.terrier.service.Audit_Service;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class AuditTest {
	
	@Inject
	Audit_Service service;
	
	@Test
	public void test() throws Exception {
	
		List<Audit_VO> vo;
		vo = service.audit_list();
		
		Iterator<Audit_VO> it = vo.iterator();
		
		while(it.hasNext()) {
			Audit_VO test1=it.next();
			System.out.println(test1.toString());
		}
	}

	
	
}
