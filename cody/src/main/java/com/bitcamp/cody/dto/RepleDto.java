package com.bitcamp.cody.dto;

import java.util.Date;

public class RepleDto {

	private int reple_idx;
	private int regroup;	// 그룹
	private int reparent;	// 부모
	private int redepth;		// 깊이
	private int reorder;		// 순서
	private String reple_contents;
	private Date reple_date;
	private int member_idx;
	private int cody_idx;
	private boolean reception;

	public RepleDto() {
	}

	public RepleDto(int reple_idx, int regroup, int reparent, int redepth, int reorder, String reple_contents,
			Date reple_date, int member_idx, int cody_idx, boolean reception) {
		super();
		this.reple_idx = reple_idx;
		this.regroup = regroup;
		this.reparent = reparent;
		this.redepth = redepth;
		this.reorder = reorder;
		this.reple_contents = reple_contents;
		this.reple_date = reple_date;
		this.member_idx = member_idx;
		this.cody_idx = cody_idx;
		this.reception = reception;
	}

	public int getReple_idx() {
		return reple_idx;
	}

	public void setReple_idx(int reple_idx) {
		this.reple_idx = reple_idx;
	}

	public int getRegroup() {
		return regroup;
	}

	public void setRegroup(int regroup) {
		this.regroup = regroup;
	}

	public int getReparent() {
		return reparent;
	}

	public void setReparent(int reparent) {
		this.reparent = reparent;
	}

	public int getRedepth() {
		return redepth;
	}

	public void setRedepth(int redepth) {
		this.redepth = redepth;
	}

	public int getReorder() {
		return reorder;
	}

	public void setReorder(int reorder) {
		this.reorder = reorder;
	}

	public String getReple_contents() {
		return reple_contents;
	}

	public void setReple_contents(String reple_contents) {
		this.reple_contents = reple_contents;
	}

	public Date getReple_date() {
		return reple_date;
	}

	public void setReple_date(Date reple_date) {
		this.reple_date = reple_date;
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

	public boolean isReception() {
		return reception;
	}

	public void setReception(boolean reception) {
		this.reception = reception;
	}

	@Override
	public String toString() {
		return "RepleDto [reple_idx=" + reple_idx + ", regroup=" + regroup + ", reparent=" + reparent + ", redepth="
				+ redepth + ", reorder=" + reorder + ", reple_contents=" + reple_contents + ", reple_date=" + reple_date
				+ ", member_idx=" + member_idx + ", cody_idx=" + cody_idx + ", reception=" + reception + "]";
	}

	

	

	
}
