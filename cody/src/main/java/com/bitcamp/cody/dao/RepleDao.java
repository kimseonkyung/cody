package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.dto.RepleDto;


public interface RepleDao {

	List<RepleDto> selectList(int idx);
	int repleInsert(RepleDto repleDto);
	RepleDto selectByIdx(int idx);
	int re_repleInsert(RepleDto repleDto);
	int maxSelect();
	int reorderPlus(int order, int group);
	int repleDelete(int idx);
	int receptionUpdate();
	int selectReception();
	
}
    