package com.terrier.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.terrier.domain.Employee_VO;
import com.terrier.domain.User_VO;
import com.terrier.dto.User_DTO;

@Repository
public class User_DAOImpl implements User_DAO {

	private static String namespace="login_Mapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public User_VO login(String username) {
		return sqlSession.selectOne(namespace+".login", username);
	}

}
