package com.jun.domain;

public class SearchCriteria extends Criteria {
	
	private String genre;
	private String searchType;
	private String keyword;

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteria [genre=" + genre + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
