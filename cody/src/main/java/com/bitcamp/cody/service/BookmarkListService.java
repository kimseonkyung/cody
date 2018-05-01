package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BookmarkDao;
import com.bitcamp.cody.dto.BookmarkDto;

public class BookmarkListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private BookmarkDao dao;
	
	public List<BookmarkDto> getBookmarkList(){
	
		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);
		
		List<BookmarkDto> list = dao.selectList();
		
		return list;
		
		
	}
	
	
	
	
}
