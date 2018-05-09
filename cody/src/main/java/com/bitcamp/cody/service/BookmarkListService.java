package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BookmarkDao;
import com.bitcamp.cody.dao.CodyDao;
import com.bitcamp.cody.dto.BookmarkDto;
import com.bitcamp.cody.dto.CodyDto;

public class BookmarkListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private BookmarkDao dao;
	
	private CodyDao Cdao;
	
	public List<BookmarkDto> BookmarkList(){
	
		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);
		
		List<BookmarkDto> list = dao.selectList();
		
		return list;
		
		
	}
	
	public List<CodyDto> CodyList(){
		
		Cdao = sqlSessionTemplate.getMapper(CodyDao.class);
		
		List<CodyDto> list = Cdao.selectList();
		
		
		
		return list;
		
		
		
	}
	
	
}
