package com.sky.springteam.model.user.dto;

import java.util.Date;

public class UserDTO {
	
	//로그인시 user.변수명으로 세션에 등록 ex) user.userid : 아이디
	private String userid;		//아이디
	private String pwd;			//비밀번호
	private String name;		//이름
	private String email;		//이메일
	private String tel;			//전화번호
	private String zipcode;		//우편번호
	private String address1;	//주소
	private String address2;	//상세주소
	private Date joindate;		//가입일
	private Date lastlogin;		//마지막 로그인
	private String user_group;	//회원 그룹 - 1: 일반회원, 2: 강사, 3: 관리자 
	private String class_name;	//일반회원 : 수강중인 강의 / 강사 : 강의 과목
	private int cnt;			//회원 수
	
	//getter&setter
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public Date getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(Date lastlogin) {
		this.lastlogin = lastlogin;
	}
	public String getUser_group() {
		return user_group;
	}
	public void setUser_group(String user_group) {
		this.user_group = user_group;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	//toString
	@Override
	public String toString() {
		return "UserDTO [userid=" + userid + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", tel=" + tel
				+ ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2 + ", joindate="
				+ joindate + ", lastlogin=" + lastlogin + ", user_group=" + user_group + ", class_name=" + class_name
				+ ", cnt=" + cnt + "]";
	}
	
}
