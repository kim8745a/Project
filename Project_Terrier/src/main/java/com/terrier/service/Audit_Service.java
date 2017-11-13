package com.terrier.service;

import java.util.List;
import java.util.Map;

import com.terrier.domain.Audit_VO;
import com.terrier.domain.Criteria;

public interface Audit_Service {
	
	public List<Audit_VO> audit_list() throws Exception; // ���� ��� ����Ʈ
	
	public List<Audit_VO>listPage(int page) throws Exception; // ����¡ó��-1�������� 10���� ǥ��
	public List<Audit_VO>listCriteria(Criteria cri) throws Exception;//�ϴ�����¡- �� �Խñۿ����� �ϴ�����¡����
	public int countPaging(Criteria cri) throws Exception; // �� �Խñ� ī��Ʈ
	
	public List<Audit_VO>listSearchCriteria(Map<String, Object> map) throws Exception;
	public int countSearchPaging(Map<String, Object> map) throws Exception;
	
	public void audit_insert(Audit_VO audit_Vo) throws Exception; // ���� ��� ����
	
}
