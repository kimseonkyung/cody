package com.bitcamp.cody.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/myPage")
	public String mypage() {
		
		return "cody/myPage";
	}

}
