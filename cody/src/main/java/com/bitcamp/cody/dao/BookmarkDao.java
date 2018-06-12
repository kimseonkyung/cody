package com.bitcamp.cody.dao;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.cody.dto.BookmarkDto;

public interface BookmarkDao {

	public int insertBookmark(BookmarkDto dto);
	public int deleteBookmark(int idx);
	public BookmarkDto selectByIdx(int idx);
	public List<BookmarkDto> selectList(int memberIdx);
	public List<BookmarkDto> selectByMemberIdx(int memberIdx);
	public int bookmarkCount(int idx);
	public BookmarkDto bookTest(HashMap<String, Object> map);
	public int bookmarkCodyCount(int codyIdx);
	
	
	
	}

