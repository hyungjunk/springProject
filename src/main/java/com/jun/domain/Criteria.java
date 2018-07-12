package com.jun.domain;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;
	}
	
	public int getPage() {
		if (page < 0) {
			page = 1;
		}
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPerPageNum() {
		if (perPageNum > 100 || perPageNum < 5) {
			perPageNum = 10;
		}
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart() {
		return (this.page-1) * perPageNum; 
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
}
