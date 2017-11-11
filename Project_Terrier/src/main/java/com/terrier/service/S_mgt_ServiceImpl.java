package com.terrier.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.terrier.domain.Control_count_VO;
import com.terrier.domain.Dep_ctl_on_count_VO;
import com.terrier.domain.Dep_ctl_status_VO;
import com.terrier.domain.S_mgt_date_con_count_VO;
import com.terrier.domain.S_mgt_dep_date_con_count_VO;
import com.terrier.domain.S_mgt_emp_date_con_count_VO;
import com.terrier.domain.S_mgt_fi_count_VO;
import com.terrier.persistence.S_mgt_DAO;

@Service
public class S_mgt_ServiceImpl implements S_mgt_Service {

	@Inject
	S_mgt_DAO dao;
	
	@Override
	public Control_count_VO control_count(String status) {
		return dao.control_count(status);
	}
	
	@Override
	public int dep_ctl_on_count(String department) {
		return dao.dep_ctl_on_count(department);
	}

	@Override
	public Control_count_VO dep_ctl_status(Dep_ctl_status_VO dep_status_vo) {
		return dao.dep_ctl_status(dep_status_vo);
	}

	@Override
	public String nowDate()throws Exception {
		// TODO Auto-generated method stub
		return dao.nowDate();
	}
	
	//날짜별 통계 계산
	@Override
	public Control_count_VO date_count_on_off(S_mgt_date_con_count_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.date_count_on_off(vo);
	}

	@Override
	public Control_count_VO dep_date_conunt(S_mgt_dep_date_con_count_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.dep_date_conunt(vo);
	}

	@Override
	public Control_count_VO emp_date_conunt(S_mgt_emp_date_con_count_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.emp_date_conunt(vo);
	}

	@Override
	public int fi_total(S_mgt_fi_count_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.fi_total(vo);
	}

}
