package com.jun.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jun.domain.Criteria;
import com.jun.domain.EngBoardVO;
import com.jun.domain.PageMaker;
import com.jun.domain.SearchCriteria;
import com.jun.domain.SendVO;
import com.jun.service.EngBoardService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/eng/*")
public class BoardController {
	
	@Inject
	private EngBoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value="board", method=RequestMethod.GET)
	public String engBoardGET(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("eng main called GET");
		logger.info(cri.toString());
		model.addAttribute("list", service.readList(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countPage());
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
	
	@RequestMapping(value="search", method= {RequestMethod.GET, RequestMethod.POST})
	public String searchResult(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("Search called");
		logger.info(cri.toString());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countSearchPage(cri));
		model.addAttribute("list", service.searchedList(cri));
		return "/eng/board";
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	@ResponseBody
	public SendVO testGET() throws Exception {
		logger.info("test called POST");
		SendVO sendVO = new SendVO();
		sendVO.setStatus("success");
		sendVO.setCall("Method");
		return sendVO;
	}

	@RequestMapping(value="modify", method= {RequestMethod.PATCH, RequestMethod.PUT})
	public String modifytest() throws Exception {
		return "/eng/modifytest";
	}
	
	@RequestMapping(value="test", method= RequestMethod.GET)
	public String testpage() throws Exception {
		return "/eng/testpage";
	}
}
