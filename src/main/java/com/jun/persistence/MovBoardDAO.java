package com.jun.persistence;

import java.util.List;

import com.jun.domain.Criteria;
import com.jun.domain.MovBoardVO;

public interface MovBoardDAO {
	
	public void create(MovBoardVO movboardVO) throws Exception;
	
	public MovBoardVO read(int mid) throws Exception;
	
	public void update(MovBoardVO movboardVO) throws Exception;

	public List<MovBoardVO> readTop() throws Exception;
	
	public List<MovBoardVO> readMid() throws Exception;
	
	public List<MovBoardVO> readAll() throws Exception;
	
	public List<MovBoardVO> rankList() throws Exception;
	
	public List<MovBoardVO> genreList(String genre) throws Exception;
}
