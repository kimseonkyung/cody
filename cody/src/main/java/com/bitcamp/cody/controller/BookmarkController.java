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
import com.bitcamp.cody.service.CodyListService;
import com.bitcamp.cody.service.MemberService;

@Controller
public class BookmarkController {

	@Autowired
	BookmarkService service;

	@Autowired
	BookmarkListService bservice;

	@Autowired
	CodyListService codyListService;
	
	
	

	// 즐겨찾기 추가
	@RequestMapping(value = "/bookmark", method = RequestMethod.POST)
	@ResponseBody
	public String bookmarkReg(BookmarkDto bookmarkVo,Model model) {

		int resultCnt = service.insertBookmark(bookmarkVo);
		
		String msg1 = "스크랩 완료! myPage에서 확인하세요.";

		if (resultCnt == 0) {
		
			msg1 = "스크랩 실패! 관리자에게 문의하세요!";
		
		}	

		return "";

	}

	// 코디 상세보기에서 삭제
	@RequestMapping("/bookmarkDel")
	@ResponseBody
	public String bookmarkDel(Model model, @RequestParam("bookmark_idx") int idx, HttpSession session) {
		
		int resultCnt = service.deleteBookmark(idx);
		
		return "";
	}
	
	// 마이페이지에서 삭제
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
			CodyDto cody = codyListService.CodyListView(bookmark.getCody_idx());
			JSONObject obj = new JSONObject();
			obj.put("bookmark_idx", bookmark.getBookmark_idx());
			obj.put("member_idx", bookmark.getMember_idx());
			obj.put("cody_idx", bookmark.getCody_idx());
			obj.put("cody_image", cody.getCody_image());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		
		//List<CodyDto> codys = bservice.CodyList(memberIdx);

		//model.addAttribute("codys", codys);
		//model.addAttribute("bookmarks", bookmarks);

		
		
	
		return arr.toString();

	}

}
