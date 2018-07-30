package com.jun.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.jun.domain.CommentVO;
import com.jun.domain.Criteria;

public class CommentDAOImpl implements CommentDAO {

	private static final String namespace = "commentDAO";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void addComment(CommentVO vo) throws Exception {
		session.insert(namespace+".addComment", vo);
	}

	@Override
	public List<CommentVO> getComment(Criteria cri) throws Exception {
		return session.selectList(namespace+".getComment", cri);
	}

}
