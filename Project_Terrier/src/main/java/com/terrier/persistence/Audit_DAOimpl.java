package com.terrier.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.terrier.domain.Audit_VO;
import com.terrier.domain.Criteria;

@Repository
public class Audit_DAOimpl implements Audit_DAO{

	private final static String namespace="Audit_Mapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<Audit_VO> audit_list() throws Exception {
		return sqlSession.selectList(namespace+".audit_list");
	}

	@Override
	public void audit_insert(Audit_VO audit_Vo) throws Exception {
		sqlSession.insert(namespace+".audit_insert", audit_Vo);
	}

	@Override
	public List<Audit_VO> listPage(int page) throws Exception {
		if(page<=0)
		{
			page=1;
		}
		page=(page-1)*10;
		return sqlSession.selectList(namespace+".listPage",page);
	}

	@Override
	public List<Audit_VO> listCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+".listCriteria",cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace+".countPaging", cri);
	}


}
