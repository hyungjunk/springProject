package com.jun.domain;

import java.util.Date;

public class ReplyVO {
	
	private Integer rid;
	private Integer mid;
	private String uname;
	private String utext;
	private Date regdate;
	
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUtext() {
		return utext;
	}
	public void setUtext(String utext) {
		this.utext = utext;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", mid=" + mid + ", uname=" + uname + ", utext=" + utext + ", regdate=" + regdate
				+ "]";
	}

}
