package com.jun.service;

import java.util.List;

import com.jun.domain.MovBoardVO;

public interface MovBoardService {

	public void create(MovBoardVO movboardVO) throws Exception;
	
	public MovBoardVO read(int mid) throws Exception;
	
	public void update(MovBoardVO movboardVO) throws Exception;

	public List<MovBoardVO> readTop() throws Exception;
	
	public List<MovBoardVO> readMid() throws Exception;
	
	public List<MovBoardVO> readAll() throws Exception;
}
