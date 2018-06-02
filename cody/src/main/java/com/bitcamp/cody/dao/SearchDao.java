package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;

public interface SearchDao {
	
	public List<ItemDto> searchItem(String keyword1);
	public List<CodyDto> searchCody(String keyword2);
	public List<MemberDto> searchMember(String keyword3);
			
	
}
