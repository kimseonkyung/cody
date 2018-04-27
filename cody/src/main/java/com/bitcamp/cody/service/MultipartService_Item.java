package com.bitcamp.cody.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.bitcamp.cody.dto.ItemDto;


public class MultipartService_Item {

	public ItemDto multipart(ItemDto item,  HttpServletRequest request) throws IllegalStateException, IOException {
		
	// 파일 업로드 처리
		
		/*업로드 폴더 시스템 물리적 경로 찾기*/
		String uploadURI = "/uploadfile/itemphoto";
		String dir = request.getSession().getServletContext().getRealPath(uploadURI);
		System.out.println(dir);
		
		
		// 업로드 파일의 물리적 저장
		// 파일 저장 : 증명사진.jpg
		// 회원의 사진은 하나만 존재한다.
		// 파일 이름 생성 : 회원아이디_원본파일이름
		if ( !item.getPhotofile().isEmpty() ) {
			// 새로운 파일 이름 생성 -> 파일 저장 -> DB에 저장할 파일이름 set
			String fileName = item.getItem_name()+"_"+item.getPhotofile().getOriginalFilename();
			item.getPhotofile().transferTo(new File(dir, fileName));
			item.setItem_image(fileName);
		}
		return item;
	}
}
