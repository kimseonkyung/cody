package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.ItemDto;

public interface ItemDao {

	public int insertItem(ItemDto item);
	public ItemDto selectByIdx(String idx);
	public List<ItemDto> selectList();
	public List<ItemDto> selectById(String name);
}
