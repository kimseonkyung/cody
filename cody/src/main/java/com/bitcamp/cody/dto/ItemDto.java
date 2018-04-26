package com.bitcamp.cody.dto;

public class ItemDto {

	private int item_idx;
	private String item_name;
	private String item_brand;
	private String item_price;
	private String item_category;
	private String item_color;
	
	
	public ItemDto(int item_idx, String item_name, String item_brand, String item_price, String item_category,
			String item_color) {
		this.item_idx = item_idx;
		this.item_name = item_name;
		this.item_brand = item_brand;
		this.item_price = item_price;
		this.item_category = item_category;
		this.item_color = item_color;
	}

	public ItemDto() {

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

	public String getItem_price() {
		return item_price;
	}

	public void setItem_price(String item_price) {
		this.item_price = item_price;
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

	@Override
	public String toString() {
		return "ItemDto [item_idx=" + item_idx + ", item_name=" + item_name + ", item_brand=" + item_brand
				+ ", item_price=" + item_price + ", item_category=" + item_category + ", item_color=" + item_color
				+ "]";
	}

}
