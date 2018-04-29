package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.Notice_allDto;

public interface BoardDao {

	List<Notice_allDto> selectList();

}
