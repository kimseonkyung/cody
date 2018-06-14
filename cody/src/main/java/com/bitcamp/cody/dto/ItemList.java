package com.bitcamp.cody.dto;

import java.util.List;

public class ItemList {
	private List<ItemDto> itemList;

	public ItemList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItemList(List<ItemDto> itemList) {
		super();
		this.itemList = itemList;
	}

	public List<ItemDto> getItemList() {
		return itemList;
	}
	public List<ItemDto> getItemListCap() {
		return itemList;
	}
	public List<ItemDto> getItemListTop() {
		return itemList;
	}
	public List<ItemDto> getItemListBot() {
		return itemList;
	}
	public List<ItemDto> getItemListOut() {
		return itemList;
	}
	public List<ItemDto> getItemListShoe() {
		return itemList;
	}
	public List<ItemDto> getItemListAcc() {
		return itemList;
	}

	public void setItemList(List<ItemDto> itemList) {
		this.itemList = itemList;
	}

	@Override
	public String toString() {
		return "ItemList [itemList=" + itemList + "]";
	}

	

}
