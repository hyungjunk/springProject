package com.jun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jun.domain.MovBoardVO;
import com.jun.service.MovBoardServiceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/mov/*")
public class MovieController {
	
	@Autowired(required=false)
	private MovBoardServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);

	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String showMovieBoard(Model model) throws Exception {
		logger.info("/mov/board");
		model.addAttribute("top", service.readTop()); // top 가져오기
		model.addAttribute("mid", service.readMid()); // mid 가져오기
		return "/mov/board";
	}
	
	@RequestMapping(value = "board/detail", method = RequestMethod.GET)
	public @ResponseBody MovBoardVO showMovieDetail(@ModelAttribute("info") MovBoardVO vo, Model model) throws Exception {
		vo = (MovBoardVO)service.read(1);
		System.out.println(vo);
		return vo; 
	}
	
}
