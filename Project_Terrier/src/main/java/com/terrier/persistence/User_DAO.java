package com.terrier.persistence;

import com.terrier.domain.User_VO;
import com.terrier.dto.User_DTO;

public interface User_DAO 
{
	// ������ ��ť��Ƽ�� ���� ���ܸ� ������ ����.
	public User_VO login(String username);
}
