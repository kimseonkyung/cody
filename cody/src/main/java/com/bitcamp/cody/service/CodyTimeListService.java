package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.CodyTimeListDao;
import com.bitcamp.cody.dto.CodyDto;

public class CodyTimeListService {
	
	@Autowired	
	private SqlSessionTemplate sqlSessionTemplate;
	
	private CodyTimeListDao dao;

	public List<CodyDto> getCodyTimeList() {
		dao = sqlSessionTemplate.getMapper(CodyTimeListDao.class);
		List<CodyDto> list = dao.selectList();
		return list;
	}	

}
  