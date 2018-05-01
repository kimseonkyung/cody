package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.BookmarkDto;

public interface BookmarkDao {

	public BookmarkDto selectById(String id);
	public int insertBookmark(BookmarkDto bookmark);
	public List<BookmarkDto> selectList();
	public int deleteBookmark(String id);
	
	}
