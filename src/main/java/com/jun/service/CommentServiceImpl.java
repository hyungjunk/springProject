package com.jun.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun.domain.CommentVO;
import com.jun.domain.Criteria;
import com.jun.persistence.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired(required=false)
	private CommentDAO dao;
	
	@Override
	public void addComment(CommentVO vo) throws Exception {
		dao.addComment(vo);
	}

	@Override
	public List<CommentVO> getComment(Criteria cri) throws Exception {
		return dao.getComment(cri);
	}

	@Override
	public void updateComment(CommentVO vo) throws Exception {
		dao.updateComment(vo);
	}

	@Override
	public void deleteComment(int cid) throws Exception {
		dao.deleteComment(cid);
	}
	
}
