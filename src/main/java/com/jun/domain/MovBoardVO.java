package com.jun.domain;

import java.util.Date;

public class MovBoardVO {

	private int mid;
	private String name;
	private String contents;
	private String runtime;
	private Date regdate;
	private Date updatedate;
	private int viewcnt;
	private String tier;
	private String imgpath;
	private String imgpathInnerBig;
	private String imgpathInnerSmall;
	
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

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
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
	
	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public String getImgpathInnerBig() {
		return imgpathInnerBig;
	}

	public void setImgpathInnerBig(String imgpathInnerBig) {
		this.imgpathInnerBig = imgpathInnerBig;
	}

	public String getImgpathInnerSmall() {
		return imgpathInnerSmall;
	}

	public void setImgpathInnerSmall(String imgpathInnerSmall) {
		this.imgpathInnerSmall = imgpathInnerSmall;
	}

	@Override
	public String toString() {
		return "MovBoardVO [mid=" + mid + ", name=" + name + ", contents=" + contents + ", runtime=" + runtime
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", viewcnt=" + viewcnt + ", imgpath=" + imgpath
				+ ", tier=" + tier + "]";
	}
	
}
