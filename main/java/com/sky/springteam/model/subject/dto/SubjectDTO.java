package com.sky.springteam.model.subject.dto;

import org.springframework.web.multipart.MultipartFile;

public class SubjectDTO {
	
	private String subject_name; // 강의명
	private String description; // 강의 설명
	private String prof_name; // 강사명
	private String price; // 강의 수강료
	private int p_num; // 수강인원
	private String subject_date; // 강의 기간
	private String img_url; // 이미지
	private MultipartFile file1; // 첨부파일
	
	// getter,setter, toString()
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getSubject_date() {
		return subject_date;
	}
	public void setSubject_date(String subject_date) {
		this.subject_date = subject_date;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "SubjectDTO [subject_name=" + subject_name + ", description=" + description + ", prof_name=" + prof_name
				+ ", price=" + price + ", p_num=" + p_num + ", subject_date=" + subject_date + ", img_url=" + img_url
				+ ", file1=" + file1 + "]";
	}
	

}
