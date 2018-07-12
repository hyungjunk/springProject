package com.jun.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jun.domain.Criteria;
import com.jun.domain.EngBoardVO;

@Repository
public class EngBoardImpl implements EngBoardDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="engboardMapper";
	
	@Override
	public void create(EngBoardVO engboardVO) throws Exception {
		session.insert(namespace+".create", engboardVO);
	}

	@Override
	public List<EngBoardVO> read() throws Exception {
		return session.selectList(namespace+".read");
	}

	@Override
	public int countPage() throws Exception {
		return session.selectOne(namespace+".countPage");
	}

	@Override
	public List<EngBoardVO> readlist(Criteria cri) throws Exception {
		return session.selectList(namespace+".readlist", cri);
	}

	@Override
	public void modify(EngBoardVO engboardVO) throws Exception {
		session.update(namespace+".modify", engboardVO);
	}

}
