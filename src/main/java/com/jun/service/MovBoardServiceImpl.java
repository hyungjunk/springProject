package com.jun.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jun.domain.MovBoardVO;
import com.jun.persistence.MovBoardDAO;

@Service
public class MovBoardServiceImpl implements MovBoardService {

	@Inject
	private MovBoardDAO dao;
	
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
	public List<MovBoardVO> readTop() throws Exception {
		return dao.readTop();
	}

	@Override
	public List<MovBoardVO> readMid() throws Exception {
		return dao.readMid();
	}

	@Override
	public List<MovBoardVO> readAll() throws Exception {
		return dao.readAll();
	}

	@Override
	public List<MovBoardVO> rankList() throws Exception {
		return dao.rankList();
	}

	@Override
	public List<MovBoardVO> genreList(String genre) throws Exception {
		return dao.genreList(genre);
	}

}
