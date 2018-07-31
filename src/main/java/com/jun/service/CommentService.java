package com.jun.service;

import java.util.List;

import com.jun.domain.CommentVO;
import com.jun.domain.Criteria;

public interface CommentService {

	public void addComment(CommentVO vo) throws Exception;
	
	public List<CommentVO> getComment(Criteria cri) throws Exception;
	
	public int getCommentCount() throws Exception;
	
	public void updateComment(CommentVO vo) throws Exception;

	public void deleteComment(int cid) throws Exception;
}
