package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.Notice_allDto;

public interface BoardDao {

	List<Notice_allDto> selectList();
	int insertBoard(Notice_allDto notiAll);
	void countAdd(int count, int idx);
	Notice_allDto selectByIdx(int idx);
	int updateBoard(Notice_allDto notiAll);
	int deleteBoard(int idx);
	

}