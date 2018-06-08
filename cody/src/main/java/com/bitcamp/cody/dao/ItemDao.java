package com.bitcamp.cody.dao;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.cody.dto.ItemDto;

public interface ItemDao {

	public ItemDto selectByIdx(int idx);
	public int insertItem(ItemDto item);
	public int updateItem(ItemDto item);
	public int deleteItem(int itemIdx);
	public int deleteCodyItem(int codyIdx);
	public int insertListItem(List<ItemDto> list);
	public List<ItemDto> selectByMemberIdx(int memberIdx);
	public List<ItemDto> selectList();
	public List<ItemDto> selectByName(String name);
	public List<ItemDto> selectByCodyIdx(int codyIdx);
	public int itemCount(int memberIdx);
	
}
    