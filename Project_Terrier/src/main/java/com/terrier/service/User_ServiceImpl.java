package com.terrier.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.terrier.domain.User_VO;
import com.terrier.dto.User_DTO;
import com.terrier.persistence.User_DAO;

@Service
public class User_ServiceImpl implements User_Service {

	@Inject
	private User_DAO dao;
	
	@Override
	public User_VO login(String username) {
		return dao.login(username);
	}
}
