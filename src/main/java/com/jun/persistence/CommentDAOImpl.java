package com.jun.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jun.domain.CommentVO;
import com.jun.domain.Criteria;

@Repository
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

	@Override
	public void updateComment(CommentVO vo) throws Exception {
		session.update(namespace+".updateComment", vo);
	}

	@Override
	public void deleteComment(int cid) throws Exception {
		System.out.println(cid+"===================================cid==================");
		session.update(namespace+".deleteComment", cid);
	}
	
}
