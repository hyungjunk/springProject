package com.jun.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/asd")
	public String doA(Locale locale, Model model) {
		return "/mov/board";
	}
	
	@RequestMapping("/doA*")
	public String doAdoA(Locale locale, Model model) {
		System.out.println("do A do A called");
		model.addAttribute("result", "DOA* RESULT");
		return "doA";
	}
	
	@RequestMapping("/doB")
	public String doB(Locale locale, Model model) {
		System.out.println("do B called");
		model.addAttribute("result", "DOB RESULT");
		return "doA";
	}
}