package com.bitcamp.cody.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.bitcamp.cody.dao.CodyDao;

import com.bitcamp.cody.dto.CodyDto;

public class CodyService {

	@Autowired

	private SqlSessionTemplate sqlSessionTemplate;

	private CodyDao dao;

	@Autowired
	MultipartService_Cody service;

	public int codyInsert(CodyDto cody, HttpServletRequest request) throws IllegalStateException, IOException {
		dao = sqlSessionTemplate.getMapper(CodyDao.class);

		service.multipart(cody, request);

		System.out.println("실행전 : " + cody);

		// 업로드한 파일의 데이터를 item에 등록

		// dao 요청 : 데이터 저장 요청
		int resultCnt = dao.insertCody(cody);

		System.out.println("실행후 : " + cody);

		return resultCnt;
	}

	public int codyUpdate(CodyDto cody, HttpServletRequest request) throws IllegalStateException, IOException {
		dao = sqlSessionTemplate.getMapper(CodyDao.class);

		service.multipart(cody, request);

		System.out.println("실행전 : " + cody);

		// 업로드한 파일의 데이터를 Member에 등록

		// dao 요청 : 데이터 저장 요청
		int resultCnt = dao.updateCody(cody);

		System.out.println("실행후 : " + cody);

		return resultCnt;
	}

	public int codyDelete(int idx) {
		dao = sqlSessionTemplate.getMapper(CodyDao.class);

		int resultCnt = dao.deleteCody(idx);

		return resultCnt;
	}

}