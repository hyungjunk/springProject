package com.jun.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jun.domain.Criteria;
import com.jun.domain.MovBoardVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "adminMapper";
	
	@Override
	public void create(MovBoardVO movboardVO) throws Exception {
		session.insert(namespace + ".create", movboardVO);
	}

	@Override
	public MovBoardVO read(int mid) throws Exception {
		return session.selectOne(namespace+".read", mid);
	}
	
	@Override
	public List<MovBoardVO> readAll(Criteria cri) throws Exception {
		return session.selectList(namespace+".readAll", cri);
	}
	
	@Override
	public void update(MovBoardVO movboardVO) throws Exception {
		session.update(namespace+".update", movboardVO);
	}
	
	@Override
	public int totalCount() throws Exception {
		return session.selectOne(namespace+".totalCount");
	}

	@Override
	public void delete(int mid) throws Exception {
		session.delete(namespace+".delete", mid);
	}

}
