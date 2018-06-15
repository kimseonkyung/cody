package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.SearchDao;
import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;

public class SearchService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private SearchDao dao;
	
	
	//아이템 검색	
	public List<ItemDto> getSearchItem(String keyword1)
	{
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		List<ItemDto> itemlist = dao.searchItem(keyword1);
		
		return itemlist;
					
		}
	
	public List<ItemDto> getSearchItemMan()
	{
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		List<ItemDto> itemlist = dao.searchItemMan();
		
		return itemlist;
					
		}
	
	public List<ItemDto> getSearchItemWoman()
	{
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		List<ItemDto> itemlist = dao.searchItemWoman();
		
		return itemlist;
					
		}
	
	//코디 검색
	public List<CodyDto> getSearchCody(String keyword2)
	{
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		List<CodyDto> codylist = dao.searchCody(keyword2);
		
		return codylist;
					
		}
	
	public List<CodyDto> getSearchCodyMan()
	{
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		List<CodyDto> codylist = dao.searchCodyMan();
		
		return codylist;
					
		}
	
	public List<CodyDto> getSearchCodyWoman()
	{
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		List<CodyDto> codylist = dao.searchCodyWoman();
		
		return codylist;
					
		}
	
	//회원검색
	public List<MemberDto> getSearchMember(String keyword3)
	{
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		List<MemberDto> memberlist = dao.searchMember(keyword3);
		
		return memberlist;
					
		}
	public List<MemberDto> getSearchMemberMan()
	{
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		List<MemberDto> memberlist = dao.searchMemberMan();
		
		return memberlist;
					
		}
	public List<MemberDto> getSearchMemberWoman()
	{
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		List<MemberDto> memberlist = dao.searchMemberWoman();
		
		return memberlist;
					
		}
	
	//멤버 값 뽑기
     public MemberDto getId(int member_idx){
		
		dao = sqlSessionTemplate.getMapper(SearchDao.class);
		
		MemberDto list = dao.selectId(member_idx);
		
		return list;
	}



}
