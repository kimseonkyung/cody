package com.bitcamp.cody.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BookmarkDao;
import com.bitcamp.cody.dto.BookmarkDto;

public class BookmarkService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private BookmarkDao dao;
	
		

	public int insertBookmark(BookmarkDto bookmarkVo) {
		
		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);
		
		int resultCnt = dao.insertBookmark(bookmarkVo);
								
		return resultCnt;
		
		
	}


	public int deleteBookmark(int idx) {

		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);

		int result = dao.deleteBookmark(idx);

		return result;

	}




	

}
