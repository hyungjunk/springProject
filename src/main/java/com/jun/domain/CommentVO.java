package com.jun.domain;

import java.util.Date;

public class CommentVO {

	private int cid;
	private String uid;
	private String ucomment;
	private Date regdate;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUcomment() {
		return ucomment;
	}
	public void setUcomment(String ucomment) {
		this.ucomment = ucomment;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "CommentVO [cid=" + cid + ", uid=" + uid + ", ucomment=" + ucomment + ", regdate=" + regdate + "]";
	}
	
}
