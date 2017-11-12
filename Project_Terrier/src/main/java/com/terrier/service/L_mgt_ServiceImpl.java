package com.terrier.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.terrier.domain.Criteria;
import com.terrier.domain.Employee_VO;
import com.terrier.domain.L_mgt_controller_VO;
import com.terrier.domain.L_mgt_lf_log_VO;
import com.terrier.domain.L_mgt_lr_list_VO;
import com.terrier.persistence.L_mgt_DAO;

@Service
public class L_mgt_ServiceImpl implements L_mgt_Service {

	@Inject
	L_mgt_DAO l_mgt_dao;
	
	@Override
	public L_mgt_controller_VO info(String e_num) throws Exception {
		return l_mgt_dao.info(e_num);
	}

	@Override
	public List<Employee_VO> emp_list() throws Exception {
		return l_mgt_dao.emp_list();
	}

	@Override
	public List<Employee_VO> emp_search_list(Employee_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return l_mgt_dao.emp_search_list(vo);
	}

	@Override
	public Employee_VO emp_dynamic(String emp_num) throws Exception {
		// TODO Auto-generated method stub
		return l_mgt_dao.emp_dynamic(emp_num);
	}

	@Override
	public String l_lf_date(String emp_num) throws Exception {
		// TODO Auto-generated method stub
		return l_mgt_dao.l_lf_date(emp_num);
	}

	@Override
	public List<L_mgt_lf_log_VO> l_lf_log(String l_lf_date, String employee_num) throws Exception {
		// TODO Auto-generated method stub
		return l_mgt_dao.l_lf_log(l_lf_date, employee_num);
	}

	@Override
	public void l_unlock(String employee_num) throws Exception {
		// TODO Auto-generated method stub
		l_mgt_dao.l_unlock(employee_num);
	}

	@Override
	public String l_camera_auth(String employee_num) throws Exception {
		// TODO Auto-generated method stub
		return l_mgt_dao.l_camera_auth(employee_num);
	}

	@Override
	public List<L_mgt_lr_list_VO> l_request_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return l_mgt_dao.l_request_list(cri);
	}

	@Override
	public List<L_mgt_lr_list_VO> l_request_list_search(Criteria cri, L_mgt_lr_list_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return l_mgt_dao.l_request_list_search(cri, vo);
	}

	@Override
	public int l_request_count() throws Exception {
		// TODO Auto-generated method stub
		return l_mgt_dao.l_request_count();
	}

	@Override
	public int l_request_search_count(Criteria cri, L_mgt_lr_list_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return l_mgt_dao.l_request_search_count(cri, vo);
	}

	@Override
	public void l_loss_check(String bno) throws Exception {
		// TODO Auto-generated method stub
		l_mgt_dao.l_loss_check(bno);
	}
}
