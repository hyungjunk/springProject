package com.jun.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jun.domain.Criteria;
import com.jun.domain.EngBoardVO;
import com.jun.domain.SearchCriteria;
import com.jun.persistence.EngBoardDAO;

@Service
public class EngBoardServiceImpl implements EngBoardService {
	
	@Inject
	private EngBoardDAO dao;
	
	@Override
	public void addList(EngBoardVO engboardVO) throws Exception {
		dao.create(engboardVO);
	}

	@Override
	public List<EngBoardVO> readList(Criteria cri) throws Exception {
		return dao.readlist(cri);
	}

	@Override
	public void updateList(EngBoardVO engboardVO) throws Exception {
		dao.modify(engboardVO);
	}

	@Override
	public int countPage() throws Exception {
		return dao.countPage();
	}

	@Override
	public List<EngBoardVO> searchedList(SearchCriteria cri) throws Exception {
		return dao.searchList(cri);
	}

	@Override
	public int countSearchPage(SearchCriteria cri) throws Exception {
		return dao.countSearchPage(cri);
	}
}
