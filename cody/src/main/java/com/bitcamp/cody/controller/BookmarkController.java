package com.bitcamp.cody.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.BookmarkDto;
import com.bitcamp.cody.service.BookmarkService;

@Controller
public class BookmarkController {

	@Autowired
	private BookmarkService service;
	
		
	
	@RequestMapping(value="/bookmarkList", method = RequestMethod.GET)
	public String bookmarkList() {
		
		
		return "cody/bookmarkList";
		
		
	}

	@RequestMapping(value = "/bookmarkList", method = RequestMethod.POST)
	public String bookmarkReg(BookmarkDto bookmark, Model model, HttpServletRequest request) {

		System.out.println(bookmark);

		int resultCnt = service.bookmarkReg(bookmark, request);

		String msg = "즐겨찾기가 등록되었습니다.";

		if (resultCnt == 0)
			msg = "즐겨찾기 등록실패";

		model.addAttribute("msg", msg);

		return "cody/bookmarkRegOK";

	}

	@RequestMapping("/bookmark/bookmarkDelete")
	public String deleteBookmark(Model model, @RequestParam("id") String id) {

		int resultCnt = service.deleteBookmark(id);

		String msg = "삭제 완료 되었습니다.";

		if (resultCnt == 0)
			msg = "삭제 실패 되었습니다.";

		model.addAttribute("msg", msg);
		

		return "bookmark/bookmarkUpdateOk";
	}

	

}
