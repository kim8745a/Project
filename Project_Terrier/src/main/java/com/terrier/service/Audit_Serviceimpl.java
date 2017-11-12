package com.terrier.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.terrier.domain.Audit_VO;
import com.terrier.domain.Criteria;
import com.terrier.persistence.Audit_DAO;

@Service
public class Audit_Serviceimpl implements Audit_Service{

	@Inject
	Audit_DAO audit_DAO;
	
	@Override
	public List<Audit_VO> audit_list() throws Exception {
		return audit_DAO.audit_list();
	}

	@Override
	public void audit_insert(Audit_VO audit_Vo) throws Exception {
		audit_DAO.audit_insert(audit_Vo);
	}

	@Override
	public List<Audit_VO> listPage(int page) throws Exception {
		return audit_DAO.listPage(page);
	}

	@Override
	public List<Audit_VO> listCriteria(Criteria cri) throws Exception {
		return audit_DAO.listCriteria(cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return audit_DAO.countPaging(cri);
	}

}
