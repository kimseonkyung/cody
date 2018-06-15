package com.bitcamp.cody.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.CodyItemListService;
import com.bitcamp.cody.service.CodyTimeListService;
import com.bitcamp.cody.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	@Autowired
	CodyTimeListService codyTimeListService;
	@Autowired
	CodyItemListService codyItemListService;

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
	
	@RequestMapping(value = "/itemInfoMan", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String searchItemInfoMan(Model model) {

		List<ItemDto> ItemLists = searchService.getSearchItemMan();
        JSONArray arr = new JSONArray();
		
		for (ItemDto list : ItemLists) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", list.getItem_idx());
			obj.put("item_photo", list.getItem_image());
			obj.put("item_name", list.getItem_name());
			obj.put("item_price", list.getItem_price());
			obj.put("item_category", list.getItem_category());
			arr.put(obj);
		}

        System.out.println("arr : " + arr);		
		
		return arr.toString();
	}
	
	@RequestMapping(value = "/itemInfoWoman", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String searchItemInfoWoman(Model model) {

		List<ItemDto> ItemLists = searchService.getSearchItemWoman();
		JSONArray arr = new JSONArray();
		
		for (ItemDto list : ItemLists) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", list.getItem_idx());
			obj.put("item_photo", list.getItem_image());
			obj.put("item_name", list.getItem_name());
			obj.put("item_price", list.getItem_price());
			obj.put("item_category", list.getItem_category());
			arr.put(obj);
		}

        System.out.println("arr : " + arr);		
		
		return arr.toString();
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
		ArrayList<HashMap<Object, Object>> irr = new ArrayList<>();
		
		for (CodyDto list : CodyLists) {
			MemberDto member = searchService.getId(list.getMember_idx());
			HashMap<Object, Object> map = new HashMap<>();
			List<ItemDto> itemtime = new ArrayList<>();		
			itemtime = codyItemListService.getCodyItemList(list.getCody_idx());
			map.put(list.getCody_idx(),itemtime);	
			map.put("cody_title",list.getCody_title());
			map.put("cody_image",list.getCody_image());
			map.put("cody_idx",list.getCody_idx());	
			map.put("cody_age", list.getCody_age());
			map.put("cody_height",list.getCody_height());
			map.put("member_id", member.getMember_id() );
			map.put("member_idx", list.getMember_idx() );
			map.put("member_photo", member.getMember_photo() );
			map.put(list, itemtime);
			map.put("itemtime", itemtime);
			irr.add(map);
			
		}
		model.addAttribute("list", CodyLists);
		model.addAttribute("irr", irr);

		System.out.println("irr : " + irr.toString());

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
	
	@RequestMapping(value = "/memberInfoMan", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String searchMemberInfoMan(Model model) {

		List<MemberDto> memberLists = searchService.getSearchMemberMan();
		JSONArray arr = new JSONArray();
		
		for (MemberDto member : memberLists) {
			JSONObject obj = new JSONObject();
			obj.put("member_idx", member.getMember_idx());
			obj.put("member_photo", member.getMember_photo());
			obj.put("member_id", member.getMember_id());
			arr.put(obj);
		}

        System.out.println("arr : " + arr);		
		
		return arr.toString();
	}
	
	@RequestMapping(value = "/memberInfoWoman", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String searchMemberInfoWoman(Model model) {

		List<MemberDto> memberLists = searchService.getSearchMemberWoman();
		
		JSONArray arr = new JSONArray();
		
		for (MemberDto member : memberLists) {			
			JSONObject obj = new JSONObject();
			obj.put("member_idx", member.getMember_idx());
			obj.put("member_photo", member.getMember_photo());
			obj.put("member_id", member.getMember_id());
			arr.put(obj);
		}

        System.out.println("arr : " + arr);		
		
		return arr.toString();
	}
}
