package com.bitcamp.cody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.bitcamp.cody.dto.Notice_allDto;
import com.bitcamp.cody.service.BoardService;

@Controller
public class NoticeController {

	@Autowired
	BoardService boardService;
	
	public String boardList(Model model) {
		List<Notice_allDto> list = boardService.listAll();
		
		model.addAttribute("list",list);
		
		return "";
	}
	
	
	
}
