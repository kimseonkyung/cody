package com.bitcamp.cody.dto;


public class FollowDto {

	private int follow_idx;
	private int m_request;
	private int m_response;

	public int getFollow_idx() {
		return follow_idx;
	}

	public FollowDto(int follow_idx, int m_request, int m_response) {
		this.follow_idx = follow_idx;
		this.m_request = m_request;
		this.m_response = m_response;
	}
	

	public int getM_request() {
		return m_request;
	}

	public void setM_request(int m_request) {
		this.m_request = m_request;
	}

	public int getM_response() {
		return m_response;
	}

	public void setM_response(int m_response) {
		this.m_response = m_response;
	}

	public void setFollow_idx(int follow_idx) {
		this.follow_idx = follow_idx;
	}

	@Override
	public String toString() {
		return "FollowDto [follow_idx=" + follow_idx + ", m_request=" + m_request + ", m_response=" + m_response + "]";
	}

}
