package com.bitcamp.cody.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.RepleDao;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.dto.RepleDto;
import com.bitcamp.cody.dto.TocDto;

public class RepleService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private RepleDao dao;
	
	public RepleDto selectByIdx(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		RepleDto reple = dao.selectByIdx(idx);
		
		return reple;
	}
	
	public List<RepleDto> listAll(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		List<RepleDto> list = dao.selectList(idx);
		
		return list;
	}



	public int repleInsert(RepleDto repleDto) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		/*int max = maxRegroup();
		repleDto.setRegroup(max);*/
		int result = dao.repleInsert(repleDto);
		
		return result;
	} 

	public int re_repleInsert(RepleDto repleDto) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.re_repleInsert(repleDto);
		if(result > 0  ) {
			dao.reorderPlus(repleDto.getReorder(), repleDto.getRegroup());
		}
		return result;
	} 
	
	public int maxRegroup() {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int max = dao.maxSelect();
				
		return max;
	}

	public int repleUpdate(RepleDto reple) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		
		return 0;
	}

	public int repleDelete(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.repleDelete(idx);
		
		return result;
	}

	public int receptionUpdate() {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.receptionUpdate();
		
		return result;
	}
	
	public int selectReception() {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int cnt = dao.selectReception();
		
		return cnt;
	}


	public List<TocDto> noticeList(String user) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		List<TocDto> notice = dao.noticeList(user);
		
		return notice;
	}

	

	
	
	
	
	
	
	
	
	
	
	
	 
}
