package com.jun.domain;

import java.util.Date;

public class MovBoardVO {

	private int mid;
	private String name;
	private String contents;
	private String runtime;
	private Date regdate;
	private Date moddate;
	private int viewcnt;
	private String imgpath;
	
	public MovBoardVO() {
	}
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModdate() {
		return moddate;
	}
	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	@Override
	public String toString() {
		return "MovBoardVO [mid=" + mid + ", name=" + name + ", contents=" + contents + ", runtime=" + runtime
				+ ", regdate=" + regdate + ", moddate=" + moddate + ", viewcnt=" + viewcnt + ", imgpath=" + imgpath
				+ "]";
	}
	
}
