package com.bitcamp.cody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.service.CodyTimeListService;


@Controller
public class CodyTimeListController {

	@Autowired
	CodyTimeListService codyTimeListService;

	/*-------------------------------- 리스트 ------------------------------*/
	@RequestMapping("/codyTimeList")
	public String codyTimeList(Model model) {

		List<CodyDto> codytimes = codyTimeListService.getCodyTimeList();
		
		
		System.out.println("전체리스트 : " + codytimes.toString());
		
		model.addAttribute("codytimes", codytimes);

		return "time/codyTimeList";

	}
}
  