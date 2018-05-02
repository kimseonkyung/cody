package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BoardDao;
import com.bitcamp.cody.dao.BoardPersonDao;
import com.bitcamp.cody.dao.ItemDao;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.Notice_allDto;
import com.bitcamp.cody.dto.Notice_personDto;

public class BoardPersonService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private BoardPersonDao dao;

	public List<Notice_personDto> listAll() {
		dao = sqlSessionTemplate.getMapper(BoardPersonDao.class);

		List<Notice_personDto> list = dao.selectList();

		return list;
	}

	public int boardInsert(Notice_personDto notiPerson) {
		
		dao = sqlSessionTemplate.getMapper(BoardPersonDao.class);
		int resultCnt = dao.insertBoard(notiPerson);

		return resultCnt;
	}

	public void countAdd(int count, int idx) {
		dao = sqlSessionTemplate.getMapper(BoardPersonDao.class);
		dao.countAdd(count, idx);

	}

	public Notice_personDto getListView(int idx) {
		
		dao = sqlSessionTemplate.getMapper(BoardPersonDao.class);
		Notice_personDto notiPerson = dao.selectByIdx(idx);
		
		return notiPerson;
	}

	public int boardUpdate(Notice_personDto notiPerson) {

		dao = sqlSessionTemplate.getMapper(BoardPersonDao.class);
		int resultCnt = dao.updateBoard(notiPerson); 
		
		return resultCnt;
	}

	public int boardDelete(int idx) {
		dao = sqlSessionTemplate.getMapper(BoardPersonDao.class);
		int result = dao.deleteBoard(idx);

		return result;
	}

}