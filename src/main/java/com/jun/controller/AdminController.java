package com.jun.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jun.domain.Criteria;
import com.jun.domain.MovBoardVO;
import com.jun.domain.PageMaker;
import com.jun.service.AdminServiceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/admin*")
public class AdminController {
	
	@Inject
	private AdminServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// 皋牢其捞瘤
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String showAdminPage(
			MovBoardVO vo
			, Criteria cri
			, Model model
			) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalCount());
		System.out.println(service.totalCount());
		model.addAttribute("list", service.readAll(cri));
		model.addAttribute("pageMaker", pageMaker);
		System.out.println(pageMaker+"=========================================");
		return "/admin/main"; 
	}

	// 公厚 牧刨明 积己 其捞瘤
	@RequestMapping(value = "/mov/create", method = RequestMethod.GET)
	public String showCreatePage() throws Exception {
		return "/admin/Mov/MovCreate";
	}
	
	// 公厚 牧刨明 积己 咀记
	@RequestMapping(value = "/mov/create", method = RequestMethod.POST)
	public String addContent(
			MovBoardVO movBoardVO
			, Criteria cri
			, Model model
			, RedirectAttributes rttr) throws Exception {
		logger.info("==============================================================");
		logger.info(movBoardVO.toString());
		service.create(movBoardVO);
		model.addAttribute("list", service.readAll(cri));
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin";
	}
	
	// 公厚 牧刨明 荐沥 其捞瘤
	@RequestMapping(value = "/edit/{mid}", method = RequestMethod.GET)
	public String showDetailPage(
			@PathVariable("mid") int mid
			, @ModelAttribute MovBoardVO vo 
			, Model model
			, RedirectAttributes rttr
			) throws Exception {
		logger.info("admin/edit/{mid}, GET");
		model.addAttribute("list", service.read(mid));
		return "/admin/Mov/MovDetail";
	}
	
	// 公厚 牧刨明 荐沥 咀记
	@RequestMapping(value = "/edit/{mid}", method = {RequestMethod.POST, RequestMethod.PUT, RequestMethod.PATCH} )
	public String modifyContent(
			@PathVariable("mid") int mid
			, @ModelAttribute MovBoardVO vo 
			, Model model
			, RedirectAttributes rttr
			) throws Exception {
		logger.info(vo.toString()+"===============================");
		service.update(vo);
		System.out.println("error");
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin";
	}
	
	// 公厚 牧刨明 力芭 咀记
	@RequestMapping(value = "/delete/{mid}", method = {RequestMethod.DELETE} )
	@ResponseBody
	public String deleteContent(
			@PathVariable("mid") int mid
			, Model model
			) throws Exception {
		service.delete(mid);
		return "success";
	}
}
