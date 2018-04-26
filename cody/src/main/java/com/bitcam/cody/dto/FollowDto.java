package com.bitcam.cody.dto;

public class FollowDto {

	private int follow_idx;
	private int member_idx;
	private int member_idx2;

	public int getFollow_idx() {
		return follow_idx;
	}
	
	
	

	public FollowDto(int follow_idx, int member_idx, int member_idx2) {
		this.follow_idx = follow_idx;
		this.member_idx = member_idx;
		this.member_idx2 = member_idx2;
	}



	public void setFollow_idx(int follow_idx) {
		this.follow_idx = follow_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getMember_idx2() {
		return member_idx2;
	}

	public void setMember_idx2(int member_idx2) {
		this.member_idx2 = member_idx2;
	}

	@Override
	public String toString() {
		return "FollowDto [follow_idx=" + follow_idx + ", member_idx=" + member_idx + ", member_idx2=" + member_idx2
				+ "]";
	}

}
