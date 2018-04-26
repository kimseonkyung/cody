package com.bitcamp.cody.dto;

public class ManagerDto {

	private int man_idx;
	private String man_id;
	private String man_pw;

	public ManagerDto() {

	}

	public ManagerDto(int man_idx, String man_id, String man_pw) {
		this.man_idx = man_idx;
		this.man_id = man_id;
		this.man_pw = man_pw;
	}

	public int getMan_idx() {
		return man_idx;
	}

	public void setMan_idx(int man_idx) {
		this.man_idx = man_idx;
	}

	public String getMan_id() {
		return man_id;
	}

	public void setMan_id(String man_id) {
		this.man_id = man_id;
	}

	public String getMan_pw() {
		return man_pw;
	}

	public void setMan_pw(String man_pw) {
		this.man_pw = man_pw;
	}

	@Override
	public String toString() {
		return "ManagerDto [man_idx=" + man_idx + ", man_id=" + man_id + ", man_pw=" + man_pw + "]";
	}

}
