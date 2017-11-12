package com.terrier.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.terrier.domain.C_mgt_AppList_VO;
import com.terrier.domain.C_mgt_AppLog_VO;
import com.terrier.domain.C_mgt_ControlLog_VO;
import com.terrier.domain.C_mgt_Gps_VO;
import com.terrier.domain.C_mgt_controller_VO;
import com.terrier.domain.C_mgt_userinfo_VO;
import com.terrier.domain.Employee_VO;
import com.terrier.domain.Location_emp_num_VO;

@Repository
public class D_mgt_DAOImpl implements D_mgt_DAO {

	private static String namespace="d_mgt_Mapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<Employee_VO> emp_list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".emp_list");
	}

	@Override
	public List<Employee_VO> emp_search_list(Employee_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".emp_search_list",vo);
	}

	@Override
	public C_mgt_userinfo_VO info(String emp_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".user_info",emp_num);
	}

	@Override
	public C_mgt_controller_VO controller(String emp_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".user_con",emp_num);
	}

	@Override
	public List<C_mgt_AppList_VO> applist(String emp_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".user_applist",emp_num);
	}

	@Override
	public List<C_mgt_AppLog_VO> applog(String emp_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".user_applog",emp_num);
	}

	@Override
	public C_mgt_Gps_VO gps(Location_emp_num_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".user_gps",vo);
	}

	@Override
	public List<C_mgt_ControlLog_VO> controllog(String emp_num) throws Exception {
		return sqlSession.selectList(namespace+".user_conlog", emp_num);
	}

}
