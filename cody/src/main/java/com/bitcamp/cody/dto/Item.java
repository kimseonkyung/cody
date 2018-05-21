package com.bitcamp.cody.dto;

public class Item {
	private String title;
	private String link;
	private String image;
	private String lprice;
	private String hprice;
	private String mallName;
	private String productId;

	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Item(String title, String link, String image, String lprice, String hprice, String mallName,
			String productId) {
		super();
		this.title = title;
		this.link = link;
		this.image = image;
		this.lprice = lprice;
		this.hprice = hprice;
		this.mallName = mallName;
		this.productId = productId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getLprice() {
		return lprice;
	}

	public void setLprice(String lprice) {
		this.lprice = lprice;
	}

	public String getHprice() {
		return hprice;
	}

	public void setHprice(String hprice) {
		this.hprice = hprice;
	}

	public String getMallName() {
		return mallName;
	}

	public void setMallName(String mallName) {
		this.mallName = mallName;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	@Override
	public String toString() {
		return "Item [title=" + title + ", link=" + link + ", image=" + image + ", lprice=" + lprice + ", hprice="
				+ hprice + ", mallName=" + mallName + ", productId=" + productId + "]";
	}

}
