package com.sky.springteam.model.mypage.dto;

public class MypageDTO {
	
	private int cart_id; //cart 아이디(시퀀스)
	private String subject_name; //강의 이름
	private String userid; //수강생 아이디 재호형한테 데이터 베이스 변수명 물어봐야됨
	private String name;//수강생 이름 재호형한테 데이터베이스 변수명 물어봐야됨
	private String prof_name; //강사명
	private String subject_date; //강의 기간
	private int price; //강의 금액
	private int money;
	private int amount;
	private String img_url;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}
	public String getSubject_date() {
		return subject_date;
	}
	public void setSubject_date(String subject_date) {
		this.subject_date = subject_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	@Override
	public String toString() {
		return "MypageDTO [cart_id=" + cart_id + ", subject_name=" + subject_name + ", userid=" + userid + ", name="
				+ name + ", prof_name=" + prof_name + ", subject_date=" + subject_date + ", price=" + price + ", money="
				+ money + ", amount=" + amount + ", img_url=" + img_url + "]";
	}
	
	
	
	
}
