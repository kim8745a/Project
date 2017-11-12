package com.terrier.auth;

import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.terrier.domain.User_VO;
import com.terrier.service.User_Service;


public class PreludebUserService implements UserDetailsService{
	
	@Inject
	User_Service Service;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException  {
		User_VO user = null;
		PreludebUser entazUser = null;
		
		user = Service.login(username);
			
		if(user == null) 
			throw new UsernameNotFoundException(username);
			
		entazUser = new PreludebUser();
			
		entazUser.setUsername(username);
		entazUser.setPassword(user.getPw());
		
		return entazUser;
	}

}
