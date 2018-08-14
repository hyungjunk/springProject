package com.jun.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class FileUploadController {

	@Resource(name="uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	
	// File명과 File 바이너리를 받아 Unique한 랜덤문자열을 추가하고 실제 FileUpload를 진행
	// FileCopyUtils.copy는 스프링에서 제공하는 Function
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName; 
	}
	
	@RequestMapping(value="/uploadfile")
	public String uploadForm() {
		return "/admin/uploadfile";
	}
	
	@RequestMapping(value="/uploadajax", method=RequestMethod.GET)
	public String uploadajax() {
		return "/admin/uploadajax";
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadajax", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		return new ResponseEntity<>(file.getOriginalFilename(), HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {
		logger.info("original Name : "+ file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("content Type : " + file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);
		return "/admin/uploadResult";
	}
}
