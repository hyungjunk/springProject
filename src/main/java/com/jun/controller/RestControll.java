package com.jun.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jun.domain.EngBoardVO;
import com.jun.service.EngBoardService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/modify")
public class RestControll {

	
	@Inject
	private EngBoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(RestControll.class);
	
	@RequestMapping(value="/{bid}", method=RequestMethod.POST)
	public ResponseEntity<String> test(@PathVariable("bid") int bid, @RequestBody EngBoardVO engboardVO) throws Exception {
		logger.info("test called POST");
		ResponseEntity<String> entity = null; 
		try {
			service.updateList(engboardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/getDetail", method=RequestMethod.GET)
	public ResponseEntity<String> showMovieBoard() throws Exception {
		logger.info("test called POST");
		ResponseEntity<String> entity = null; 
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
/*	@RequestMapping(value="patchreply/{bno}/{rno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> patchReply(
			@PathVariable("bno") int bno, @PathVariable("rno") int rno, @RequestBody EngBoardVO engboardVO) {
		ResponseEntity<String> entity = null;
		try {
			service.update(engboardVO);
			entity = ResponseEntity("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	*/
}
