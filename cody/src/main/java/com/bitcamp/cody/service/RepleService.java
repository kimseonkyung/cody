package com.bitcamp.cody.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.BoardDao;
import com.bitcamp.cody.dao.RepleDao;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.dto.RepleDto;

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

	public List<RepleDto> childReple(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		List<RepleDto> list = dao.childReple(idx);

		return list;
	}

	// 첫댓글 저장
	public int repleInsert(RepleDto reple) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int group = maxRegroup();
		reple.setRegroup(group);
		int result = dao.repleInsert(reple);

		return result;
	}

	// 저장된 리스트 가져오기
	public RepleDto selectinfo(RepleDto reple) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		RepleDto lateReple = dao.selectinfo(reple);
		return lateReple;
	}

	// 대댓글 저장
	public int re_repleInsert(RepleDto reple) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.re_repleInsert(reple);
		if (result > 0) {
			reple = dao.selectByIdx(dao.maxIdx());
			System.out.println("reple : " + reple);
			dao.reorderPlus(reple);
		}
		return result;
	}

	public int maxRegroup() {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int max = dao.maxSelect();

		return max;
	}

	public int repleUpdate(RepleDto re) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.repleUpdate(re);

		return result;
	}

	// 댓글 삭제
	public int repleDelete(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.repleDelete(idx);

		return result;
	}
	
	// 코디댓글 전체삭제
	public int repleAllDelete(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.repleAllDelete(idx);
		
		return result;
	}

	
	
	// 알림 확인후 수신여부값 변경
	public int receptionUpdate() {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.receptionUpdate();

		return result;
	}

	// 알림 수신여부 확인하기
	public int selectReception(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int cnt = dao.selectReception(idx);

		return cnt;
	}

	public List<RepleDto> noticeList(int idx, int offset, int noOfRecords) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("idx", idx);
		List<RepleDto> list = dao.noticeList(params);

		return list;
	}

	// 게시물 총 개수
	public int totalCount(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int cnt = dao.totalCnt(idx);

		return cnt;
	}

	public int recepUpdate(int idx) {
		dao = sqlSessionTemplate.getMapper(RepleDao.class);
		int result = dao.recepUpdate(idx);
		
		return result;
	}

}
