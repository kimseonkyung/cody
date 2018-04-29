package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BoardDao;
import com.bitcamp.cody.dto.Notice_allDto;

public class BoardService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private BoardDao dao;
	
	public List<Notice_allDto> listAll() {
		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		
		List<Notice_allDto> list = dao.selectList();
		
		return list;
	}

}
