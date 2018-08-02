package com.jun.persistence;

import com.jun.domain.LoginDTO;
import com.jun.domain.UserVO;

public interface UserDAO {

	public UserVO login(LoginDTO dto) throws Exception;
	
}
