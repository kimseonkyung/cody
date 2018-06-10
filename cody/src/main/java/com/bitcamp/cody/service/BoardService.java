package com.bitcamp.cody.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BoardDao;
import com.bitcamp.cody.dto.BoardDto;

public class BoardService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private BoardDao dao;

	// 게시판 리스트
	public List<BoardDto> listAll(int offset, int noOfRecords) {
		dao = sqlSessionTemplate.getMapper(BoardDao.class);

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);

		System.out.println("offset, noOfRecords : " + offset + ", " + noOfRecords);
		List<BoardDto> list = dao.selectList(params);

		return list;
	}

	// 게시글 입력
	public int boardInsert(HashMap<String, String> info) {

		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		int resultCnt = dao.insertBoard(info);

		return resultCnt;
	}

	// 조회수 증가
	public int countAdd(HashMap<String, Object> cnt) {
		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		
		int result = dao.countAdd(cnt);
		
		return result;

	}

	public BoardDto getListView(int idx) {

		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		BoardDto board = dao.selectByIdx(idx);

		return board;
	}

	public int boardUpdate(BoardDto board) {

		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		int resultCnt = dao.updateBoard(board);

		return resultCnt;
	}

	public int boardDelete(int idx) {
		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		int result = dao.deleteBoard(idx);

		return result;
	}

	// 게시물 총 개수
	public int totalCount() {
		dao = sqlSessionTemplate.getMapper(BoardDao.class);
		int cnt = dao.totalCnt();

		return cnt;
	}

}