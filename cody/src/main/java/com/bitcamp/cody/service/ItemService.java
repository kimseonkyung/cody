package com.bitcamp.cody.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.cody.dao.ItemDao;
import com.bitcamp.cody.dto.ItemDto;

public class ItemService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private ItemDao dao;

	@Autowired
	MultipartService_Item service;

	public int itemInsert(ItemDto item, HttpServletRequest request) throws IllegalStateException, IOException {
		dao = sqlSessionTemplate.getMapper(ItemDao.class);

		service.multipart(item, request);

		System.out.println("실행전 : " + item);

		// 업로드한 파일의 데이터를 item에 등록

		// dao 요청 : 데이터 저장 요청
		int resultCnt = dao.insertItem(item);

		System.out.println("실행후 : " + item);

		return resultCnt;
	}

}
