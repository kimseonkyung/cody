package com.bitcamp.cody.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CodyDto {

	private int cody_idx;
	private String cody_image;
	private String cody_title;
	private String cody_intro;
	private boolean cody_gender;
	private int cody_height;
	private int cody_age;
	private int board_click;
	private Date board_date;
	private int cody_like;
	private int member_idx;
	private MultipartFile photofile;
	private List<ItemDto> itemList;
	
	public CodyDto() {
	}

	public CodyDto(int cody_idx, String cody_image, String cody_title, String cody_intro, boolean cody_gender,
			int cody_height, int cody_age, int board_click, Date board_date, int cody_like, int member_idx,
			MultipartFile photofile, List<ItemDto> itemList) {
		super();
		this.cody_idx = cody_idx;
		this.cody_image = cody_image;
		this.cody_title = cody_title;
		this.cody_intro = cody_intro;
		this.cody_gender = cody_gender;
		this.cody_height = cody_height;
		this.cody_age = cody_age;
		this.board_click = board_click;
		this.board_date = board_date;
		this.cody_like = cody_like;
		this.member_idx = member_idx;
		this.photofile = photofile;
		this.itemList = itemList;
	}

	public int getCody_idx() {
		return cody_idx;
	}

	public void setCody_idx(int cody_idx) {
		this.cody_idx = cody_idx;
	}

	public String getCody_image() {
		return cody_image;
	}

	public void setCody_image(String cody_image) {
		this.cody_image = cody_image;
	}

	public String getCody_title() {
		return cody_title;
	}

	public void setCody_title(String cody_title) {
		this.cody_title = cody_title;
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

	public int getCody_height() {
		return cody_height;
	}

	public void setCody_height(int cody_height) {
		this.cody_height = cody_height;
	}

	public int getCody_age() {
		return cody_age;
	}

	public void setCody_age(int cody_age) {
		this.cody_age = cody_age;
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

	public int getCody_like() {
		return cody_like;
	}

	public void setCody_like(int cody_like) {
		this.cody_like = cody_like;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public MultipartFile getPhotofile() {
		return photofile;
	}

	public void setPhotofile(MultipartFile photofile) {
		this.photofile = photofile;
	}

	public List<ItemDto> getItemList() {
		return itemList;
	}

	public void setItemList(List<ItemDto> itemList) {
		this.itemList = itemList;
	}

	@Override
	public String toString() {
		return "CodyDto [cody_idx=" + cody_idx + ", cody_image=" + cody_image + ", cody_title=" + cody_title
				+ ", cody_intro=" + cody_intro + ", cody_gender=" + cody_gender + ", cody_height=" + cody_height
				+ ", cody_age=" + cody_age + ", board_click=" + board_click + ", board_date=" + board_date
				+ ", cody_like=" + cody_like + ", member_idx=" + member_idx + ", photofile=" + photofile + ", itemList="
				+ itemList + "]";
	}

	
	
	

}
