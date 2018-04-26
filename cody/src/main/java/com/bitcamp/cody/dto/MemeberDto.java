package com.bitcamp.cody.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemeberDto {

	private int member_idx;
	private String member_name;
	private String member_id;
	private String member_pw;
	private String member_birth;
	private String member_email;
	private String member_ph;
	private Date member_reg;
	private String member_photo;
	private MultipartFile photofile;

	public MemeberDto() {

	}

	public MemeberDto(int member_idx, String member_name, String member_id, String member_pw, String member_birth,
			String member_email, String member_ph, Date member_reg, String member_photo, MultipartFile photofile) {
		super();
		this.member_idx = member_idx;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_birth = member_birth;
		this.member_email = member_email;
		this.member_ph = member_ph;
		this.member_reg = member_reg;
		this.member_photo = member_photo;
		this.photofile = photofile;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_ph() {
		return member_ph;
	}

	public void setMember_ph(String member_ph) {
		this.member_ph = member_ph;
	}

	public Date getMember_reg() {
		return member_reg;
	}

	public void setMember_reg(Date member_reg) {
		this.member_reg = member_reg;
	}

	public String getMember_photo() {
		return member_photo;
	}

	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}

	public MultipartFile getPhotofile() {
		return photofile;
	}

	public void setPhotofile(MultipartFile photofile) {
		this.photofile = photofile;
	}

	@Override
	public String toString() {
		return "MemeberDto [member_idx=" + member_idx + ", member_name=" + member_name + ", member_id=" + member_id
				+ ", member_pw=" + member_pw + ", member_birth=" + member_birth + ", member_email=" + member_email
				+ ", member_ph=" + member_ph + ", member_reg=" + member_reg + ", member_photo=" + member_photo
				+ ", photofile=" + photofile + "]";
	}

}
