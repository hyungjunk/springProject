package com.jun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/exp/*")
public class ExpBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(ExpBoardController.class);

	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String showMovieBoard() {
		logger.info("/exp/board");
		return "/exp/board";
	}
	
	@RequestMapping(value = "getDetail", method = RequestMethod.GET)
	public String showMovieDetail() {
		logger.info("/exp/board");
		return "/exp/board";
	}
	
	@RequestMapping(value = "overlayPop", method = RequestMethod.GET)
	public String showMoviePage() {
		logger.info("");
		return "/exp/overlayPop";
	}
}
