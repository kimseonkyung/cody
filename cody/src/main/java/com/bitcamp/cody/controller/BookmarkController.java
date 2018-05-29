package com.bitcamp.cody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.BookmarkDto;
import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.service.BookmarkListService;
import com.bitcamp.cody.service.BookmarkService;

@Controller
public class BookmarkController {

	@Autowired
	BookmarkService service;

	@Autowired
	BookmarkListService bservice;

//	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
//	public String bookmark() {
//
//		return "cody/bookmarkInsertOk";
//
//	}

	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmarkReg(@ModelAttribute BookmarkDto bookmarkVo,Model model) {

		int resultCnt = service.insertBookmark(bookmarkVo);
		
										
		String msg1 = "즐겨찾기가 등록되었습니다.";

		if (resultCnt == 0) {
		
			msg1 = "즐겨찾기 등록실패";
		
		}	

		model.addAttribute("msg1", msg1);
		model.addAttribute("cody_idx", bookmarkVo.getCody_idx());
		model.addAttribute("member_idx", bookmarkVo.getMember_idx());
		model.addAttribute("cody_image", bookmarkVo.getCody_image());		
		System.out.println(msg1.toString()); 
		
		return "cody/bookmarkInsertOk";

	}

	@RequestMapping("/deleteBookmark")
	
	public String deleteBookmark(Model model, @RequestParam("bookmark_idx") int idx) {

		int resultCnt = service.deleteBookmark(idx);

		String msg = "삭제 완료 되었습니다.";

		if (resultCnt == 0)
			msg = "삭제 실패 되었습니다.";

		model.addAttribute("msg", msg);

		System.out.println(msg.toString());

		return "cody/bookmarkOk";
	}

	@RequestMapping("/bookmarkList")
	
	public String bookmarkList(Model model) {

		List<BookmarkDto> bookmarks = bservice.BookmarkList();

		List<CodyDto> codys = bservice.CodyList();

		model.addAttribute("bookmarks", bookmarks);

		model.addAttribute("codys", codys);

		return "cody/bookmarkList";

	}

}
