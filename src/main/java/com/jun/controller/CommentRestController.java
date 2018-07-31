package com.jun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jun.domain.CommentVO;
import com.jun.domain.Criteria;
import com.jun.domain.PageMaker;
import com.jun.service.CommentService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/mov/comment")
public class CommentRestController {

	@Inject
	private CommentService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MovBoardController.class);
	
	@RequestMapping(value="/post", method=RequestMethod.POST)
	public ResponseEntity<String> addComment(@RequestBody CommentVO vo) throws Exception{
		ResponseEntity<String> entity = null;
		service.addComment(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	// REST ∆‰¿Ã¬° «ŸΩ…∫Œ∫–
	@RequestMapping(value="/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getComment(@PathVariable("page") int page) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<CommentVO> list = service.getComment(cri);
			map.put("list", list);
			
			int commentCount = service.getCommentCount();
			pageMaker.setTotalCount(commentCount);
			
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{cid}", method=RequestMethod.POST)
	public ResponseEntity<String> updateComment(@RequestBody CommentVO vo) throws Exception {
		logger.info("/{page} called");
		ResponseEntity<String> entity = null;
		try {
			service.updateComment(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping(value="/{cid}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteComment(@PathVariable("cid") int cid) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			service.deleteComment(cid);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		return entity;
	}
}
