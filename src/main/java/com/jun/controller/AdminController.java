package com.jun.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jun.domain.Criteria;
import com.jun.domain.MovBoardVO;
import com.jun.domain.PageMaker2;
import com.jun.service.AdminServiceImpl;
import com.jun.util.CommonsUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/admin*")
public class AdminController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private AdminServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String showAdminPage(
			MovBoardVO vo
			, Criteria cri
			, Model model
			) throws Exception {
		PageMaker2 pageMaker = new PageMaker2();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalCount());
		System.out.println(service.totalCount());
		model.addAttribute("list", service.readAll(cri));
		model.addAttribute("pageMaker", pageMaker);
		System.out.println(pageMaker+"=========================================");
		return "/admin/main"; 
	}
	
	@RequestMapping(value = "/mov/create", method = RequestMethod.GET)
	public String showCreatePage() throws Exception {
		return "/admin/Mov/MovCreate";
	}
	
	@RequestMapping(value = "mov/create", method = RequestMethod.POST)
	public String addContent(
			MovBoardVO movBoardVO
			, Criteria cri
			, Model model
			, RedirectAttributes rttr) throws Exception {
		service.create(movBoardVO);
		model.addAttribute("list", service.readAll(cri));
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "/edit/{mid}", method = RequestMethod.GET)
	public String showDetailPage(
			@PathVariable("mid") int mid
			, @ModelAttribute MovBoardVO vo 
			, Model model
			, RedirectAttributes rttr
			) throws Exception {
		model.addAttribute("list", service.read(mid));
		return "/admin/Mov/MovDetail";
	}
	
	@RequestMapping(value = "/edit/{mid}", method = {RequestMethod.POST, RequestMethod.PUT, RequestMethod.PATCH} )
	public String modifyContent(
			@PathVariable("mid") int mid
			, @ModelAttribute MovBoardVO vo 
			, Model model
			, RedirectAttributes rttr
			) throws Exception {
		service.update(vo);
		System.out.println("error");
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/main";
	}
	
	@RequestMapping(value = "/delete/{mid}", method = {RequestMethod.DELETE} )
	@ResponseBody
	public String deleteContent(
			@PathVariable("mid") int mid
			, Model model
			) throws Exception {
		service.delete(mid);
		return "success";
	}
	
	@RequestMapping(value = "/file/test", method = {RequestMethod.GET} )
	public String fileTest() throws Exception {
		return "/admin/filetest";
	}
	
}
