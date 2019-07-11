package com.sky.springteam.model.board.dto;

import java.util.Date;

public class BoardDTO {
	private int b_num;
	private String b_writer;
	private String b_subject;
	private String b_content;
	private int b_readcount;
	private Date b_date;
	private String b_ip;
	private String b_show;
	private String b_secret;
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_readcount() {
		return b_readcount;
	}
	public void setB_readcount(int b_readcount) {
		this.b_readcount = b_readcount;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	public String getB_show() {
		return b_show;
	}
	public void setB_show(String b_show) {
		this.b_show = b_show;
	}
	public String getB_secret() {
		return b_secret;
	}
	public void setB_secret(String b_secret) {
		this.b_secret = b_secret;
	}
	@Override
	public String toString() {
		return "BoardDTO [b_num=" + b_num + ", b_writer=" + b_writer + ", b_subject=" + b_subject + ", b_content="
				+ b_content + ", b_readcount=" + b_readcount + ", b_date=" + b_date + ", b_ip=" + b_ip + ", b_show="
				+ b_show + ", b_secret=" + b_secret + "]";
	}
	
}
