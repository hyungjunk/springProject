package com.jun.domain;

import java.util.Date;

public class EngBoardVO {
	
	private int bid;
	private String word;
	private String dialogue;
	private String practice;
	private Date regdate;
	private Date updatedate;
	
	public EngBoardVO() {
	}

	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getDialogue() {
		return dialogue;
	}
	public void setDialogue(String dialogue) {
		this.dialogue = dialogue;
	}
	public String getPractice() {
		return practice;
	}
	public void setPractice(String practice) {
		this.practice = practice;
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

	@Override
	public String toString() {
		return "EngBoardVO [word=" + word + ", dialogue=" + dialogue + ", practice=" + practice + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + "]";
	}
}
