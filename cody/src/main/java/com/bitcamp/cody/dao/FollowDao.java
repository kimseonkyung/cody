package com.bitcamp.cody.dao;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.cody.dto.FollowDto;
import com.bitcamp.cody.dto.MemberDto;

public interface FollowDao {

	public int insertfollowin(HashMap map);

	public List<FollowDto> selectListrp(int m_response);

	public MemberDto selectrequet(int m_request);

	public int updatefollow(HashMap map);

	public int deletefollow(int followidx);

	public List<FollowDto> selectListrq(int m_request);

	public MemberDto selectresponse(int m_reseponse);

	public int followrqCount(int m_request);

	public int followrpCount(int m_response);

	public FollowDto selectfollowpq(FollowDto follow);

}
