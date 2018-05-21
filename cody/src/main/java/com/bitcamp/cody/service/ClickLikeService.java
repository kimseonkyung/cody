package com.bitcamp.cody.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.CodyDao;
import com.bitcamp.cody.dto.CodyDto;

public class ClickLikeService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private CodyDao dao;
	
	
	public int countAdd2(CodyDto cody) {
		
		dao = sqlSessionTemplate.getMapper(CodyDao.class);
		
		int result = dao.countAdd2(cody);
		
		return result;
	}
	
}
