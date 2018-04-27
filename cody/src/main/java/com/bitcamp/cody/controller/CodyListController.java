package com.bitcamp.cody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.service.CodyListService;

public class CodyListController {

	@Autowired
	private CodyListService service;

	@RequestMapping("/codyList")
	public String codyList(Model model) {
		
		List<CodyDto> codys = service.getCodyList();	
		
		model.addAttribute("codys", codys);	
		
		return "cody/codyList";
	}
	
	
	
	
	
	
	
	
	
	
}