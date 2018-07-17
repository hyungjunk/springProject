package com.jun.persistence;

import java.util.List;

import com.jun.domain.Criteria;
import com.jun.domain.EngBoardVO;
import com.jun.domain.SearchCriteria;

public interface EngBoardDAO {

	public void create(EngBoardVO engboardVO) throws Exception;
	
	public List<EngBoardVO> readlist(Criteria cri) throws Exception;
	
	public void modify(EngBoardVO engboardVO) throws Exception;

	public int countPage() throws Exception;
	
	public List<EngBoardVO> searchList(SearchCriteria cri) throws Exception;

	public int countSearchPage(SearchCriteria cri) throws Exception;
}
