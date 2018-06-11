package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.CodyTimeListDao;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;

public class CodyItemListService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private CodyTimeListDao dao;
	
	
	public List<ItemDto> getCodyItemList(int cody_idx) { 
		
		dao = sqlSessionTemplate.getMapper(CodyTimeListDao.class);
		List<ItemDto> list = dao.selectList1(cody_idx);
		return list;
 }
 
}
 