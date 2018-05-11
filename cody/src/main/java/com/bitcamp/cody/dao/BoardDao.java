package com.bitcamp.cody.dao;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.cody.dto.BoardDto;

public interface BoardDao {

	List<BoardDto> selectList(HashMap<String, Object> info);
	int insertBoard(HashMap<String, String> info);
	int countAdd(HashMap<String, Object> cnt);
	BoardDto selectByIdx(int idx);
	int updateBoard(BoardDto board);
	int deleteBoard(int idx);
	int totalCnt();
	

}