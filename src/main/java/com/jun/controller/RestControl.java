package com.jun.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jun.domain.EngBoardVO;
import com.jun.domain.SendVO;
import com.jun.persistence.EngBoardDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/tight")
public class RestControl {

	
	@Inject
	private EngBoardDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(RestControl.class);
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public SendVO testGET(EngBoardVO engboardVO) throws Exception {
		logger.info("test called POST");
		//dao.modify(engboardVO);
		SendVO sendVO = new SendVO();
		sendVO.setStatus("success");
		sendVO.setCall("Method");
		return sendVO;
	}
}
