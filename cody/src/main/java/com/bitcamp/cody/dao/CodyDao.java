package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.CodyDto;




public interface CodyDao {

	public int insertCody(CodyDto cody);
	public CodyDto selectByIdx(int cody_idx);
	public List<CodyDto> selectById(String title);
	public List<CodyDto> selectList();
	
	
}

