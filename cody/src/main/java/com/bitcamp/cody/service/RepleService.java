package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.RepleDao;
import com.bitcamp.cody.dto.RepleDto;

public class RepleService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private RepleDao dao;

	
	public RepleDto selectByIdx(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		RepleDto reple = dao.selectByIdx(idx);
		
		return reple;
	}
	
	public List<RepleDto> listAll(int cIdx, int mIdx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		List<RepleDto> list = dao.selectList(cIdx, mIdx);
		
		return list;
	}



	public int repleInsert(RepleDto repleDto) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.repleInsert(repleDto);
		
		return result;
	} 

	public int re_repleInsert(RepleDto repleDto) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.re_repleInsert(repleDto);
		dao.reorderPlus(repleDto.getReorder(), repleDto.getRegroup());
		
		return result;
	} 
	
	/*public int maxReorder(int order, int group) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int max = dao.maxSelect();
		if(order <= max) {
			int result = dao.reorderPlus(order, group);
		}
		
		return order;
	}*/
	

	
	 
}
