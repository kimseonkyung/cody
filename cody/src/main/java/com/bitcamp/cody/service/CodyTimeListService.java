package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.CodyTimeListDao;
import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.MemberDto;

public class CodyTimeListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private CodyTimeListDao dao;

	public List<CodyDto> getCodyTimeList() {
		dao = sqlSessionTemplate.getMapper(CodyTimeListDao.class);
		List<CodyDto> list = dao.selectList();
		return list; 
	}

    public MemberDto getId(int member_idx){
		
		dao = sqlSessionTemplate.getMapper(CodyTimeListDao.class);
		
		MemberDto list = dao.selectId(member_idx);
		
		return list;
	}
    
    public List<CodyDto> getCodyTimeListMan() {
		dao = sqlSessionTemplate.getMapper(CodyTimeListDao.class);
		List<CodyDto> list = dao.selectListMan();
		return list; 
	}
    
    public List<CodyDto> getCodyTimeListWoman() {
		dao = sqlSessionTemplate.getMapper(CodyTimeListDao.class);
		List<CodyDto> list = dao.selectListWoman();
		return list; 
	}
}	  