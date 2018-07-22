package com.jun.domain;

public class PageMaker2 {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private Criteria cri;
	private int displayPerPage = 10;
	
	public PageMaker2() {
	}
	public void totalCount() {
		this.endPage = (int)(Math.ceil(cri.getPage()/(double)this.displayPerPage)*this.displayPerPage); //double을 꼭 써줘야함
		this.startPage = endPage - 9;
		int tempEndPage = (int) Math.ceil((totalCount/(double)this.cri.getPerPageNum())); // why 다른 곳에선 displayperpage?
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		this.prev = startPage == 1 ? false:true;
		this.next = endPage >= tempEndPage+1 ? true: false;
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
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		totalCount();
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	@Override
	public String toString() {
		return "PageMaker2 [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", cri=" + cri + ", displayPerPage=" + displayPerPage + "]";
	}
	
	
	
}
