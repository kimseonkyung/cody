package com.bitcamp.cody.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.CodyListService;
import com.bitcamp.cody.service.ItemListService;

@Controller
public class MypageController {

	@Autowired
	CodyListService codyListService;
	ItemListService itemListService;

	
	@RequestMapping("/myPage")
	public String myPage(Model model, HttpSession session) {
		
		MemberDto member = (MemberDto) session.getAttribute("loginInfo");
		int idx = member.getMember_idx();
		
		List<CodyDto> codys = codyListService.selectByMemberIdx(idx);

		model.addAttribute("codys", codys);
		
		return "cody/myPage";
	}
	
	@RequestMapping("/myPageItem")
	public String myPageItem(Model model, HttpSession session) {

		MemberDto member = (MemberDto) session.getAttribute("loginInfo");
		int idx = member.getMember_idx();
		
		List<ItemDto> items = itemListService.selectByMemberIdx(idx);

		model.addAttribute("items", items);
		
		return "cody/myPageItem";
	}

}
