package com.bitcamp.cody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cody.dto.BookMarkDto;
import com.bitcamp.cody.service.BookmarkListService;

public class BookmarkListController {

	@Autowired
	private BookmarkListService service;
	
	@RequestMapping("/bookmarkList")
	public String bookmarkList(Model model) {
		
		List<BookMarkDto> bookmarks = service.getBookmarkList();
		
		model.addAttribute("bookmarks", bookmarks);
		
		
		return "cody/bookmarkList";
		
		
	}
	
}
