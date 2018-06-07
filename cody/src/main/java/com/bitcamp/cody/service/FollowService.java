package com.bitcamp.cody.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.FollowDao;
import com.bitcamp.cody.dto.FollowDto;
import com.bitcamp.cody.dto.MemberDto;

public class FollowService {

	@Autowired

	private SqlSessionTemplate sqlSessionTemplate;

	private FollowDao dao;

	public int insertFollow(HashMap map) {

		dao = sqlSessionTemplate.getMapper(FollowDao.class);

		int resultfollw = dao.insertfollowin(map);

		return resultfollw;

	}

	public List<FollowDto> getListrespons(int m_response) {

		dao = sqlSessionTemplate.getMapper(FollowDao.class);

		List<FollowDto> list = dao.selectListrp(m_response);

		return list;

	}

	public MemberDto selectrequest(int m_request) {

		dao = sqlSessionTemplate.getMapper(FollowDao.class);

		MemberDto request = dao.selectrequet(m_request);

		return request;
	}

	public int getfollowUpdate(HashMap map) {
		
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
		
		int update = dao.updatefollow(map);
		
		return update;
	}

	public int getdeleteFollow(int followidx) {
		
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
		
		int delete = dao.deletefollow(followidx);
		
		return delete;
	}

	public List<FollowDto> getListrequet(int m_request) {
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
		
		List<FollowDto> list = dao.selectListrq(m_request);
		return list;
	}

	public MemberDto selectresponse(int m_reseponse) {
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
		
		MemberDto list = dao.selectresponse(m_reseponse);
		return list;
	}

	public int getfollowrqCount(int m_request) {
		
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
		int result = dao.followrqCount(m_request);
		return result;
	}

	public int getfollowrpCount(int m_response) {
		dao =sqlSessionTemplate.getMapper(FollowDao.class);
		int result = dao.followrpCount(m_response);
		return result;
	}

	public FollowDto selectinfo() {
		dao = sqlSessionTemplate.getMapper(FollowDao.class);
		FollowDto result = dao.selectfollowinfos();
		return result;
	}


}
