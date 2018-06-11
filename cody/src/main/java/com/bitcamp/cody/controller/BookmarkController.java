package com.bitcamp.cody.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cody.dto.BookmarkDto;
import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.BookmarkListService;
import com.bitcamp.cody.service.BookmarkService;
import com.bitcamp.cody.service.MemberService;

@Controller
public class BookmarkController {

	@Autowired
	BookmarkService service;

	@Autowired
	BookmarkListService bservice;
	

	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmarkReg(@ModelAttribute BookmarkDto bookmarkVo,Model model, HttpSession session) {

		MemberDto member = (MemberDto) session.getAttribute("loginInfo"); 
		
		int memberIdx = member.getMember_idx();
						
		bookmarkVo.setMember_idx(memberIdx);
				
		int resultCnt = service.insertBookmark(bookmarkVo, session);
		
				
										
		String msg1 = "스크랩 완료! myPage에서 확인하세요.";

		if (resultCnt == 0) {
		
			msg1 = "스크랩 실패! 관리자에게 문의하세요!";
		
		}	

		model.addAttribute("msg1", msg1);
		model.addAttribute("cody_idx", bookmarkVo.getCody_idx());
		model.addAttribute("member_idx", bookmarkVo.getMember_idx());
		model.addAttribute("cody_image", bookmarkVo.getCody_image());		
		System.out.println(msg1.toString()); 
		
		return "cody/bookmarkInsertOk";

	}

	@RequestMapping("/deleteBookmark")
	
	public String deleteBookmark(Model model, @RequestParam("bookmark_idx") int idx, HttpSession session) {
		
		int resultCnt = service.deleteBookmark(idx);

		String msg = "삭제 완료 되었습니다.";

		if (resultCnt == 0)
			msg = "삭제 실패 되었습니다.";

		model.addAttribute("msg", msg);

		System.out.println(msg.toString());

		return "cody/bookmarkOk";
	}

	@RequestMapping(value="/bookmarkList", method=RequestMethod.GET)
	@ResponseBody	
	public String bookmarkList(Model model, HttpSession session) {
		
		MemberDto member = (MemberDto) session.getAttribute("loginInfo");    // 로그인된 사용자 정보 가져오기
		int memberIdx = member.getMember_idx();
		
		List<BookmarkDto> bookmarks = bservice.selectByMemberIdx(memberIdx);
		JSONArray arr = new JSONArray();
		
		for(BookmarkDto bookmark : bookmarks) {
			JSONObject obj = new JSONObject();
			obj.put("bookmark_idx", bookmark.getBookmark_idx());
			obj.put("member_idx", bookmark.getMember_idx());
			obj.put("cody_idx", bookmark.getCody_idx());
			obj.put("cody_image", bookmark.getCody_image());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		
		//List<CodyDto> codys = bservice.CodyList(memberIdx);

		//model.addAttribute("codys", codys);
		//model.addAttribute("bookmarks", bookmarks);

		
		
	
		return arr.toString();

	}

}
