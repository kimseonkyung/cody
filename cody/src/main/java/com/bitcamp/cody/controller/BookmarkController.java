package com.bitcamp.cody.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.BookmarkDto;
import com.bitcamp.cody.service.BookmarkListService;
import com.bitcamp.cody.service.BookmarkService;


@Controller
public class BookmarkController {

	@Autowired
	BookmarkService service;
	
	@Autowired
	BookmarkListService bservice;
	

	
		
	@RequestMapping(value="/bookmark", method = RequestMethod.GET)
	public String bookmark() {
		
		
		return "cody/bookmark";
		
		
	}

	@RequestMapping(value = "/bookmark", method = RequestMethod.POST)
	public String bookmarkReg(BookmarkDto bookmark, Model model, HttpServletRequest request) {

		System.out.println(bookmark);

		int resultCnt = service.bookmarkInsert(bookmark, request);

		String msg = "즐겨찾기가 등록되었습니다.";

		if (resultCnt == 0)
			msg = "즐겨찾기 등록실패";

		model.addAttribute("msg", msg);

		return "cody/bookmarkRegOK";

	}

	@RequestMapping("/deleteBookmark")
	public String deleteBookmark(Model model, @RequestParam("bookmark_idx") int idx) {

		int resultCnt = service.deleteBookmark(idx);

		String msg = "삭제 완료 되었습니다.";

		if (resultCnt == 0)
			msg = "삭제 실패 되었습니다.";

		model.addAttribute("msg", msg);
		

		System.out.println(msg.toString());
		
		return "cody/bookmarkRegOk";
	}
	
	@RequestMapping("/bookmarkList")
	public String bookmarkList(Model model) {
		
		List<BookmarkDto> bookmarks = bservice.BookmarkList();
		
		model.addAttribute("bookmarks", bookmarks);
		
				
		return "cody/bookmarkList";
		
		
	}

	
	

}
