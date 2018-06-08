package com.bitcamp.cody.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.BookmarkService;
import com.bitcamp.cody.service.CodyListService;
import com.bitcamp.cody.service.FollowService;
import com.bitcamp.cody.service.ItemListService;
import com.bitcamp.cody.service.ItemService;

@Controller
public class MypageController {

	@Autowired
	CodyListService codyListService;
	@Autowired
	ItemService itemService;
	@Autowired
	ItemListService itemListService;
	@Autowired	
	FollowService requestandnresponse;
	@Autowired
	BookmarkService bookmarkService;
	
	
	
	@RequestMapping("/myPage")
	public String myPage(Model model, HttpSession session) {
		
		MemberDto member = (MemberDto) session.getAttribute("loginInfo");
		int idx = member.getMember_idx();
		
		// 마이페이지 정보개수
		int itemCount = itemService.getItemCount(idx);
		int codyCount = codyListService.getCodyCount(idx);
		int followrqCount = requestandnresponse.getfollowrqCount(idx);
		int followrpCount = requestandnresponse.getfollowrpCount(idx);
		int bookmarkCount = bookmarkService.getbookmarkCount(idx);
		
		model.addAttribute("itemCount", itemCount);
		model.addAttribute("codyCount", codyCount);
		model.addAttribute("followrqCount", followrqCount);
		model.addAttribute("followrpCount", followrpCount);
		model.addAttribute("bookmarkCount", bookmarkCount);
		
		
		return "cody/myPage";
	}
	
	// 마이페이지 코디 리스트
	@RequestMapping(value="/myCodyList", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String myCodyList(Model model, HttpSession session) {
		
		MemberDto member = (MemberDto) session.getAttribute("loginInfo");    // 로그인된 사용자 정보 가져오기
		int memberIdx = member.getMember_idx();
		
		List<CodyDto> codys = codyListService.selectByMemberIdx(memberIdx);
		JSONArray arr = new JSONArray();
		
		for (CodyDto cody : codys) {
			JSONObject obj = new JSONObject();
			obj.put("cody_idx", cody.getCody_idx());
			obj.put("cody_image", cody.getCody_image());
			obj.put("cody_title", cody.getCody_title());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	
	// 마이페이지 옷장 리스트
	@RequestMapping(value="/myItemList", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String myItemList(Model model, HttpSession session) {
		
		MemberDto member = (MemberDto) session.getAttribute("loginInfo");    // 로그인된 사용자 정보 가져오기
		int memberIdx = member.getMember_idx();
		
		List<ItemDto> items = itemListService.selectByMemberIdx(memberIdx);
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	
	

}
