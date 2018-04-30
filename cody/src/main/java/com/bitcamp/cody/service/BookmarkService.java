package com.bitcamp.cody.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BookmarkDao;
import com.bitcamp.cody.dto.BookMarkDto;

public class BookmarkService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private BookmarkDao dao;

	public int bookmarkReg(BookMarkDto bookmark, HttpServletRequest request) {
		
		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);
		
		int resultCnt = dao.insertBookmark(bookmark);

		System.out.println("실행 후 : " + bookmark.getBookmark_idx());
		
		return resultCnt;
		
		
	}

	public List<BookMarkDto> getBookmarkList() {

		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);

		List<BookMarkDto> list = dao.selectList();

		return list;

	}

	public BookMarkDto listView(String id) {

		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);

		BookMarkDto bookmark = dao.selectById(id);

		System.out.println("상세보기 : " + bookmark.toString());

		return bookmark;
	}

	public int deleteBookmark(String id) {

		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);

		int result = dao.deleteBookmark(id);

		return result;

	}

}
