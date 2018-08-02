package com.jun.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jun.domain.LoginDTO;
import com.jun.domain.UserVO;
import com.jun.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

}
