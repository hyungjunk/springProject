package com.jun.persistence;

import java.util.List;

import com.jun.domain.EngBoardVO;
import com.jun.domain.MovBoardVO;
import com.jun.domain.SearchCriteria;

public interface MovBoardDAO {
	
	public void create(MovBoardVO movboardVO) throws Exception;
	
	public MovBoardVO read(int mid) throws Exception;
	
	public void update(MovBoardVO movboardVO) throws Exception;

	public List<MovBoardVO> readTop() throws Exception;
	
	public List<MovBoardVO> readMid() throws Exception;
	
	public List<MovBoardVO> readAll() throws Exception;
	
	public List<MovBoardVO> rankList() throws Exception;
	
	public List<MovBoardVO> genreList(String genre) throws Exception;
	
	public List<EngBoardVO> readBoard(SearchCriteria cri) throws Exception;
	
	public int countPost() throws Exception;
}
