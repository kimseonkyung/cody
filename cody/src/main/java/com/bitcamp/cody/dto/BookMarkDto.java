package com.bitcamp.cody.dto;


public class BookMarkDto {

	private int bookmark_idx;
	private int member_idx;
	private int cody_idx;
		
	
	public BookMarkDto() {
	
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
	
	
	@Override
	public String toString() {
		return "BookMarkDto [bookmark_idx=" + bookmark_idx + ", member_idx=" + member_idx + ", cody_idx=" + cody_idx
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
}
