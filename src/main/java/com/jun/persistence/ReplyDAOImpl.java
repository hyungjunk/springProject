package com.jun.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jun.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "ReplyDAO";
	
	@Override
	public List<ReplyVO> showReplyList(int mid) throws Exception {
		return session.selectList(namespace+".showReplyList", mid);
	}

	@Override
	public void createReply(int mid, ReplyVO vo) throws Exception {
		session.insert(namespace+".createReply", mid);
	}

}
