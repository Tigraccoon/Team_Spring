package com.sky.springteam.model.board.dto;

import java.util.Date;

public class BoardDTO {
	private int b_num;			//게시글 번호
	private String b_category;	//카테고리
	private String b_writer;	//작성자 references team_user(userid)
	private String b_subject;	//제목
	private int b_point;		//별점
	private String b_content;	//본문
	private int b_readcount;	//조회수
	private Date b_date;		//게시일
	private String b_ip;		//작성자 ip
	private String b_show;		//삭제여부
	private String b_secret;	//비밀글여부
	private int b_count;		//글 갯수
	private int c_count;		//댓글 갯수
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_category() {
		return b_category;
	}
	public void setB_category(String b_category) {
		this.b_category = b_category;
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
	public int getB_point() {
		return b_point;
	}
	public void setB_point(int b_point) {
		this.b_point = b_point;
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
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	@Override
	public String toString() {
		return "BoardDTO [b_num=" + b_num + ", b_category=" + b_category + ", b_writer=" + b_writer + ", b_subject="
				+ b_subject + ", b_point=" + b_point + ", b_content=" + b_content + ", b_readcount=" + b_readcount
				+ ", b_date=" + b_date + ", b_ip=" + b_ip + ", b_show=" + b_show + ", b_secret=" + b_secret
				+ ", b_count=" + b_count + ", c_count=" + c_count + "]";
	}
	
	
	
}
