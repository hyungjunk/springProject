package com.jun.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jun.domain.ReplyVO;

@Service
public interface ReplyService {

	public List<ReplyVO> showReplyList(int mid) throws Exception;
	
	public void createReply(ReplyVO vo) throws Exception;
	
}
