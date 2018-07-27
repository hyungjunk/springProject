package com.jun.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jun.domain.EngBoardVO;
import com.jun.domain.MovBoardVO;
import com.jun.domain.SearchCriteria;
import com.jun.service.MovBoardServiceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/mov")
public class MovRestControll {

	@Autowired(required = false)
	private MovBoardServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(MovBoardController.class);
	
	@RequestMapping("/board/detail/{bid}")
	public ResponseEntity<MovBoardVO> getMovInfo(@PathVariable("bid") int bid, Model model) throws Exception {
		logger.info("mov Info");
		MovBoardVO vo = service.read(bid);
		ResponseEntity<MovBoardVO> entity = null;
		entity = new ResponseEntity<>(vo, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/board/post/{page}")
	public ResponseEntity<List<EngBoardVO>> getPostByPage(
			@PathVariable("page") int page
			, SearchCriteria cri
			, Model model) throws Exception {
		logger.info("-----------------------rest--------------------");
		List<EngBoardVO> vo = service.readBoard(cri);
		ResponseEntity<List<EngBoardVO>> entity = null;
		entity = new ResponseEntity<List<EngBoardVO>>(vo, HttpStatus.OK);
		return entity;
	}
}
