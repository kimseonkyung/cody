package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.BookmarkDto;

public interface BookmarkDao {

	public int insertBookmark(BookmarkDto bookmark);
	public int deleteBookmark(int idx);
	public BookmarkDto selectByIdx(int idx);
	public List<BookmarkDto> selectList();
	
	
	
	}
