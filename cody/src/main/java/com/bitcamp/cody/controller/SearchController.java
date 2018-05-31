package com.bitcamp.cody.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.SearchService;
import com.mysql.fabric.xmlrpc.base.Value;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;

	// 아이템 검색
	@RequestMapping(value = "/searchItem", method = RequestMethod.GET)
	public String itemkeyword (HttpServletRequest request, Value item )
	{
		String keyword1 = request.getParameter("keyword1");
		
		return keyword1;
	}
	
	public String searchItem(Model model, String keyword1) {

		if (keyword1 == null)
			
			return "";

		List<ItemDto> ItemLists = searchService.getSearchItem(keyword1);

		model.addAttribute("ItemLists", ItemLists);
		
		System.out.println("ItemLists: " + ItemLists.toString());

		return "/search/searchItem";
	}

	//코디 검색
	@RequestMapping(value = "/searchCody", method = RequestMethod.GET)
	 public String codykeyword(HttpServletRequest request, Value cody)
	 {
		String keyword2 = request.getParameter("keyword2");
		
		return keyword2;
	}

	public String searchCody(Model model, String keyword2) {
		
		
		if (keyword2 == null)
			return "";

		List<CodyDto> CodyLists = searchService.getSearchCody(keyword2);

		model.addAttribute("CodyLists", CodyLists);
		
		System.out.println("CodyLists : " + CodyLists.toString());

		return "/search/searchCody";
	}

	//회원검색
	@RequestMapping(value = "/searchMember", method = RequestMethod.GET)

	 public String memberkeyword(HttpServletRequest request,Value member)
	 {
		String keyword3 = request.getParameter("keyword3");
		
		return keyword3;
	 }
	 public String searchMember(Model model, String keyword3) {

		if (keyword3 == null)
			return "";

		List<MemberDto> memberLists = searchService.getSearchMember(keyword3);
		
		System.out.println("MemberLsit:"+ memberLists.toString());
		model.addAttribute("MemberLsit" , memberLists);		

		return "/search/searchMember";
	}
}
