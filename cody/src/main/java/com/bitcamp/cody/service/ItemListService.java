package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.ItemDao;
import com.bitcamp.cody.dto.ItemDto;

public class ItemListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private ItemDao dao;

	public List<ItemDto> getItemList() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectList();
		
		return list;
	}

	public ItemDto getListView(int idx) {
		
		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		ItemDto item = dao.selectByIdx(idx);
		
		return item;
	}

	public List<ItemDto> selectByMemberIdx(int memberIdx) {
		
		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> item = dao.selectByMemberIdx(memberIdx);
		
		return item;
	}

	public List<ItemDto> getListSearch(String name) {
		
		dao = sqlSessionTemplate.getMapper(ItemDao.class);			
		List<ItemDto> list = dao.selectByName(name);
		
		return list;
	} 

	 
}
