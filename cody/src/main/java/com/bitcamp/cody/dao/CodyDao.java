package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.CodyDto;


public interface CodyDao {

	public int insertCody(CodyDto cody);
	public int deleteCody(int idx);
	public int updateCody(CodyDto cody);
	public CodyDto selectByIdx(int idx);
	public List<CodyDto> selectByMemberIdx(int memberIdx);
	public List<CodyDto> selectByTitle(String title);
	public List<CodyDto> selectList();
	public int countAdd3(CodyDto cody);
	public int countAdd2(CodyDto cody);
	public int maxCodyIdx();
	public int codyCount(int idx);
	
}

