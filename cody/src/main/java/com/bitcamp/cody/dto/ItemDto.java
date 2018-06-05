package com.bitcamp.cody.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ItemDto {

	private int item_idx;
	private String item_name;
	private String item_brand;
	private String item_image;
	private int item_price;
	private String item_link;
	private String item_category;
	private String item_color;
	private int cody_idx;
	private int member_idx;
	private MultipartFile photofile;

	public ItemDto() {

	}

	public ItemDto(int item_idx, String item_name, String item_brand, String item_image, int item_price,
			String item_link, String item_category, String item_color, int cody_idx, int member_idx,
			MultipartFile photofile) {
		super();
		this.item_idx = item_idx;
		this.item_name = item_name;
		this.item_brand = item_brand;
		this.item_image = item_image;
		this.item_price = item_price;
		this.item_link = item_link;
		this.item_category = item_category;
		this.item_color = item_color;
		this.cody_idx = cody_idx;
		this.member_idx = member_idx;
		this.photofile = photofile;
	}

	public int getItem_idx() {
		return item_idx;
	}

	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_brand() {
		return item_brand;
	}

	public void setItem_brand(String item_brand) {
		this.item_brand = item_brand;
	}

	public String getItem_image() {
		return item_image;
	}

	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public String getItem_link() {
		return item_link;
	}

	public void setItem_link(String item_link) {
		this.item_link = item_link;
	}

	public String getItem_category() {
		return item_category;
	}

	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}

	public String getItem_color() {
		return item_color;
	}

	public void setItem_color(String item_color) {
		this.item_color = item_color;
	}

	public int getCody_idx() {
		return cody_idx;
	}

	public void setCody_idx(int cody_idx) {
		this.cody_idx = cody_idx;
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

	@Override
	public String toString() {
		return "ItemDto [item_idx=" + item_idx + ", item_name=" + item_name + ", item_brand=" + item_brand
				+ ", item_image=" + item_image + ", item_price=" + item_price + ", item_link=" + item_link
				+ ", item_category=" + item_category + ", item_color=" + item_color + ", cody_idx=" + cody_idx
				+ ", member_idx=" + member_idx + ", photofile=" + photofile + "]";
	}

	

}