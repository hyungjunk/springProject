package com.jun.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private Criteria cri;
	private int displayPerPage = 10;
	
	public PageMaker() {
	}
	
	public Criteria getCri() {
		return cri;
	}
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public void calcData() {
		endPage = (int)(Math.ceil((cri.getPage()/(double)displayPerPage)) * displayPerPage) ; 
		startPage = endPage-10+1;
		int tempEndPage = (int)Math.ceil((totalCount/(double)displayPerPage));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1? false: true;
		next = endPage*cri.getPerPageNum() >= totalCount ? false : true;
	}

	public String pageBuilder() {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", cri.getPage())
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		return uriComponents.toString();
	}
	
	public int getPageStart() {
		return (this.cri.getPage()-1) * cri.getPerPageNum(); 
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", cri=" + cri + ", displayPerPage=" + displayPerPage + "]";
	}
	
}
