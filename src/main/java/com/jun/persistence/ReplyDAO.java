package com.jun.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jun.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> showReplyList(int mid) throws Exception;
	
	public void createReply(int mid, ReplyVO vo) throws Exception;
}
