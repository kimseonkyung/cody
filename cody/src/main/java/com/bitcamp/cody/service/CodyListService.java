package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.CodyDao;
import com.bitcamp.cody.dto.CodyDto;


public class CodyListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private CodyDao dao;

	public List<CodyDto> CodyList() {
		dao = sqlSessionTemplate.getMapper(CodyDao.class);

		List<CodyDto> list = dao.selectList();

		return list;

	}

	public CodyDto CodyListView(int idx) {
		dao = sqlSessionTemplate.getMapper(CodyDao.class);

		CodyDto cody = dao.selectByIdx(idx);
		System.out.println("상세보기 : " + cody.toString());

		return cody;
	}

	public List<CodyDto> CodyListSearch(String title) {
		dao = sqlSessionTemplate.getMapper(CodyDao.class);

		List<CodyDto> list = dao.selectByTitle(title);

		return list;
	}

}
