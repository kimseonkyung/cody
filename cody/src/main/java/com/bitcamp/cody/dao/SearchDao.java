package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;

public interface SearchDao {
	
	public List<ItemDto> searchItem(String keyword);
	public List<CodyDto> searchCody(String keyword);
	public List<MemberDto> searchMember(String keyword);
			
	
}
