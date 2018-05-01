package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.MemberDto;

public interface LoginDao {
	
	public MemberDto selectById(String id);
	public int insertMember(MemberDto member);
	public int modifyMember(MemberDto member);
	public int deleteMember(String id);
	public List<MemberDto> selectList();
	//public int selectCount();

}
