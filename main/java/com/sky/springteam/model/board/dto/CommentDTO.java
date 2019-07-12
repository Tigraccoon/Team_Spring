package com.sky.springteam.model.board.dto;

import java.util.Date;

public class CommentDTO {
	
	private int c_num;			//댓글번호
	private int b_num;			//게시글번호	references team_board(b_num)
	private String c_writer;	//작성자		references team_user(userid)
	private String c_content;	//본문
	private Date c_date;		//댓글 작성일
	private String c_ip;		//작성자 ip
	private String c_show;		//댓글삭제여부
	private String c_secret;	//비밀댓글여부

	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getC_ip() {
		return c_ip;
	}
	public void setC_ip(String c_ip) {
		this.c_ip = c_ip;
	}
	public String getC_show() {
		return c_show;
	}
	public void setC_show(String c_show) {
		this.c_show = c_show;
	}
	public String getC_secret() {
		return c_secret;
	}
	public void setC_secret(String c_secret) {
		this.c_secret = c_secret;
	}
	@Override
	public String toString() {
		return "CommentDTO [c_num=" + c_num + ", b_num=" + b_num + ", c_writer=" + c_writer + ", c_content=" + c_content
				+ ", c_date=" + c_date + ", c_ip=" + c_ip + ", c_show=" + c_show + ", c_secret=" + c_secret + "]";
	}
	
}
