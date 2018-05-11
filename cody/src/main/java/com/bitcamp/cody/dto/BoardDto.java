package com.bitcamp.cody.dto;

import java.util.Date;

public class BoardDto{

	private int board_idx;
	private String board_title;
	private String board_contents;
	private int board_click;
	private Date board_date;
	private int board_like;
	private int man_idx;
	private String name;

	public BoardDto() {

	}

	public BoardDto(int board_idx, String board_title, String board_contents, int board_click, Date board_date,
			int board_like, int man_idx, String name) {
		super();
		this.board_idx = board_idx;
		this.board_title = board_title;
		this.board_contents = board_contents;
		this.board_click = board_click;
		this.board_date = board_date;
		this.board_like = board_like;
		this.man_idx = man_idx;
		this.name = name;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_contents() {
		return board_contents;
	}

	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "BoardDto [board_idx=" + board_idx + ", board_title=" + board_title + ", board_contents="
				+ board_contents + ", board_click=" + board_click + ", board_date=" + board_date + ", board_like="
				+ board_like + ", man_idx=" + man_idx + ", name=" + name + "]";
	}

	
	

}
