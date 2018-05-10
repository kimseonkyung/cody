package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;

public interface CodyTimeListDao {
	
	public List<CodyDto> selectList();
	public List<ItemDto> selectList1(int cody_idx);

	
	
	 
	 
	

}
 