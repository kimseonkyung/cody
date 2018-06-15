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
	public List<ItemDto> selectListMan();
	public List<ItemDto> selectListWoman();
	public List<ItemDto> selectListCap();
	public List<ItemDto> selectListCapMan();
	public List<ItemDto> selectListCapWoman();
	public List<ItemDto> selectListTop();
	public List<ItemDto> selectListTopMan();
	public List<ItemDto> selectListTopWoman();
	public List<ItemDto> selectListBot();
	public List<ItemDto> selectListBotMan();
	public List<ItemDto> selectListBotWoman();
	public List<ItemDto> selectListOut();
	public List<ItemDto> selectListOutMan();
	public List<ItemDto> selectListOutWoman();
	public List<ItemDto> selectListShoe();
	public List<ItemDto> selectListShoeMan();
	public List<ItemDto> selectListShoeWoman();
	public List<ItemDto> selectListAcc();
	public List<ItemDto> selectListAccMan();
	public List<ItemDto> selectListAccWoman();
	public List<ItemDto> selectByName(String name);
	public List<ItemDto> selectByCodyIdx(int codyIdx);
	public int itemCount(int memberIdx);
	
}
    