package com.terrier.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.terrier.domain.C_mgt_AppList_VO;
import com.terrier.domain.C_mgt_AppLog_VO;
import com.terrier.domain.C_mgt_ControlLog_VO;
import com.terrier.domain.C_mgt_Gps_VO;
import com.terrier.domain.C_mgt_controller_VO;
import com.terrier.domain.C_mgt_userinfo_VO;
import com.terrier.domain.Employee_VO;
import com.terrier.domain.Location_emp_num_VO;
import com.terrier.persistence.D_mgt_DAO;

@Service
public class D_mgt_ServiceImpl implements D_mgt_Service {

	@Inject
	D_mgt_DAO dao;
	
	@Override
	public List<Employee_VO> emp_list() throws Exception {
		return dao.emp_list();
	}

	@Override
	public List<Employee_VO> emp_search_list(Employee_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.emp_search_list(vo);
	}

	@Override
	public C_mgt_userinfo_VO info(String e_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.info(e_num);
	}

	@Override
	public C_mgt_controller_VO controller(String e_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.controller(e_num);
	}

	@Override
	public List<C_mgt_AppList_VO> applist(String e_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.applist(e_num);
	}

	@Override
	public List<C_mgt_AppLog_VO> applog(String e_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.applog(e_num);
	}

	@Override
	public C_mgt_Gps_VO gps(Location_emp_num_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.gps(vo);
	}

	@Override
	public List<C_mgt_ControlLog_VO> controllog(String e_num) throws Exception {
		return dao.controllog(e_num);
	}

}
