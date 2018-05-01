package com.bitcamp.cody.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BookmarkDao;
import com.bitcamp.cody.dto.BookmarkDto;

public class BookmarkService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private BookmarkDao dao;
	
		

	public int bookmarkReg(BookmarkDto bookmark, HttpServletRequest request) {
		
		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);
		
		int resultCnt = dao.insertBookmark(bookmark);

		System.out.println("실행 후 : " + bookmark.getBookmark_idx());
		
		return resultCnt;
		
		
	}


	public int deleteBookmark(String id) {

		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);

		int result = dao.deleteBookmark(id);

		return result;

	}
	

}
