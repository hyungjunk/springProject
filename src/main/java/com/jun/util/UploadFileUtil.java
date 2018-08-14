package com.jun.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UploadFileUtil {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtil.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		return null;
	}
	
	// 오늘 날짜를 String으로 리턴받는 함수 (함수 이해는 못한채 그냥 쓰고 있다. ㅇ.ㅇ..)
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		String monthPath = 
				yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = 
				monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, datePath);
		logger.info(datePath);
		return datePath;
	}
	
	// 연-월-일-파일명으로 폴더를 만드는 메소드 (이해하지 못했다..... 일단 코드 배껴보자..)
	private static void makeDir(String uploadPath, String... paths) {
		if (new File(paths[paths.length-1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (! dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	
	// 썸네일을 만드는 메소드.  Scalr 라이브러리 사용 (Scalr는 외부 라이브러리 이므로 Maven을 이용해 다운로드 받아야 함)
	// 
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		String thumbnailName = uploadPath + path + File.separator+"s_"+fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
}
