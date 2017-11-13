package com.terrier.persistence;

import com.terrier.domain.User_VO;
import com.terrier.dto.User_DTO;

public interface User_DAO 
{
	// 스프링 시큐리티로 인해 예외를 던지지 않음.
	public User_VO login(String username);
}
