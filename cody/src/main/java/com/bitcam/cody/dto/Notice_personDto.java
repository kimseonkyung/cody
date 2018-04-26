package com.bitcam.cody.dto;

import java.util.Date;

public class Notice_personDto {

	private int notice_idx;
	private String notice_title;
	private String notice_contents;
	private int board_click;
	private Date board_date;
	private int board_like;
	private int man_idx;
	private int member_idx;
	
	public Notice_personDto(int notice_idx, String notice_title, String notice_contents, int board_click,
			Date board_date, int board_like, int man_idx, int member_idx) {
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.board_click = board_click;
		this.board_date = board_date;
		this.board_like = board_like;
		this.man_idx = man_idx;
		this.member_idx = member_idx;
	}

	public Notice_personDto() {

	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_contents() {
		return notice_contents;
	}

	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
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

	public int getMan_idx() {
		return man_idx;
	}

	public void setMan_idx(int man_idx) {
		this.man_idx = man_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	@Override
	public String toString() {
		return "Notice_personDto [notice_idx=" + notice_idx + ", notice_title=" + notice_title + ", notice_contents="
				+ notice_contents + ", board_click=" + board_click + ", board_date=" + board_date + ", board_like="
				+ board_like + ", man_idx=" + man_idx + ", member_idx=" + member_idx + "]";
	}

}
