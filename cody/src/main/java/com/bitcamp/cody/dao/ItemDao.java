package com.bitcamp.cody.dao;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.cody.dto.ItemDto;

public interface ItemDao {

	public int insertItem(ItemDto item);
	public ItemDto selectByIdx(int idx);
	public List<ItemDto> selectByMemberIdx(int memberIdx);
	public List<ItemDto> selectList();
	public List<ItemDto> selectByName(String name);
	public int updateItem(ItemDto item);
	public int deleteItem(int idx);
	public int insertListItem(ArrayList<ItemDto> list);
}
    