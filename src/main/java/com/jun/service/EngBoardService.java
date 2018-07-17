package com.jun.service;

import java.util.List;

import com.jun.domain.Criteria;
import com.jun.domain.EngBoardVO;
import com.jun.domain.SearchCriteria;

public interface EngBoardService {
	
	public void addList(EngBoardVO engboardVO) throws Exception;
	
	public List<EngBoardVO> readList(Criteria cri) throws Exception;
	
	public void updateList(EngBoardVO engboardVO) throws Exception;
	
	public int countPage() throws Exception;
	
	public List<EngBoardVO> searchedList(SearchCriteria cri) throws Exception;
	
	public int countSearchPage(SearchCriteria cri) throws Exception;
}
