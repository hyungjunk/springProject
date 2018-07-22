package com.jun.service;

import java.util.List;

import com.jun.domain.Criteria;
import com.jun.domain.MovBoardVO;

public interface AdminService {

	public void create(MovBoardVO movboardVO) throws Exception;
	
	public MovBoardVO read(int mid) throws Exception;
	
	public List<MovBoardVO> readAll(Criteria cri) throws Exception;

	public void update(MovBoardVO movboardVO) throws Exception;
	
	public int totalCount() throws Exception;
	
	public void delete(int mid) throws Exception;

}
