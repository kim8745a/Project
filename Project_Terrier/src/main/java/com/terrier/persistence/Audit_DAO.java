package com.terrier.persistence;

import java.util.List;

import com.terrier.domain.Audit_VO;
import com.terrier.domain.Criteria;


public interface Audit_DAO {
	public List<Audit_VO> audit_list() throws Exception; // 감사 기록 리스트
	public void audit_insert(Audit_VO audit_Vo) throws Exception; // 감사 기록 저장
	
	public List<Audit_VO>listPage(int page) throws Exception; // 페이징처리-1페이지당 10개씩 표시
	public List<Audit_VO>listCriteria(Criteria cri) throws Exception;//하단페이징- 총 게시글에따른 하단페이징분할
	public int countPaging(Criteria cri) throws Exception; // 총 게시글 카운트
}