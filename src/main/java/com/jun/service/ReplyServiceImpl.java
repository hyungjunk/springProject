package com.jun.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jun.domain.ReplyVO;
import com.jun.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> showReplyList(int mid) throws Exception {
		return dao.showReplyList(mid);
	}

	@Override
	public void createReply(ReplyVO vo) throws Exception {
		dao.createReply(vo);
	}
	
}
