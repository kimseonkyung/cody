package com.bitcamp.cody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.MemberListService;

@Controller
public class MemberListController {
	
	@Autowired
	private MemberListService service;

	// 회원리스트
	@RequestMapping("/member/memberList")
	public String memberList(Model model) {
		
		List<MemberDto> members = service.getMemberList();	
		
		model.addAttribute("members", members);	
		
		return "member/memberList";
	}
	
	// 상세보기
	@RequestMapping("/member/listView")
	public String listView(Model model, @RequestParam("id") String id) {
		
		MemberDto member = service.listView(id);
		
		model.addAttribute("member", member);
		
		
		return "member/listView";
	}
	
	
	
	
	
	
	
}
