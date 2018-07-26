package com.jun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jun.domain.EngBoardVO;
import com.jun.domain.PageMaker;
import com.jun.domain.SearchCriteria;
import com.jun.service.EngBoardService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/eng/*")
public class EngBoardController {
	
	@Autowired(required=false)
	private EngBoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(EngBoardController.class);
	
	@RequestMapping(value="board", method=RequestMethod.GET)
	public String engBoardGET(
			@ModelAttribute("cri") SearchCriteria cri
			, Model model) throws Exception {
		logger.info("Search called");
		logger.info(cri.toString());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		logger.info(pageMaker.toString());
		pageMaker.setTotalCount(service.countSearchPage(cri));
		model.addAttribute("list", service.searchedList(cri));
		model.addAttribute("pageMaker", pageMaker);
		return "/eng/board";
	}
	
	@RequestMapping(value="board", method=RequestMethod.POST)
	public String engBoardPOST(EngBoardVO engboardVO, Model model, RedirectAttributes rttr) throws Exception {
		logger.info("eng main called POST");
		logger.info(engboardVO.toString());
		service.addList(engboardVO);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/eng/board";
	}
}
