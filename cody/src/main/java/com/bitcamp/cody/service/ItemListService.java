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
	public List<ItemDto> getItemListCap() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListCap();
		
		return list;
	}
	public List<ItemDto> getItemListCapMan() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListCapMan();
		
		return list;
	}
	public List<ItemDto> getItemListCapWoman() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListCapWoman();
		
		return list;
	}
	public List<ItemDto> getItemListTop() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListTop();
		
		return list;
	}
	public List<ItemDto> getItemListTopMan() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListTopMan();
		
		return list;
	}
	public List<ItemDto> getItemListTopWoman() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListTopWoman();
		
		return list;
	}
	
	public List<ItemDto> getItemListBot() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListBot();
		
		return list;
	}
	public List<ItemDto> getItemListBotMan() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListBotMan();
		
		return list;
	}
	public List<ItemDto> getItemListBotWoman() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListBotWoman();
		
		return list;
	}
	public List<ItemDto> getItemListOut() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListOut();
		
		return list;
	}
	public List<ItemDto> getItemListOutMan() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListOutMan();
		
		return list;
	}
	public List<ItemDto> getItemListOutWoman() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListOutWoman();
		
		return list;
	}
	public List<ItemDto> getItemListShoe() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListShoe();
		
		return list;
	}
	public List<ItemDto> getItemListShoeMan() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListShoeMan();
		
		return list;
	}
	public List<ItemDto> getItemListShoeWoman() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListShoeWoman();
		
		return list;
	}
	public List<ItemDto> getItemListAcc() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListAcc();
		
		return list;
	}
	public List<ItemDto> getItemListAccMan() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListAccMan();
		
		return list;
	}
	public List<ItemDto> getItemListAccWoman() {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> list = dao.selectListAccWoman();
		
		return list;
	}

	public ItemDto getListView(int idx) {
		
		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		ItemDto item = dao.selectByIdx(idx);
		
		return item;
	}
	
	
	public List<ItemDto> selectByCodyIdx(int codyIdx) {
		
		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		List<ItemDto> item = dao.selectByCodyIdx(codyIdx);
		
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
