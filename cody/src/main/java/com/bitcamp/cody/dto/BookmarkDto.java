package com.bitcamp.cody.dto;

public class BookmarkDto {

	private int bookmark_idx;
	private int member_idx;
	private int cody_idx;
	private String cody_image;

	public BookmarkDto() {

	}

	public BookmarkDto(int bookmark_idx, int member_idx, int cody_idx, String cody_image) {
		super();
		this.bookmark_idx = bookmark_idx;
		this.member_idx = member_idx;
		this.cody_idx = cody_idx;
		this.cody_image = cody_image;
	}

	

	
	public int getBookmark_idx() {
		return bookmark_idx;
	}

	public void setBookmark_idx(int bookmark_idx) {
		this.bookmark_idx = bookmark_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
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

	@Override
	public String toString() {
		return "BookmarkDto [bookmark_idx=" + bookmark_idx + ", member_idx=" + member_idx + ", cody_idx=" + cody_idx
				+ ", cody_image=" + cody_image +  "]";
	}
		
	
	
}
