package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BoardDao;
import com.bitcamp.cody.dao.ItemDao;
import com.bitcamp.cody.dto.ItemDto;
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

	public int boardInsert(Notice_allDto notiAll) {
		
		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		int resultCnt = dao.insertBoard(notiAll);

		return resultCnt;
	}

	public void countAdd(int count, int idx) {
		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		dao.countAdd(count, idx);

	}

	public Notice_allDto getListView(int idx) {
		
		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		Notice_allDto notiAll = dao.selectByIdx(idx);
		
		return notiAll;
	}

	public int boardUpdate(Notice_allDto notiAll) {

		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		int resultCnt = dao.updateBoard(notiAll); 
		
		return resultCnt;
	}

	public int boardDelete(int idx) {
		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		int result = dao.deleteBoard(idx);

		return result;
	}

}