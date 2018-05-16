package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import com.bitcamp.cody.dao.LoginDao;
import com.bitcamp.cody.dto.MemberDto;

public class MemberListService {
	
	//@Autowired
	//private MemberMyBatisDao dao;
	//private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private LoginDao dao;
	
	public List<MemberDto> getMemberList(){
		
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		//List<Member> list = dao.selectMembers();
		List<MemberDto> list = dao.selectList();
		
		return list;		
		
	}

	public MemberDto getlistView(String id) {
		
		dao = sqlSessionTemplate.getMapper(LoginDao.class);
		
		MemberDto member = dao.selectById(id);
		System.out.println("상세보기 : " + member.toString());
		
		return member;
	}
	
	
public List<MemberDto> getListSearch(int idx) {
		
		dao = sqlSessionTemplate.getMapper(LoginDao.class);			
		List<MemberDto> list = dao.selectByIdx1(idx);
		
		return list;
	} 
	
	

}
