package com.bitcamp.cody.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.service.ClickLikeService;

@Controller
public class ClickLikeController {

	@Autowired
	ClickLikeService clickLikeService;
	
	//좋아요  조회수 증가
	@RequestMapping("/clickLike")
	@ResponseBody
	public String clickLike(Model model,CodyDto cody) {
		
		System.out.println(cody);
			
		int result = clickLikeService.countAdd2(cody);
		

		return "";
		
		
	}
	
}
