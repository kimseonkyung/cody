package com.bitcamp.cody.dto;

import java.util.Date;

public class CodyDto {

	private int cody_idx;
	private String cody_image;
	private String cody_intro;
	private boolean cody_gender;
	private int cody_heigft;
	private int board_click;
	private Date board_date;
	private int board_like;
	private int member_idx;

	public int getCody_idx() {
		return cody_idx;
	}
	

	public CodyDto(int cody_idx, String cody_image, String cody_intro, boolean cody_gender, int cody_heigft,
			int board_click, Date board_date, int board_like, int member_idx) {
		this.cody_idx = cody_idx;
		this.cody_image = cody_image;
		this.cody_intro = cody_intro;
		this.cody_gender = cody_gender;
		this.cody_heigft = cody_heigft;
		this.board_click = board_click;
		this.board_date = board_date;
		this.board_like = board_like;
		this.member_idx = member_idx;
	}

	public String getCody_image() {
		return cody_image;
	}

	public void setCody_image(String cody_image) {
		this.cody_image = cody_image;
	}

	public String getCody_intro() {
		return cody_intro;
	}

	public void setCody_intro(String cody_intro) {
		this.cody_intro = cody_intro;
	}

	public boolean isCody_gender() {
		return cody_gender;
	}

	public void setCody_gender(boolean cody_gender) {
		this.cody_gender = cody_gender;
	}

	public int getCody_heigft() {
		return cody_heigft;
	}

	public void setCody_heigft(int cody_heigft) {
		this.cody_heigft = cody_heigft;
	}

	public int getBoard_click() {
		return board_click;
	}

	public void setBoard_click(int board_click) {
		this.board_click = board_click;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public void setCody_idx(int cody_idx) {
		this.cody_idx = cody_idx;
	}

	@Override
	public String toString() {
		return "CodyDto [cody_idx=" + cody_idx + ", cody_image=" + cody_image + ", cody_intro=" + cody_intro
				+ ", cody_gender=" + cody_gender + ", cody_heigft=" + cody_heigft + ", board_click=" + board_click
				+ ", board_date=" + board_date + ", board_like=" + board_like + ", member_idx=" + member_idx + "]";
	}

}
