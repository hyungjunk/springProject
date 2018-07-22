package com.jun.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jun.domain.Criteria;
import com.jun.domain.MovBoardVO;
import com.jun.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
	@Override
	public void create(MovBoardVO movboardVO) throws Exception {
		dao.create(movboardVO);
	}
	
	@Override
	public MovBoardVO read(int mid) throws Exception {
		return dao.read(mid);
	}

	@Override
	public void update(MovBoardVO movboardVO) throws Exception {
		dao.update(movboardVO);
	}

	@Override
	public int totalCount() throws Exception {
		return dao.totalCount();
	}
	
	@Override
	public List<MovBoardVO> readAll(Criteria cri) throws Exception {
		return dao.readAll(cri);
	}

	@Override
	public void delete(int mid) throws Exception {
		dao.delete(mid);
	}


}
