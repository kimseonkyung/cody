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

	@Autowired
	MultipartService_Item service;
	
	private ItemDao dao;

	public int itemInsert(ItemDto item, HttpServletRequest request) throws IllegalStateException, IOException {
		dao = sqlSessionTemplate.getMapper(ItemDao.class);

		service.multipart(item, request);
		System.out.println("실행전 : " + item);
		int resultCnt = dao.insertItem(item);
		System.out.println("실행후 : " + item);

		return resultCnt;
	}

	public int itemUpdate(ItemDto item, HttpServletRequest request) throws IllegalStateException, IOException {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);

		service.multipart(item, request);
		System.out.println("실행전 : " + item);
		int resultCnt = dao.updateItem(item);
		System.out.println("실행후 : " + item);

		return resultCnt;
	}

	public int itemDelete(int idx) {

		dao = sqlSessionTemplate.getMapper(ItemDao.class);
		int result = dao.deleteItem(idx);

		return result;
	}

}
