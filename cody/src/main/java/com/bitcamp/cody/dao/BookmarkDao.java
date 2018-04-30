package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.BookMarkDto;

public interface BookmarkDao {

	public BookMarkDto selectById(String id);
	public int insertBookmark(BookMarkDto bookmark);
	public List<BookMarkDto> selectList();
	public int deleteBookmark(String id);
	
	}
