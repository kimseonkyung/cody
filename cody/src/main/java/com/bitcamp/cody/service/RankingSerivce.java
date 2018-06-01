package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.RankingDao;
import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.MemberDto;

public class RankingSerivce {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private RankingDao dao;
	
	public List<CodyDto> getRanking(){
		
		dao = sqlSessionTemplate.getMapper(RankingDao.class);
		
		List<CodyDto> list = dao.selectList();
		
		return list;
	}
	
	public MemberDto getId(int member_idx){
		
		dao = sqlSessionTemplate.getMapper(RankingDao.class);
		
		MemberDto list = dao.selectId(member_idx);
		
		return list;
	}



	
	} 


