package com.bitcamp.cody.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.service.CodyItemListService;
import com.bitcamp.cody.service.CodyTimeListService;

@Controller
public class CodyTimeListController {

	@Autowired
	CodyTimeListService codyTimeListService;

	@Autowired
	CodyItemListService codyItemListService;

	/* -------------------------------- 리스트 ------------------------------ */
	@RequestMapping("/codyTimeList")

	public String codyTimeList(Model model) {
		
		List<CodyDto> codytimes = codyTimeListService.getCodyTimeList();
		ArrayList<HashMap<Object, Object>> irr = new ArrayList<>();

		for (CodyDto time : codytimes) {	
			
			HashMap<Object, Object> map = new HashMap<>();
			List<ItemDto> itemtime = new ArrayList<>();		
			itemtime = codyItemListService.getCodyItemList(time.getCody_idx());
			map.put(time.getCody_idx(),itemtime);	
			map.put("codyid",time.getCody_title());
			map.put("codyimage",time.getCody_image());
			irr.add(map);		
		}
		System.out.println("irr : " + irr.toString());
		
		model.addAttribute("irr", irr);
		return "time/codyTimeList";
	}
}
