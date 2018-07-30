package com.jun.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jun.domain.CommentVO;
import com.jun.domain.Criteria;

public interface CommentService {

	public void addComment(CommentVO vo) throws Exception;
	
	public List<CommentVO> getComment(Criteria cri) throws Exception;
	
}
