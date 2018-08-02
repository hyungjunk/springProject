package com.jun.service;

import com.jun.domain.LoginDTO;
import com.jun.domain.UserVO;

public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;
	
}
