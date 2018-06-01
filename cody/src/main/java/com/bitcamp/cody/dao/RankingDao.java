package com.bitcamp.cody.dao;

import java.util.List;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.MemberDto;

public interface RankingDao {

	public List<CodyDto> selectList();
	public MemberDto selectId(int member_idx);
	
}
