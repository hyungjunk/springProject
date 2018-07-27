package com.jun.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jun.domain.ReplyVO;
import com.jun.service.ReplyService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RequestMapping("/mov/reply/")
@RestController
public class ReplyController {

	@Inject
	private ReplyService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	// ¥Ò±€ ∫∏ø©¡÷±‚
	@RequestMapping(value = "{mid}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> showReply(
			@PathVariable("mid") int mid
			, Model model) {
		logger.info("/mov/reply/{mid}, GET");
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<ReplyVO>>(service.showReplyList(mid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ¥Ò±€ ¥ﬁ±‚
	@RequestMapping(value = "{mid}", method=RequestMethod.POST)
	public ResponseEntity<String> createReply(@RequestBody ReplyVO vo) {
		logger.info("/mov/reply/{mid}, POST");
		ResponseEntity<String> entity = null;
		try {
			logger.info("------------"+vo.toString());
			service.createReply(vo);
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
