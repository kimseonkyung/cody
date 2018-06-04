package com.bitcamp.cody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;

/*	// 아이템검색 뷰로 이동
	@RequestMapping("/searchItem")

	public String serachItem(Model model) {

		return "search/searchItem";
	}
*/
	// 아이템 검색
	@RequestMapping(value = "/itemInfo", method = RequestMethod.GET)

	public String searchItemInfo(Model model, @RequestParam(value = "keyword1", required = false) String keyword1) {

		if (keyword1 == null)

			return "search/itemInfo";

		List<ItemDto> ItemLists = searchService.getSearchItem(keyword1);

		model.addAttribute("ItemLists", ItemLists);
	
		System.out.println("ItemLists: " + ItemLists.toString());
		

		return "search/itemInfo";
	}

	// 코드 검색 뷰로 이동
/*
	@RequestMapping("/searchCody")
	public String searchcody(Model model) {

		return "search/searchCody";

	}*/

	// 코디 검색
	@RequestMapping(value = "/codyInfo", method = RequestMethod.GET)

	public String searchCodyInfo(Model model, @RequestParam(value = "keyword2", required = false) String keyword2) {

		if (keyword2 == null)
			return "search/codyInfo";

		List<CodyDto> CodyLists = searchService.getSearchCody(keyword2);

		model.addAttribute("CodyLists", CodyLists);

		System.out.println("CodyLists : " + CodyLists.toString());

		return "search/codyInfo";
	}

/*	// 회원 검색 뷰로 이동
	@RequestMapping("/searchMember")
	public String searchMember(Model model) {

		return "search/searchMember";
	}
*/
	// 회원검색
	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public String searchMemberInfo(Model model, @RequestParam(value = "keyword3", required = false) String keyword3) {

		if (keyword3 == null) {
			return "search/memberInfo";
		}
		List<MemberDto> memberLists = searchService.getSearchMember(keyword3);

		System.out.println("MemberLsit:" + memberLists.toString());
		model.addAttribute("MemberLsit", memberLists);

		return "search/memberInfo";
	}
}
