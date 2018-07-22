package com.jun.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jun.domain.MovBoardVO;

@Repository
public class MovBoardDAOImpl implements MovBoardDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "movBoardMapper";
	
	@Override
	public void create(MovBoardVO movboardVO) throws Exception {
		session.insert(namespace + ".create", movboardVO);
	}

	@Override
	public MovBoardVO read(int mid) throws Exception {
		return session.selectOne(namespace+".read", mid);
	}

	@Override
	public void update(MovBoardVO movboardVO) throws Exception {
		session.update(namespace+".update", movboardVO);
	}

	@Override
	public List<MovBoardVO> readTop() throws Exception {
		return session.selectList(namespace+".readTop");
	}

	@Override
	public List<MovBoardVO> readMid() throws Exception {
		return session.selectList(namespace+".readMid");
	}

	@Override
	public List<MovBoardVO> readAll() throws Exception {
		return session.selectList(namespace+".readAll");
	}

}
