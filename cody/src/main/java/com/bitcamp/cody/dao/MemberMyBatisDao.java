package com.bitcamp.cody.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dto.MemberDto;

public class MemberMyBatisDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 메퍼의 네임스페이스 지정
	private String ns = "com.bitcamp.cody.mapper.MemberMapper";
		
	public int insertMember(MemberDto member) {		
		return sqlSessionTemplate.update(ns+".insertMember", member);		
	}
	
	public MemberDto selectById(String id) {
		return sqlSessionTemplate.selectOne(ns+".selectById", id);	
	}
	
	public List<MemberDto> selectMembers(){
		//List<Member> members = sqlSessionTemplate.selectList(ns+".selectList");
		
		return sqlSessionTemplate.selectList(ns+".selectList");
	}
	
	
	

}
