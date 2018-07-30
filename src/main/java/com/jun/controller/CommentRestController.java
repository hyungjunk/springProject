package com.jun.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jun.domain.CommentVO;
import com.jun.service.CommentService;

@RestController
@RequestMapping("/mov/comment")
public class CommentRestController {

	@Inject
	private CommentService service;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> addReply(@RequestBody CommentVO vo){
		ResponseEntity<String> entity = null;
		try {
			service.addComment(vo);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
