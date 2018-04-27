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
	
	public List<CodyDto> getCodyList(){
		
		dao = sqlSessionTemplate.getMapper(CodyDao.class);
		
		//List<Member> list = dao.selectMembers();
		List<CodyDto> list = dao.selectList();
		
		return list;		
		
	}
	
	
	

}
