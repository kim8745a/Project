package com.terrier.persistence;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.terrier.domain.Control_count_VO;
import com.terrier.domain.Dep_ctl_status_VO;
import com.terrier.domain.S_mgt_date_con_count_VO;
import com.terrier.domain.S_mgt_dep_date_con_count_VO;
import com.terrier.domain.S_mgt_emp_date_con_count_VO;
import com.terrier.domain.S_mgt_fi_count_VO;

@Repository
public class S_mgt_DAOImpl implements S_mgt_DAO {

	private static String namespace="S_mgt_Mapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public Control_count_VO control_count(String status) {
		return sqlSession.selectOne(namespace+".control_status_count",status);
	}

	@Override
	public int dep_ctl_on_count(String department) {
		return sqlSession.selectOne(namespace+".department_control_on",department);
	}

	@Override
	public Control_count_VO dep_ctl_status(Dep_ctl_status_VO vo) {
		return sqlSession.selectOne(namespace+".department_control_status",vo);
	}

	@Override
	public String nowDate()throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".nowdate");
	}

	
	//날짜별 통계자료
	@Override
	public Control_count_VO date_count_on_off(S_mgt_date_con_count_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".date_control_status_on_off",vo);
	}

	@Override
	public Control_count_VO dep_date_conunt(S_mgt_dep_date_con_count_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".dep_date_control_status_on_off",vo);
	}

	@Override
	public Control_count_VO emp_date_conunt(S_mgt_emp_date_con_count_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".emp_date_control_status_on_off",vo);
	}

	@Override
	public int fi_total(S_mgt_fi_count_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".fi_control_off",vo);
	}




}
