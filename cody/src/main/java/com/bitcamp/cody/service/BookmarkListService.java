package com.bitcamp.cody.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BookmarkDao;
import com.bitcamp.cody.dao.CodyDao;
import com.bitcamp.cody.dao.ItemDao;
import com.bitcamp.cody.dto.BookmarkDto;
import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;

public class BookmarkListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private BookmarkDao dao;
	
	private CodyDao Cdao;
	
	public List<BookmarkDto> selectByMemberIdx(int memberIdx){
	
		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);
		
		List<BookmarkDto> list = dao.selectList(memberIdx);
		
		return list;
		
		
	}
	
	public List<CodyDto> CodyList(int memberIdx){
		
		Cdao = sqlSessionTemplate.getMapper(CodyDao.class);
		
		List<CodyDto> list = Cdao.selectByMemberIdx(memberIdx);
		
		
		
		return list;
		
		
		
	}

	public BookmarkDto bookTest(int memberIdx, int codyIdx) {
		
		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberIdx", memberIdx);
		map.put("codyIdx", codyIdx);
		
		BookmarkDto book = dao.bookTest(map);
		
		return book;
	}
	
	public int bookmarkCodyCount(int idx) {
		
		dao = sqlSessionTemplate.getMapper(BookmarkDao.class);
		
		int count = dao.bookmarkCodyCount(idx);
		
		return count;
	}

	
	

	
}
