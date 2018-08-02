package com.jun.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jun.domain.LoginDTO;
import com.jun.domain.UserVO;
import com.jun.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Inject
	private UserService service;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginGET(LoginDTO dto) {
		return "/user/login";
	}
	
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) throws Exception{
		UserVO vo = service.login(dto);
		if (vo == null) {
			rttr.addFlashAttribute("msg", "FAIL");
			return "redirect:/user/login";
		} else {
			model.addAttribute("userVO", vo);
			return "/user/loginPost";
		}
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) throws Exception{
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/user/login";
	}
	
}
