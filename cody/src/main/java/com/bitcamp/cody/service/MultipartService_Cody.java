package com.bitcamp.cody.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.bitcamp.cody.dto.CodyDto;


public class MultipartService_Cody {

	public CodyDto multipart(CodyDto cody, HttpSession session) throws IllegalStateException, IOException {

		// 파일 업로드 처리
		
				/*업로드 폴더 시스템 물리적 경로 찾기*/
				String uploadURI = "/uploadfile/codyphoto";
				String dir = session.getServletContext().getRealPath(uploadURI);
				System.out.println(dir);
				
				
				// 업로드 파일의 물리적 저장
				// 파일 저장 : 증명사진.jpg
				// 회원의 사진은 하나만 존재한다.
				// 파일 이름 생성 : 회원아이디_원본파일이름
				if ( !cody.getPhotofile().isEmpty() ) {
					// 새로운 파일 이름 생성 -> 파일 저장 -> DB에 저장할 파일이름 set
					String fileName = cody.getMember_idx()+System.currentTimeMillis()+"_"+cody.getPhotofile().getOriginalFilename();
					cody.getPhotofile().transferTo(new File(dir, fileName));
					cody.setCody_image(fileName);
				}
				
				return cody;
	}

}
