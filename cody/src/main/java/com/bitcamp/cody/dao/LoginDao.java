package com.bitcamp.cody.dao;

import java.util.List;


import com.bitcamp.cody.dto.MemberDto;

public interface LoginDao {
	
	
	public MemberDto selectById(String id);
	public MemberDto selectByIdx2(int idx);
	public int insertMember(MemberDto member);
	public int modifyMember(MemberDto member);
	public int deleteMember(String id);
	public List<MemberDto> selectList();
	public List<MemberDto> findId(MemberDto member);
	public List<MemberDto> selectByIdx1(int idx);
    public MemberDto idchk(String str);

	
	//public int selectCount();
	
	

}
