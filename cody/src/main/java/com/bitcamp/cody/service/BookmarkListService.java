package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BookmarkDao;
import com.bitcamp.cody.dto.BookMarkDto;

public class BookmarkListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private BookmarkDao dao;
	
	public List<BookMarkDto> getBookmarkList(){
	
		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);
		
		List<BookMarkDto> list = dao.selectList();
		
		return list;
		
		
	}
	
	
	
}
