package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.Notice_allDto;
import com.bitcamp.cody.dto.Notice_personDto;

public interface BoardPersonDao {

	List<Notice_personDto> selectList();
	int insertBoard(Notice_personDto notiAll);
	void countAdd(int count, int idx);
	Notice_personDto selectByIdx(int idx);
	int updateBoard(Notice_personDto notiAll);
	int deleteBoard(int idx);
	

}