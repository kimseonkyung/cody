package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;

public interface SearchDao {
	
	public List<ItemDto> searchItem(String keyword1);
	public List<ItemDto> searchItemMan();
	public List<ItemDto> searchItemWoman();
	public List<CodyDto> searchCody(String keyword2);
	public List<CodyDto> searchCodyMan();
	public List<CodyDto> searchCodyWoman();
	public List<MemberDto> searchMember(String keyword3);
	public List<MemberDto> searchMemberMan();
	public List<MemberDto> searchMemberWoman();
	public MemberDto selectId(int member_idx);		
	
}
